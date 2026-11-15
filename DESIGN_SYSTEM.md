# AXD Studio Design System & Guidelines

## 🚨 CRITICAL RULES - READ FIRST

### ⚠️ ZERO-TOLERANCE ENFORCEMENT

**IF YOU ADD A WHITE BORDER TO A CARD, IT WILL BE REJECTED IN CODE REVIEW.**

| Rule | Status | Why |
|------|--------|-----|
| **NO WHITE BORDERS (#fff)** | ❌ STRICTLY FORBIDDEN | Breaks elegant design, looks harsh and unprofessional |
| **ALL card borders MUST be rgba(143,211,240,.2)** | ✅ MANDATORY | Subtle, sophisticated, maintains visual hierarchy |
| **Accent color is #D8A5FF (vibrant purple)** | ✅ MANDATORY | Replaces old orange; all UI elements must reflect this |
| **All colors via CSS variables** | ✅ MANDATORY | Prevents inconsistency; no hardcoded hex in elements |
| **Border-radius for cards must be 22px** | ✅ MANDATORY | Establishes visual consistency and elegance |

### Pre-Commit Validation
Run before every commit:
```bash
./.pre-commit-check.sh
```
This checks:
- ❌ Zero white borders
- ✅ Card borders are `rgba(143,211,240,.2)`
- ✅ Accent color is `#D8A5FF`
- ✅ All colors use variables
- ✅ Border-radius consistent

**COMMIT WILL FAIL if checks don't pass.** Fix the errors and try again.

---

## Overview
This document establishes design rules, layout standards, and styling guidelines to ensure consistency and elegance across all AXD interfaces. All components, pages, and features must adhere to these standards.

---

## 1. Color Palette & Usage Rules

### Primary Colors (Dark Mode)
```css
--bg:          #050F18   /* Deep navy background */
--surface:     #0A1D2B   /* Mid-level surface */
--surface-raised: #0E2638 /* Elevated surface */
--ink:         #EEF7FB   /* Primary text (light) */
--muted:       #AFC2CC   /* Secondary text, reduced contrast */
--blue:        #007EB4   /* Primary action color */
--sky:         #8FD3F0   /* Accent/highlight color */
--accent:      #D8A5FF   /* Vibrant light purple accent */
```

### Color Usage Rules
| Color | Usage | Examples |
|-------|-------|----------|
| `--bg` | Page/section backgrounds only | Body, main container |
| `--surface` | Card backgrounds, panels | Container backgrounds |
| `--surface-raised` | Elevated surfaces, overlays | Modals, toasts |
| `--ink` | Primary text, headings | All body text, labels |
| `--muted` | Secondary text, descriptions | Help text, metadata |
| `--blue` | Primary buttons, links, actions | CTA buttons, primary interactions |
| `--sky` | Highlights, emphasis, hover states | Highlights, focus outlines |
| `--accent` | Section titles, category labels, highlights | Card titles, eyebrow text, form labels |

### Color Application Rules - NO EXCEPTIONS
- **NEVER use white (#fff) for borders** → Use `rgba(143,211,240,.2)` (subtle sky tint) ONLY
- **NEVER use bright colors for body text** → Use `--ink` or `--muted` only
- **Accent color (#D8A5FF vibrant purple) is for visual hierarchy only** → Use on titles, labels, eyebrows (sparingly)
- **Focus outlines must use `--sky`** → Minimum 2px solid, 2-3px offset
- **Gradients should use dark blues** → `rgba(14,38,56,.96)` to `rgba(7,23,35,.98)`
- **ALL card borders must be `rgba(143,211,240,.2)`** → No exceptions, no white, no other colors

---

## 2. Typography Standards

### Font Family Stack
```css
Headings:     "Red Hat Display", "Segoe UI", system-ui, sans-serif
Body/Labels:  "Red Hat Text", "Segoe UI", system-ui, sans-serif
Monospace:    "Red Hat Mono", ui-monospace, monospace
```

### Font Sizing & Hierarchy

| Level | Size | Weight | Line-Height | Usage |
|-------|------|--------|-------------|-------|
| h1 | clamp(2.7rem, 6vw, 5rem) | 700 | 0.99 | Page titles, hero text |
| h2 | clamp(1.7rem, 3vw, 2.2rem) | 650 | 1.1 | Card headings, section titles |
| h3 | 1.1rem | 600 | 1.4 | Subsection titles |
| Body | 0.92rem–1rem | 400 | 1.6 | Paragraph text, descriptions |
| Label | 0.83rem | 600 | 1.4 | Form labels, field titles |
| Eyebrow | 0.72rem | 600 | 1.3 | Overline text, category labels |
| Small | 0.78rem | 400 | 1.4 | Helper text, metadata |

### Typography Rules
- **H1 must use `letter-spacing: -.055em`** → Tighter for impact
- **All headings use `letter-spacing: -.035em`** → Slightly condensed for elegance
- **Body text minimum `line-height: 1.6`** → For readability
- **Eyebrow text must be `text-transform: uppercase`** → Category/section labels
- **Labels must have `font-weight: 600`** → Clear visual distinction
- **Never use text smaller than 0.72rem** → Accessibility requirement

### Color Application for Text
| Text Type | Color | Weight |
|-----------|-------|--------|
| Headings | `--accent` (#D8A5FF) | 600–700 |
| Body | `--ink` | 400 |
| Secondary | `--muted` | 400 |
| Eyebrow/Label | `--accent` (#D8A5FF) | 600 |
| Error | #FFB4AB | 400 |
| Interactive (hover) | `--sky` | inherit |

---

## 3. Spacing & Sizing Standards

### Base Spacing Unit
All spacing uses **4px increments** or `clamp()` for responsive scaling.

### Standard Spacing Values
```css
xs:  4px
sm:  8px
md:  12px
lg:  16px
xl:  24px
2xl: 32px
3xl: 40px
4xl: 48px
5xl: 64px
6xl: 92px
```

### Component Spacing Rules

**Cards**
```css
padding:       24px (or clamp(24px, 4vw, 38px))
border-radius: 22px
margin-bottom: 24px or 32px (between cards)
gap:           12px (internal elements)
border:        1px solid rgba(143,211,240,.2)  /* ALWAYS THIS - NEVER WHITE */
```

**Form Elements**
```css
min-height:    48px (buttons, inputs)
padding:       12px 14px (inputs)
label gap:     9px (icon to text)
margin-bottom: 13px (between form fields)
```

**Container/Section**
```css
max-width:     1120px
padding:       clamp(24px, 5vw, 64px) (sides)
gap:           clamp(36px, 7vw, 92px) (between sections)
```

### Spacing Rules
- **Never use arbitrary spacing values** → Only use the standard scale above
- **Grid gaps must be consistent** → Use `gap` property, not margins
- **Padding and margins should never exceed 5% viewport width** → Use `clamp()` for responsiveness
- **Minimum touch target: 48px × 48px** → For buttons and interactive elements

---

## 4. Component Patterns & Standards

### Card Component - CRITICAL: NO WHITE BORDERS
```css
.card {
  width: 100%;
  padding: clamp(24px, 4vw, 38px);
  border: 1px solid rgba(143,211,240,.2);  /* REQUIRED - NOT WHITE */
  border-radius: 22px;
  background: linear-gradient(145deg, rgba(14,38,56,.96), rgba(7,23,35,.98));
  box-shadow: 0 24px 80px -32px rgba(0,0,0,.8), 0 0 0 1px rgba(0,126,180,.06);
}
```

**⚠️ CRITICAL ENFORCEMENT:**
- ANY card with white border (`#fff`, `white`, or hex-white) is a **STYLING BUG**
- ALL cards must use `rgba(143,211,240,.2)` - NO EXCEPTIONS
- Review cards in Ways of Working, Intelligent Workspace, and all other sections

**Card Variations:**
- `.card.keep2` - Special style for "Ways of Working" cards (same border rule)
- `.card-top` - For metadata/labels above card content
- `.card-title` / `.keep2-title` - Heading with `--accent` color (#D8A5FF)
- `.card-text` / `.keep2-text` - Body text with `--muted` color

### Button Component
```css
button {
  min-height: 48px;
  padding: 12px 18px;
  border: 1px solid #168AB9;
  border-radius: 10px;
  background: var(--blue);
  color: #fff;  /* WHITE TEXT IS OK FOR DARK BUTTONS */
  font: 600 0.92rem "Red Hat Text", sans-serif;
  cursor: pointer;
  transition: background-color .16s, transform .16s;
}

button:hover {
  transform: translateY(-1px);
  background: #0A8EC5;
}

button:focus-visible {
  outline: 2px solid var(--sky);
  outline-offset: 3px;
}

button[disabled] {
  opacity: 0.6;
  cursor: progress;
}
```

### Input Component
```css
input[type=password] {
  width: 100%;
  min-height: 48px;
  padding: 12px 14px;
  border: 1px solid rgba(143,211,240,.24);
  border-radius: 10px;
  background: #061520;
  color: var(--ink);
  font: inherit;
}

input:focus {
  outline: 2px solid var(--sky);
  outline-offset: 2px;
  border-color: var(--sky);
}
```

### Label Component
```css
label {
  color: var(--accent);  /* #D8A5FF - VIBRANT PURPLE */
  font-size: 0.83rem;
  font-weight: 600;
  display: block;
  margin-bottom: 8px;
}
```

### Error Message
```css
.err {
  min-height: 1.2em;
  color: #FFB4AB;
  font-size: 0.82rem;
  line-height: 1.45;
  margin-top: 6px;
}
```

---

## 5. Borders & Shadows Standards

### Border Rules - STRICTLY ENFORCED
| Type | Rule | Example | ❌ NEVER |
|------|------|---------|----------|
| **Light borders** | `1px solid rgba(143,211,240,.2)` | Card borders, dividers | White, hard, arbitrary colors |
| **Focus outlines** | `2px solid var(--sky)` with `3px offset` | Button focus, input focus | No focus, white outline |
| **Interactive borders** | `1px solid rgba(143,211,240,.24)` | Form inputs, hover states | Hard edges, white, bright colors |
| **NO white borders** | ❌ FORBIDDEN | - | Never `#fff`, `white`, or light colors |
| **NO hard borders** | ❌ FORBIDDEN | - | Never `1px solid #000` or pure black |

### Shadow Rules
| Type | Rule | Usage |
|------|------|-------|
| **Card shadow** | `0 24px 80px -32px rgba(0,0,0,.8), 0 0 0 1px rgba(0,126,180,.06)` | Cards, elevated surfaces |
| **Subtle shadow** | `0 4px 12px rgba(0,0,0,.4)` | Hover states, tooltips |
| **No shadow** | Avoid shadows on flat surfaces | Background panels |

---

## 6. Layout & Responsive Grid

### Desktop Layout (> 760px)
```css
.shell {
  width: min(1120px, 100%);
  display: grid;
  grid-template-columns: minmax(0, 1.15fr) minmax(340px, .85fr);
  gap: clamp(36px, 7vw, 92px);
  padding: clamp(24px, 5vw, 64px);
}
```

### Tablet Layout (760px – 420px)
```css
@media (max-width: 760px) {
  .shell {
    grid-template-columns: 1fr;
    gap: 36px;
    padding: 5vw;
  }
}
```

### Mobile Layout (< 420px)
```css
@media (max-width: 420px) {
  .shell {
    padding: 28px;
    gap: 28px;
  }
  .card {
    padding: 22px;
    border-radius: 18px;
  }
}
```

### Responsive Rules
- **Use `clamp()` for fluid sizing** → Avoid fixed sizes that break on small screens
- **Maximum line length: 70–75 characters** → For readability
- **Grid gaps scale with viewport** → Never fixed
- **All text scales responsively** → Use `clamp()` for font sizes

---

## 7. CSS Variables & Naming Conventions

### Variable Naming
```css
/* Colors */
--{purpose}: {value}
--bg, --surface, --ink, --accent, --error

/* Spacing */
--gap-{size}: {value}
--gap-md, --gap-lg

/* Typography */
--font-{type}: {family}
--font-heading, --font-body

/* Shadows */
--shadow: {value}
--shadow-card, --shadow-interactive
```

### Naming Rules
- **Use kebab-case** → `--card-background` not `--cardBackground`
- **Be semantic** → `--accent` not `--purple`
- **Prefix related variables** → `--card-border`, `--card-shadow`, `--card-padding`
- **Group logically** → Colors, then spacing, then typography

---

## 8. Component Implementation Checklist

Before adding any new component, verify:

- [ ] **Borders** → MUST be `rgba(143,211,240,.2)` - NO WHITE BORDERS ALLOWED
- [ ] **Colors** → Uses only CSS variables from palette
- [ ] **Typography** → Uses standard sizes and weights from table
- [ ] **Spacing** → Uses only standard spacing scale
- [ ] **Shadows** → Uses standard shadow or none
- [ ] **Responsive** → Uses `clamp()` or media queries
- [ ] **Accessibility** → Min 48px touch targets, focus states
- [ ] **Contrast** → Text meets WCAG AA standards (4.5:1)
- [ ] **Names** → Uses consistent CSS class naming
- [ ] **No white/light borders** → Final check before commit

---

## 9. Anti-Patterns (DO NOT DO) - CRITICAL

❌ **NEVER (these are bugs):**
- Use white (`#fff`, `white`) or bright colors for card borders
- Use arbitrary colors outside the palette
- Set font sizes to fixed pixels without `clamp()`
- Mix padding/margin inconsistently
- Create new components without checking this guide
- Use color names like "gray", "blue", "orange" as class names
- Hard-code spacing values
- Use `!important` to override styles
- Add inline styles (use classes instead)
- Forget accessibility standards (focus states, contrast, touch targets)
- Forget to remove white borders from any component

---

## 10. Common Patterns with Examples

### Pattern: Card with Title and Text - CORRECT
```html
<section class="card">
  <h2 class="card-title">Ways of Working</h2>
  <p class="card-text">Description here</p>
</section>

<style>
  .card {
    border: 1px solid rgba(143,211,240,.2);  /* NEVER WHITE */
    border-radius: 22px;
    padding: 24px;
    background: linear-gradient(145deg, rgba(14,38,56,.96), rgba(7,23,35,.98));
    box-shadow: 0 24px 80px -32px rgba(0,0,0,.8), 0 0 0 1px rgba(0,126,180,.06);
  }
  
  .card-title {
    color: var(--accent);  /* #D8A5FF - VIBRANT PURPLE */
    font-size: 1.1rem;
    font-weight: 600;
    margin-bottom: 12px;
  }
  
  .card-text {
    color: var(--muted);
    font-size: 0.95rem;
    line-height: 1.6;
  }
</style>
```

### Pattern: Form Field with Label
```html
<form>
  <label class="form-label" for="field">Field Label</label>
  <input id="field" class="form-input" type="text" required>
  <p class="err" id="error"></p>
</form>

<style>
  .form-label {
    color: var(--accent);  /* #D8A5FF */
    font-size: 0.83rem;
    font-weight: 600;
    display: block;
    margin-bottom: 8px;
  }
  .form-input {
    width: 100%;
    min-height: 48px;
    padding: 12px 14px;
    border: 1px solid rgba(143,211,240,.24);
    border-radius: 10px;
    background: #061520;
    color: var(--ink);
  }
</style>
```

### Pattern: Responsive Container
```html
<div class="shell">
  <section class="welcome"></section>
  <aside class="card"></aside>
</div>

<style>
  .shell {
    width: min(1120px, 100%);
    display: grid;
    grid-template-columns: minmax(0, 1.15fr) minmax(340px, .85fr);
    gap: clamp(36px, 7vw, 92px);
    padding: clamp(24px, 5vw, 64px);
  }
  
  @media (max-width: 760px) {
    .shell {
      grid-template-columns: 1fr;
      gap: 36px;
    }
  }
</style>
```

---

## 11. Enforcement & Review Process

### Code Review Checklist - MANDATORY
When reviewing CSS/HTML changes:
1. **Verify NO white borders exist** → Check all cards, inputs, dividers
2. Verify all colors use CSS variables
3. Check spacing follows the standard scale
4. Confirm typography matches the hierarchy table
5. Validate focus states and accessibility
6. Test responsive behavior at breakpoints
7. Ensure no inline styles or hard-coded values

### Pre-Commit Validation
Before committing:
- [ ] Search for `#fff` in CSS (should only be in button text)
- [ ] Search for `white` in CSS (should not exist)
- [ ] Search for `border.*white` (should not exist)
- [ ] Verify all card borders are `rgba(143,211,240,.2)`
- [ ] Check accent color is `#D8A5FF` (vibrant purple)

---

## 12. Color Reference - UPDATED TO VIBRANT PURPLE

**PRIMARY ACCENT COLOR: #D8A5FF (Light Vibrant Purple)**
- Used for: Card titles, labels, eyebrows, section headers
- Contrast: Excellent on dark backgrounds
- NEVER: Use orange/yellow - switch to purple (#D8A5FF)

---

## 13. Updates & Changes

**Last Updated:** November 15, 2026

**Version:** 2.0 (Updated - Purple accent, White border enforcement)

**Maintained By:** Design System Team

**Recent Changes:**
- Changed accent color from #FFA500 (orange-yellow) to #D8A5FF (vibrant light purple)
- **ENFORCED: All cards must use `rgba(143,211,240,.2)` borders - NO WHITE**
- Added critical enforcement checklist
- Updated all examples to show correct border styling

To propose changes to this guide:
1. Create a pull request with proposed changes
2. Include before/after examples
3. Explain the rationale
4. Get design team approval before merging

---

## Quick Reference Card

```
COLORS:       Always use CSS variables (--bg, --ink, --accent #D8A5FF, --sky, --muted, --blue)
TYPOGRAPHY:  Use hierarchy table; 0.72rem minimum; proper line-height (1.6+)
SPACING:     4px scale only; use clamp() for responsive; grid gaps always consistent
BORDERS:     rgba(143,211,240,.2) ONLY - NO WHITE, NO EXCEPTIONS
SHADOWS:     Use standard card shadow or none; no custom values
RESPONSIVE:  clamp() for sizing; media queries at 760px & 420px breakpoints
COMPONENTS:  Follow card, button, input, label patterns exactly
NAMING:      kebab-case; semantic; prefix related vars; NO inline styles
ACCENT:      #D8A5FF (Vibrant Light Purple) for titles, labels, highlights
WHITE=BUG:   Any white border is a styling bug that must be fixed immediately
```

Good luck! Follow these standards and styling issues will disappear. 🎨✨


---

## 2. Typography Standards

### Font Family Stack
```css
Headings:     "Red Hat Display", "Segoe UI", system-ui, sans-serif
Body/Labels:  "Red Hat Text", "Segoe UI", system-ui, sans-serif
Monospace:    "Red Hat Mono", ui-monospace, monospace
```

### Font Sizing & Hierarchy

| Level | Size | Weight | Line-Height | Usage |
|-------|------|--------|-------------|-------|
| h1 | clamp(2.7rem, 6vw, 5rem) | 700 | 0.99 | Page titles, hero text |
| h2 | clamp(1.7rem, 3vw, 2.2rem) | 650 | 1.1 | Card headings, section titles |
| h3 | 1.1rem | 600 | 1.4 | Subsection titles |
| Body | 0.92rem–1rem | 400 | 1.6 | Paragraph text, descriptions |
| Label | 0.83rem | 600 | 1.4 | Form labels, field titles |
| Eyebrow | 0.72rem | 600 | 1.3 | Overline text, category labels |
| Small | 0.78rem | 400 | 1.4 | Helper text, metadata |

### Typography Rules
- **H1 must use `letter-spacing: -.055em`** → Tighter for impact
- **All headings use `letter-spacing: -.035em`** → Slightly condensed for elegance
- **Body text minimum `line-height: 1.6`** → For readability
- **Eyebrow text must be `text-transform: uppercase`** → Category/section labels
- **Labels must have `font-weight: 600`** → Clear visual distinction
- **Never use text smaller than 0.72rem** → Accessibility requirement

### Color Application for Text
| Text Type | Color | Weight |
|-----------|-------|--------|
| Headings | `--accent` (#FFA500) | 600–700 |
| Body | `--ink` | 400 |
| Secondary | `--muted` | 400 |
| Eyebrow/Label | `--accent` | 600 |
| Error | #FFB4AB | 400 |
| Interactive (hover) | `--sky` | inherit |

---

## 3. Spacing & Sizing Standards

### Base Spacing Unit
All spacing uses **4px increments** or `clamp()` for responsive scaling.

### Standard Spacing Values
```css
xs:  4px
sm:  8px
md:  12px
lg:  16px
xl:  24px
2xl: 32px
3xl: 40px
4xl: 48px
5xl: 64px
6xl: 92px
```

### Component Spacing Rules

**Cards**
```css
padding:       24px (or clamp(24px, 4vw, 38px))
border-radius: 22px
margin-bottom: 24px or 32px (between cards)
gap:           12px (internal elements)
```

**Form Elements**
```css
min-height:    48px (buttons, inputs)
padding:       12px 14px (inputs)
label gap:     9px (icon to text)
margin-bottom: 13px (between form fields)
```

**Container/Section**
```css
max-width:     1120px
padding:       clamp(24px, 5vw, 64px) (sides)
gap:           clamp(36px, 7vw, 92px) (between sections)
```

### Spacing Rules
- **Never use arbitrary spacing values** → Only use the standard scale above
- **Grid gaps must be consistent** → Use `gap` property, not margins
- **Padding and margins should never exceed 5% viewport width** → Use `clamp()` for responsiveness
- **Minimum touch target: 48px × 48px** → For buttons and interactive elements

---

## 4. Component Patterns & Standards

### Card Component
```css
.card {
  width: 100%;
  padding: clamp(24px, 4vw, 38px);
  border: 1px solid rgba(143,211,240,.2);
  border-radius: 22px;
  background: linear-gradient(145deg, rgba(14,38,56,.96), rgba(7,23,35,.98));
  box-shadow: 0 24px 80px -32px rgba(0,0,0,.8), 0 0 0 1px rgba(0,126,180,.06);
}
```

**Card Variations:**
- `.card.keep2` - Special style for "Ways of Working" cards (same as above)
- `.card-top` - For metadata/labels above card content
- `.card-title` / `.keep2-title` - Heading with `--accent` color
- `.card-text` / `.keep2-text` - Body text with `--muted` color

### Button Component
```css
button {
  min-height: 48px;
  padding: 12px 18px;
  border: 1px solid #168AB9;
  border-radius: 10px;
  background: var(--blue);
  color: #fff;
  font: 600 0.92rem "Red Hat Text", sans-serif;
  cursor: pointer;
  transition: background-color .16s, transform .16s;
}

button:hover {
  transform: translateY(-1px);
  background: #0A8EC5;
}

button:focus-visible {
  outline: 2px solid var(--sky);
  outline-offset: 3px;
}

button[disabled] {
  opacity: 0.6;
  cursor: progress;
}
```

### Input Component
```css
input[type=password] {
  width: 100%;
  min-height: 48px;
  padding: 12px 14px;
  border: 1px solid rgba(143,211,240,.24);
  border-radius: 10px;
  background: #061520;
  color: var(--ink);
  font: inherit;
}

input:focus {
  outline: 2px solid var(--sky);
  outline-offset: 2px;
  border-color: var(--sky);
}
```

### Label Component
```css
label {
  color: var(--accent);
  font-size: 0.83rem;
  font-weight: 600;
  display: block;
  margin-bottom: 8px;
}
```

### Error Message
```css
.err {
  min-height: 1.2em;
  color: #FFB4AB;
  font-size: 0.82rem;
  line-height: 1.45;
  margin-top: 6px;
}
```

---

## 5. Borders & Shadows Standards

### Border Rules
| Type | Rule | Example |
|------|------|---------|
| **Light borders** | `1px solid rgba(143,211,240,.2)` | Card borders, dividers |
| **Focus outlines** | `2px solid var(--sky)` with `3px offset` | Button focus, input focus |
| **Interactive borders** | `1px solid rgba(143,211,240,.24)` | Form inputs, hover states |
| **NO white borders** | ❌ Never use `#fff` or `white` | - |
| **NO hard borders** | ❌ Never use `1px solid #000` | - |

### Shadow Rules
| Type | Rule | Usage |
|------|------|-------|
| **Card shadow** | `0 24px 80px -32px rgba(0,0,0,.8), 0 0 0 1px rgba(0,126,180,.06)` | Cards, elevated surfaces |
| **Subtle shadow** | `0 4px 12px rgba(0,0,0,.4)` | Hover states, tooltips |
| **No shadow** | Avoid shadows on flat surfaces | Background panels |

---

## 6. Layout & Responsive Grid

### Desktop Layout (> 760px)
```css
.shell {
  width: min(1120px, 100%);
  display: grid;
  grid-template-columns: minmax(0, 1.15fr) minmax(340px, .85fr);
  gap: clamp(36px, 7vw, 92px);
  padding: clamp(24px, 5vw, 64px);
}
```

### Tablet Layout (760px – 420px)
```css
@media (max-width: 760px) {
  .shell {
    grid-template-columns: 1fr;
    gap: 36px;
    padding: 5vw;
  }
}
```

### Mobile Layout (< 420px)
```css
@media (max-width: 420px) {
  .shell {
    padding: 28px;
    gap: 28px;
  }
  .card {
    padding: 22px;
    border-radius: 18px;
  }
}
```

### Responsive Rules
- **Use `clamp()` for fluid sizing** → Avoid fixed sizes that break on small screens
- **Maximum line length: 70–75 characters** → For readability
- **Grid gaps scale with viewport** → Never fixed
- **All text scales responsively** → Use `clamp()` for font sizes

---

## 7. CSS Variables & Naming Conventions

### Variable Naming
```css
/* Colors */
--{purpose}: {value}
--bg, --surface, --ink, --accent, --error

/* Spacing */
--gap-{size}: {value}
--gap-md, --gap-lg

/* Typography */
--font-{type}: {family}
--font-heading, --font-body

/* Shadows */
--shadow: {value}
--shadow-card, --shadow-interactive
```

### Naming Rules
- **Use kebab-case** → `--card-background` not `--cardBackground`
- **Be semantic** → `--accent` not `--orange`
- **Prefix related variables** → `--card-border`, `--card-shadow`, `--card-padding`
- **Group logically** → Colors, then spacing, then typography

---

## 8. Component Implementation Checklist

Before adding any new component, verify:

- [ ] **Colors** → Uses only CSS variables from palette
- [ ] **Typography** → Uses standard sizes and weights from table
- [ ] **Spacing** → Uses only standard spacing scale
- [ ] **Borders** → Uses `rgba(143,211,240,*)` or no border
- [ ] **Shadows** → Uses standard shadow or none
- [ ] **Responsive** → Uses `clamp()` or media queries
- [ ] **Accessibility** → Min 48px touch targets, focus states
- [ ] **Contrast** → Text meets WCAG AA standards (4.5:1)
- [ ] **Names** → Uses consistent CSS class naming

---

## 9. Anti-Patterns (DO NOT DO)

❌ **Never:**
- Use arbitrary colors outside the palette
- Set font sizes to fixed pixels without `clamp()`
- Use `white` or `#fff` for borders
- Mix padding/margin inconsistently
- Create new components without checking this guide
- Use color names like "gray", "blue", "orange" as class names
- Hard-code spacing values
- Use `!important` to override styles
- Add inline styles (use classes instead)
- Forget accessibility standards (focus states, contrast, touch targets)

---

## 10. Common Patterns with Examples

### Pattern: Card with Title and Text
```html
<section class="card">
  <h2 class="card-title">Ways of Working</h2>
  <p class="card-text">Description here</p>
</section>

<style>
  .card-title {
    color: var(--accent);
    font-size: 1.1rem;
    font-weight: 600;
    margin-bottom: 12px;
  }
  .card-text {
    color: var(--muted);
    font-size: 0.95rem;
    line-height: 1.6;
  }
</style>
```

### Pattern: Form Field with Label
```html
<form>
  <label class="form-label" for="field">Field Label</label>
  <input id="field" class="form-input" type="text" required>
  <p class="err" id="error"></p>
</form>

<style>
  .form-label {
    color: var(--accent);
    font-size: 0.83rem;
    font-weight: 600;
    display: block;
    margin-bottom: 8px;
  }
  .form-input {
    width: 100%;
    min-height: 48px;
    padding: 12px 14px;
    border: 1px solid rgba(143,211,240,.24);
    border-radius: 10px;
    background: #061520;
    color: var(--ink);
  }
</style>
```

### Pattern: Responsive Container
```html
<div class="shell">
  <section class="welcome"></section>
  <aside class="card"></aside>
</div>

<style>
  .shell {
    width: min(1120px, 100%);
    display: grid;
    grid-template-columns: minmax(0, 1.15fr) minmax(340px, .85fr);
    gap: clamp(36px, 7vw, 92px);
    padding: clamp(24px, 5vw, 64px);
  }
  
  @media (max-width: 760px) {
    .shell {
      grid-template-columns: 1fr;
      gap: 36px;
    }
  }
</style>
```

---

## 11. Enforcement & Review Process

### Code Review Checklist
When reviewing CSS/HTML changes:
1. Verify all colors use CSS variables
2. Check spacing follows the standard scale
3. Confirm typography matches the hierarchy table
4. Validate focus states and accessibility
5. Test responsive behavior at breakpoints
6. Ensure no inline styles or hard-coded values

### Pre-Commit Validation
Consider adding hooks to validate:
- No color values outside `--{palette}`
- No arbitrary pixel values (except tool-generated)
- Proper class naming conventions

---

## 12. Updates & Changes

**Last Updated:** November 15, 2026

**Version:** 1.0 (Baseline - Intelligent Workspace, Ways of Working, AXD Studio)

**Maintained By:** Design System Team

To propose changes to this guide:
1. Create a pull request with proposed changes
2. Include before/after examples
3. Explain the rationale
4. Get design team approval before merging

---

## Quick Reference Card

```
COLORS:       Always use CSS variables (--bg, --ink, --accent, --sky, --muted, --blue)
TYPOGRAPHY:  Use hierarchy table; 0.72rem minimum; proper line-height (1.6+)
SPACING:     4px scale only; use clamp() for responsive; grid gaps always consistent
BORDERS:     rgba(143,211,240,.2) only; NO white; focus outlines 2px --sky
SHADOWS:     Use standard card shadow or none; no custom values
RESPONSIVE:  clamp() for sizing; media queries at 760px & 420px breakpoints
COMPONENTS:  Follow card, button, input, label patterns exactly
NAMING:      kebab-case; semantic; prefix related vars; NO inline styles
```

Good luck! Follow these standards and styling issues will disappear. 🎨✨
