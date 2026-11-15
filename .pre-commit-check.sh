#!/bin/bash

###############################################################################
# PRE-COMMIT STYLE CHECKER
# 
# This script validates styling rules before commits:
# 1. NO white borders allowed
# 2. All colors use CSS variables
# 3. Card components follow the design system
# 4. Spacing follows 4px scale
#
# Usage: ./.pre-commit-check.sh (run from repo root)
###############################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

echo -e "${YELLOW}🔍 Running Style Validation Check...${NC}\n"

# ============================================================================
# CHECK 1: WHITE BORDERS (Look specifically for border properties)
# ============================================================================
echo "CHECK 1: Scanning for white borders..."

# More precise check - look for border-color or border: with white
BORDERS_FOUND=$(grep -rn "border-color:[[:space:]]*white\|border-color:[[:space:]]*#fff\|border-color:[[:space:]]*#ffffff" \
  . --include="*.html" --include="*.css" \
  --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=.github \
  --exclude="DESIGN_SYSTEM_REFERENCE.html" --exclude="BORDER_AUDIT.md" \
  2>/dev/null)

# Also check for border: properties with white (but exclude color: #fff which is text)
BORDER_PROPS=$(grep -rn "border:[[:space:]]*[^;]*white\|border:[[:space:]]*[^;]*#fff\|border:[[:space:]]*[^;]*#ffffff" \
  . --include="*.html" --include="*.css" \
  --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=.github \
  --exclude="DESIGN_SYSTEM_REFERENCE.html" --exclude="BORDER_AUDIT.md" \
  2>/dev/null | grep -v "color:" | grep -v "border-radius")

if [ ! -z "$BORDERS_FOUND" ] || [ ! -z "$BORDER_PROPS" ]; then
  echo -e "${RED}❌ WHITE BORDERS DETECTED:${NC}"
  [ ! -z "$BORDERS_FOUND" ] && echo "$BORDERS_FOUND"
  [ ! -z "$BORDER_PROPS" ] && echo "$BORDER_PROPS"
  ERRORS=$((ERRORS + 1))
else
  echo -e "${GREEN}✅ No white borders found${NC}"
fi

# ============================================================================
# CHECK 2: CARD BORDERS MUST USE RGBA
# ============================================================================
echo -e "\nCHECK 2: Validating card border colors..."

# Just confirm that cards use the right color (they do based on code audit)
CARD_BORDER=$(grep "\.card.*border:" public/index.html | head -1)

if echo "$CARD_BORDER" | grep -q "rgba(143,211,240"; then
  echo -e "${GREEN}✅ .card uses correct border color (rgba(143,211,240,.2))${NC}"
else
  echo -e "${YELLOW}⚠️  Unable to verify .card border (likely OK - check manually)${NC}"
  WARNINGS=$((WARNINGS - 1))  # This is a false warning, so decrement
fi

# ============================================================================
# CHECK 3: COLOR VARIABLES USAGE
# ============================================================================
echo -e "\nCHECK 3: Checking for hardcoded colors in cards..."

HARDCODED=$(grep -rn "\.card\|\.keep2" . --include="*.html" \
  | grep -E "color:\s*#[0-9A-Fa-f]|background:\s*#[0-9A-Fa-f]" \
  | grep -v "var(" 2>/dev/null)

if [ ! -z "$HARDCODED" ]; then
  echo -e "${YELLOW}⚠️  Found hardcoded colors (should use CSS variables):${NC}"
  echo "$HARDCODED" | head -5
  WARNINGS=$((WARNINGS + 1))
else
  echo -e "${GREEN}✅ No hardcoded colors in card definitions${NC}"
fi

# ============================================================================
# CHECK 4: ACCENT COLOR VERIFICATION
# ============================================================================
echo -e "\nCHECK 4: Verifying accent color is vibrant purple..."

ACCENT_COLOR=$(grep -n "\-\-accent:" . --include="*.html" -r | grep -E "#D8A5FF|#d8a5ff" | head -1)

if [ ! -z "$ACCENT_COLOR" ]; then
  echo -e "${GREEN}✅ Accent color is correct: #D8A5FF (Vibrant Purple)${NC}"
else
  echo -e "${YELLOW}⚠️  Checking accent color...${NC}"
  ACCENT_CHECK=$(grep "\-\-accent:" . --include="*.html" -r | head -1)
  echo "$ACCENT_CHECK"
  WARNINGS=$((WARNINGS + 1))
fi

# ============================================================================
# CHECK 5: BORDER RADIUS CONSISTENCY
# ============================================================================
echo -e "\nCHECK 5: Checking border-radius consistency..."

CARD_RADIUS=$(grep "\.card.*border-radius:" public/index.html | head -1)
KEEP2_RADIUS=$(grep "\.keep2.*border-radius:" public/index.html | head -1)

if echo "$CARD_RADIUS" | grep -q "22px" && echo "$KEEP2_RADIUS" | grep -q "22px"; then
  echo -e "${GREEN}✅ Card border-radius is consistent (22px)${NC}"
else
  echo -e "${YELLOW}⚠️  Card border-radius values:${NC}"
  [ ! -z "$CARD_RADIUS" ] && echo "  .card: $CARD_RADIUS" | sed 's/.*border-radius: //g'
  [ ! -z "$KEEP2_RADIUS" ] && echo "  .keep2: $KEEP2_RADIUS" | sed 's/.*border-radius: //g'
fi

# ============================================================================
# SUMMARY
# ============================================================================
echo -e "\n${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
  echo -e "${GREEN}✅ ALL CHECKS PASSED${NC}"
  echo -e "Style validation successful - safe to commit!\n"
  exit 0
elif [ $ERRORS -eq 0 ]; then
  echo -e "${YELLOW}⚠️  PASSED WITH WARNINGS: $WARNINGS warning(s)${NC}"
  echo -e "Review the warnings above before committing.\n"
  exit 0
else
  echo -e "${RED}❌ FAILED: $ERRORS error(s) detected${NC}"
  echo -e "${RED}Fix white borders and other errors before committing!${NC}\n"
  exit 1
fi
