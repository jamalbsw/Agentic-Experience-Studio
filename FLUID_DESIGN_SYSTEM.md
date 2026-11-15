# Fluid Intelligence Design System
## AXD Studio Platform — Visual Identity & Development Standards

**Cinematic Bioluminescence • Liquid Glass • Organic Intelligence**

A unified visual language inspired by translucent cellular forms: deep ocean blues, icy cyan light, and warm reddish-copper cores. Blue represents connected technology and orchestration; the warm center represents human judgment, creativity, and decision-making.

---

## 🔴 CRITICAL RULES — READ FIRST

### MANDATORY Color Standards
- **Primary Background:** `#030D1C` (Midnight Navy) — REQUIRED for all dark surfaces
- **Secondary Background:** `#0A2139` (Deep Ocean) — REQUIRED for elevated surfaces
- **Glass Panel Tint:** `#133B5B` (Marine Blue) — REQUIRED for semi-transparent panels
- **Primary Accent:** `#4881AA` (Liquid Azure) — ALL interactive elements, titles, focal points
- **Warm Focal Point:** `#C7836F` (Warm Coral) — Human judgment, decision nodes, special emphasis
- **Cyan Illumination:** `#81BFDF` / `#B9EAF5` — Active states, rim lighting, glows
- **Text:** `#FFFFFF` (Pure White) — All body text on dark backgrounds
- **Muted:** `#B9EAF5` (Ice Glow) — Secondary text, metadata

### 🚫 ZERO-TOLERANCE ENFORCEMENT
- **NO WHITE BORDERS** — Ever. Use `rgba(129,191,223,.18)` or glass-effect styles only
- **NO HARDCODED COLORS** — Always use CSS variables (--bg, --surface, --accent, --warm-primary, --cyan-glow)
- **NO INCONSISTENT ACCENT COLORS** — Liquid Azure (#4881AA) is the ONLY accent for UI elements
- **NO GLASS EFFECTS WITHOUT BACKDROP-FILTER** — All frosted panels require `backdrop-filter: blur(8px)`
- **NO HEAVY SHADOWS** — Maximum 32px drop shadows at 85% opacity, never darker

### Enforcement Process
1. **Pre-commit hook** validates all changes
2. **Code review** must verify color compliance
3. **Visual inspection** confirms glass effects and depth layering
4. **Cache-busting** required before deployment (hard refresh or server-side cache invalidation)

---

## 01 Color Palette & Usage Rules

### Dark Cinematic Backgrounds (55%)
```css
--bg: #030D1C;           /* Midnight Navy — Primary dark background, structural anchor */
--surface: #0A2139;      /* Deep Ocean — Elevated surfaces, raised components */
--surface-raised: #133B5B; /* Marine Blue — Glass panel tint, tertiary elevation */
```

**Usage:** All page backgrounds use Midnight Navy. Cards and panels layer with Deep Ocean for visual hierarchy. Glass panels tint with Marine Blue when using transparency.

### Blue Accent System (25% + interactions)
```css
--blue: #4881AA;         /* Liquid Azure — PRIMARY accent, interactive focus */
--sky: #81BFDF;          /* Luminous Cyan — Active illumination, emphasis */
--cyan-glow: #B9EAF5;    /* Ice Glow — Edge lighting, highlights, focus rings */
```

**Usage Rules:**
- Card titles → `--blue` (#4881AA)
- Form labels → `--blue` (#4881AA)
- Button primary action → gradient `#4881AA` to `#3A6B8F`
- Focus outlines → `--cyan-glow` (#B9EAF5)
- Active/hover states → brightened Luminous Cyan
- Never use for text body (reserved for accents only)

### Warm Focal Points (12% — Human Judgment & Decisions)
```css
--warm-primary: #C7836F;   /* Warm Coral — Primary warm focal, decision emphasis */
--warm-secondary: #A75F55; /* Copper Rose — Secondary warm, subtle accents */
```

**Usage Rules:**
- Intelligence indicators (human vs AI decisions)
- Critical decision nodes in flows
- Emphasis badges or special status
- Inner glow effects in glass panels
- **Never** use for destructive actions (errors use #FFB4AB)

### Text & Typography
```css
--ink: #FFFFFF;          /* Pure White — Primary light text on dark */
--muted: #B9EAF5;        /* Ice Glow — Secondary text, hints, metadata */
```

**Contrast Requirements:**
- Body text on dark: minimum 18:1 (white on navy)
- Labels on cards: minimum 12:1 (accent on surface)
- Metadata: minimum 8:1 (muted on surface)
- Always test with accessibility tools

### Grid & Borders
```css
--line: rgba(129,191,223,.16);  /* Subtle blue-tinted separator */
```

**Border Standards:**
- Card borders: `1px solid rgba(129,191,223,.18)`
- Input borders: `1px solid rgba(129,191,223,.2)`
- Glass panels: `1px solid rgba(129,191,223,.18)` with `backdrop-filter: blur(8px)`
- Focus rings: `2px solid #B9EAF5` with `3px` offset
- Internal dividers: `1px solid rgba(129,191,223,.12)`

---

## 02 Glass Effect Specification

### Translucent Liquid Glass
All cards and panels implement soft frosted-glass aesthetic:

```css
/* Core glass effect */
border: 1px solid rgba(129,191,223,.18);
background: linear-gradient(145deg, rgba(10,33,57,.88), rgba(5,18,36,.92));
backdrop-filter: blur(8px);
box-shadow: 0 24px 80px -32px rgba(0,0,0,.85),
            0 0 0 1px rgba(72,129,170,.08),
            inset 0 1px 1px rgba(185,234,245,.04);
```

**Components:**
1. **Semi-transparent gradient** — Two-layer blue tint for depth
2. **Backdrop blur** — 8px blur for glass effect (no less than 4px)
3. **Luminous border** — Soft cyan accent at edge
4. **Depth shadow** — 24px drop with 32px blur, 85% opacity
5. **Inset highlight** — Microscopic rim lighting effect

### Bioluminescent Edges
Focus states and active elements glow with cyan illumination:

```css
/* Focus state glow */
outline: 2px solid #B9EAF5;
outline-offset: 2px;
box-shadow: 0 0 16px rgba(129,191,223,.2);
```

**Never:**
- Use neon (#FF00FF or similar)
- Apply glow without outline
- Exceed 16px blur radius
- Use opacity > 20% for glows

### Input Field Focus Elevation
```css
input:focus {
    border-color: var(--cyan-glow);
    background: rgba(10,33,57,.72);
    box-shadow: 0 0 16px rgba(129,191,223,.2);
}
```

Inputs elevate from normal state to focused glow state with color shift.

### Button States
```css
/* Default */
background: linear-gradient(135deg, #4881AA, #3A6B8F);
box-shadow: 0 8px 24px -8px rgba(72,129,170,.24);

/* Hover */
background: linear-gradient(135deg, #5191B8, #4675A0);
box-shadow: 0 12px 32px -8px rgba(72,129,170,.32);
transform: translateY(-2px);

/* Focus */
outline: 2px solid #B9EAF5;
outline-offset: 3px;
```

---

## 03 Component Patterns

### Cards (`.card`)
**Used for:** Primary content containers, form wrappers, information blocks

```css
.card {
    padding: clamp(24px, 4vw, 38px);
    border: 1px solid rgba(129,191,223,.18);
    border-radius: 22px;
    background: linear-gradient(145deg, rgba(10,33,57,.88), rgba(5,18,36,.92));
    backdrop-filter: blur(8px);
    box-shadow: 0 24px 80px -32px rgba(0,0,0,.85),
                0 0 0 1px rgba(72,129,170,.08),
                inset 0 1px 1px rgba(185,234,245,.04);
}

.card h2 {
    color: var(--accent); /* #4881AA */
    font: 650 clamp(1.7rem, 3vw, 2.2rem)/1.1 "Red Hat Display";
}

.card-copy {
    color: var(--muted); /* #B9EAF5 */
}
```

**Responsive:**
- Desktop: 22px border-radius
- Mobile (<420px): 18px border-radius
- Padding scales: `clamp(24px, 4vw, 38px)`

### Keep2 Panels (`.keep2`)
**Used for:** Info blocks, supplementary content, asides

Same styling as `.card` for consistency.

### Form Elements

**Labels:**
```css
label.f {
    color: var(--accent); /* #4881AA */
    font-size: .83rem;
    font-weight: 600;
}
```

**Inputs:**
```css
input[type=password] {
    border: 1px solid rgba(129,191,223,.2);
    background: rgba(10,33,57,.56);
    backdrop-filter: blur(4px);
}
```

**Buttons:**
- Primary: Liquid Azure gradient
- Disabled: 60% opacity
- Focus: Cyan glow ring

### Access Badge (`.access`)
```css
.access {
    color: var(--accent); /* #4881AA */
    display: inline-flex;
    gap: 9px;
}

.access::before {
    background: #5CBF86;
    box-shadow: 0 0 12px rgba(92,191,134,.55);
}
```

### Eyebrow Labels (`.eyebrow`)
```css
.eyebrow {
    color: var(--accent); /* #4881AA */
    font: 600 .72rem/1.3 "Red Hat Mono";
    letter-spacing: .14em;
    text-transform: uppercase;
}
```

---

## 04 Composition & Atmospheric Design

### Cinematic Balance (55/25/12/8 ratio)
- **55% Deep Navy** — Structural anchor, breathing room, calm
- **25% Cool Blue** — Interactive elements, focus, connection
- **12% Warm Coral** — Human judgment, decisions, emphasis
- **8% Ice Highlights** — Edge lighting, rim effects, refinement

### Dark vs. Light Slides
- **Dark cinematic:** Cover, vision, architecture, strategy overview
- **Light slides:** Roadmap, adoption timeline, success metrics
- **Blended:** Operating flows, transitions, hybrid presentations

### Atmosphere & Depth
- Soft volumetric lighting (via layered gradients)
- Shallow depth of field (via subtle blur on nested elements)
- Suspended micro-particles (via 1px grid background)
- Ambient reflections (via inset box-shadows and rim lighting)
- Smooth biological curvature (22px border-radius minimum)

---

## 05 Typography Standards

### Font Family Stack
```css
/* Headings */
font-family: "Red Hat Display", "Segoe UI", system-ui, sans-serif;

/* Body */
font-family: "Red Hat Text", "Segoe UI", system-ui, sans-serif;

/* Mono/Code */
font-family: "Red Hat Mono", ui-monospace, monospace;
```

### Heading Hierarchy
- **H1:** `clamp(2.7rem, 6vw, 5rem)` / 700 weight / -0.055em letter-spacing
- **H2 (card titles):** `clamp(1.7rem, 3vw, 2.2rem)` / 650 weight / -0.035em letter-spacing
- **Body:** `1rem` / 1.75 line-height
- **Labels:** `0.83rem` / 600 weight
- **Metadata:** `0.72rem` / 0.14em letter-spacing

### Anti-Patterns
- ❌ Variable-width body text
- ❌ Single-line headings (allow wrapping)
- ❌ Font sizes below 0.72rem
- ❌ Line-height less than 1.4 for body
- ❌ Hard-coded sizes (always use clamp())

---

## 06 Spacing & Layout

### Base Unit: 4px Scale
```
4px, 8px, 12px, 16px, 24px, 32px, 40px, 48px, 64px, 92px
```

### Component Spacing
- **Gap between elements:** 12px (small), 24px (standard), 36px (large)
- **Card padding:** `clamp(24px, 4vw, 38px)`
- **Section margins:** `clamp(48px, 8vh, 84px)`
- **Grid gap:** `clamp(36px, 7vw, 92px)`

### Responsive Breakpoints
```css
/* Tablet */
@media (max-width: 760px) {
    .shell { grid-template-columns: 1fr; }
    /* Adjust spacing, reduce padding */
}

/* Mobile */
@media (max-width: 420px) {
    .card { padding: 22px; border-radius: 18px; }
    /* Reduce gap, increase line-height */
}
```

---

## 07 Accessibility Standards

### Contrast Ratios (WCAG AAA)
- **Normal text:** minimum 18:1 (white on navy)
- **Large text (18pt+):** minimum 7:1
- **UI components:** minimum 3:1
- **Graphical objects:** minimum 3:1

### Focus Management
```css
/* Focus ring standard */
outline: 2px solid #B9EAF5;
outline-offset: 3px;
```

All interactive elements must have visible focus indicators. Never use `outline: none`.

### Color Dependency
- Never rely on color alone (use icons, labels, patterns)
- Warm coral (#C7836F) has sufficient contrast when paired with navy
- Cyan glow (#B9EAF5) works for focus indicators and secondary emphasis

### Screen Reader Compatibility
- Semantic HTML (use `<button>`, `<form>`, `<label>`)
- ARIA labels for custom components
- Error messages use `role="alert"`
- Live regions use `aria-live="polite"`

---

## 08 Enforcement & Review Process

### Pre-Commit Validation
Before committing, run:
```bash
./.pre-commit-check.sh
```

Checks include:
1. ✅ No white borders in CSS
2. ✅ All accents are #4881AA (Liquid Azure)
3. ✅ Card borders use `rgba(129,191,223,.18)` or glass effect
4. ✅ No hardcoded navy/ocean/coral colors
5. ✅ Border-radius consistency (22px desktop, 18px mobile)

### Code Review Checklist
- [ ] All accents match `--accent: #4881AA`
- [ ] Cards use new glass effect styling (backdrop-filter + gradient)
- [ ] No white, gray, or purple borders anywhere
- [ ] Focus states use `#B9EAF5` cyan glow
- [ ] Hover states use smooth transitions (no jarring changes)
- [ ] Button gradients match Liquid Azure theme
- [ ] Input fields have glass effect (blur + gradient background)
- [ ] Typography follows Red Hat font standards
- [ ] Spacing uses 4px scale (no arbitrary values)
- [ ] Responsive breakpoints tested (760px, 420px)
- [ ] Accessibility contrast ratios verified
- [ ] No deprecated CSS (all vendor prefixes updated)

### Visual Testing
1. Hard refresh browser (Cmd+Shift+R or Ctrl+Shift+R)
2. Clear browser cache (DevTools → Application → Clear Storage)
3. Test on multiple browsers (Chrome, Safari, Firefox, Edge)
4. Verify on mobile (iOS Safari, Chrome Android)
5. Test focus navigation with Tab key
6. Verify color contrast with WebAIM tool

---

## 09 Anti-Patterns & What NOT to Do

### ❌ Border Violations
```css
/* WRONG */
border: 1px solid #FFFFFF;           /* White border */
border: 1px solid rgba(255,255,255); /* White border */
border: 1px solid #999;              /* Gray border */
border: 1px solid #D8A5FF;           /* Old purple border */
```

### ❌ Accent Color Misuse
```css
/* WRONG */
color: #D8A5FF;    /* Old purple */
color: #FFA500;    /* Old orange */
color: #007EB4;    /* Old blue */
```

### ❌ Glass Effect Incomplete
```css
/* WRONG — Missing backdrop-filter */
background: rgba(10,33,57,.88);
border: 1px solid #81BFDF;

/* WRONG — Over-blur */
backdrop-filter: blur(20px); /* Maximum 8px */

/* WRONG — Harsh shadows */
box-shadow: 0 32px 120px rgba(0,0,0,1); /* Too dark */
```

### ❌ Focus State Omission
```css
/* WRONG — No focus indicator */
button { outline: none; }

/* WRONG — Weak focus */
outline: 1px dotted #666;

/* RIGHT */
button:focus-visible { outline: 2px solid #B9EAF5; outline-offset: 3px; }
```

### ❌ Typography Hardcoding
```css
/* WRONG */
font-size: 16px;
line-height: 1.2;

/* RIGHT */
font-size: clamp(1rem, 1.5vw, 1.12rem);
line-height: 1.75;
```

---

## 10 Deployment & Cache Management

### Pre-Deployment Steps
1. Run `./.pre-commit-check.sh` → **MUST PASS**
2. Visual review on staging environment
3. Test on production-like servers
4. Clear CDN cache (if applicable)
5. Hard refresh test on client devices

### Cache Busting Strategies
- Query string versioning: `/style.css?v=1.2.0`
- Service worker cache invalidation
- Browser cache headers: `Cache-Control: max-age=3600`
- CloudFront/CDN invalidation for CSS files

### Rollback Procedure
If visual issues appear after deployment:
1. Identify affected component
2. Check browser cache (user hard refresh)
3. Verify CSS file was actually updated
4. Compare git diff before/after
5. Rollback if necessary: `git revert <commit>`

---

## 11 Future Evolution & Versioning

### Version 1.0 (Current)
- Fluid Intelligence aesthetic
- Ocean blue + warm coral palette
- Glass effect styling
- Full responsive support

### Planned Enhancements
- Animated transitions (spring physics)
- Micron-particle background animations
- Advanced glass morphism for illustrative components
- Dark/light mode toggle (while maintaining color hierarchy)
- Custom theme generator for white-label clients

### Breaking Changes
Any changes to core colors, border styles, or shadow specifications must:
1. Update this document immediately
2. Increment version number
3. Create migration guide for affected components
4. Notify all contributors via issue

---

**Last Updated:** November 15, 2024  
**Version:** 1.0 — Fluid Intelligence Release  
**Maintained by:** AXD Studio Design System Team  

Questions? File an issue or contact the design system maintainers.
