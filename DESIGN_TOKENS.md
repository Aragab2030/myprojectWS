# 🎨 Qatar APEX Login - Design Tokens & Style Guide

Complete reference for colors, typography, spacing, and design elements.

---

## 🎨 Color Palette

### Primary Colors (Qatar National)

```css
/* Qatar Maroon - Primary Brand Color */
--qatar-maroon: #8B1538
RGB: 139, 21, 56
HSL: 343°, 74%, 31%
Usage: Primary buttons, headings, brand elements

/* Qatar Gold - Secondary Accent */
--qatar-gold: #D4AF37
RGB: 212, 175, 55
HSL: 46°, 64%, 52%
Usage: Decorative elements, highlights, accents

/* Qatar White */
--qatar-white: #FFFFFF
RGB: 255, 255, 255
HSL: 0°, 0%, 100%
Usage: Backgrounds, text on dark
```

### Supporting Colors

```css
/* Dark Maroon - Hover States */
--qatar-dark-maroon: #6B0F2A
RGB: 107, 15, 42
HSL: 343°, 75%, 24%

/* Light Maroon - Borders */
--qatar-light-maroon: #A01D45
RGB: 160, 29, 69
HSL: 343°, 69%, 37%

/* Sand - Subtle Backgrounds */
--qatar-sand: #E8D5C4
RGB: 232, 213, 196
HSL: 28°, 42%, 84%
```

### UI Colors

```css
/* Text Colors */
--qatar-text-primary: #2C2C2C    /* Main text */
--qatar-text-secondary: #666666  /* Secondary text */

/* Borders */
--qatar-border: #D4D4D4

/* Backgrounds */
--qatar-background: #F5F5F5

/* Status Colors */
--qatar-error: #D32F2F    /* Red - errors */
--qatar-success: #388E3C  /* Green - success */
--qatar-info: #1976D2     /* Blue - info */
```

---

## 📐 Spacing Scale

### Base Unit: 4px

```css
/* Spacing System */
--space-1: 4px    /* 0.25rem */
--space-2: 8px    /* 0.5rem */
--space-3: 12px   /* 0.75rem */
--space-4: 16px   /* 1rem */
--space-5: 20px   /* 1.25rem */
--space-6: 24px   /* 1.5rem */
--space-8: 32px   /* 2rem */
--space-10: 40px  /* 2.5rem */
--space-12: 48px  /* 3rem */
--space-16: 64px  /* 4rem */
```

### Common Usage

| Element | Spacing | Value |
|---------|---------|-------|
| Small gap | `space-2` | 8px |
| Medium gap | `space-4` | 16px |
| Large gap | `space-6` | 24px |
| Section padding | `space-8` | 32px |
| Card padding | `space-6` | 24px |
| Form field margin | `space-6` | 24px |

---

## 📝 Typography

### Font Families

```css
/* Primary (English) */
font-family: 'Segoe UI', 'Dubai', 'Helvetica Neue', Arial, sans-serif;

/* Arabic */
font-family: 'Cairo', 'Traditional Arabic', sans-serif;

/* Monospace (code) */
font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
```

### Font Sizes

```css
/* Scale */
--text-xs: 12px    /* Small labels, captions */
--text-sm: 13px    /* Secondary text, footnotes */
--text-base: 14px  /* Body text, form labels */
--text-md: 15px    /* Primary body text, inputs */
--text-lg: 16px    /* Button text, emphasis */
--text-xl: 18px    /* Subheadings */
--text-2xl: 24px   /* Headings */
--text-3xl: 28px   /* Page titles */
--text-4xl: 32px   /* Hero titles */
```

### Font Weights

```css
--font-normal: 400   /* Body text */
--font-medium: 500   /* Emphasis */
--font-semibold: 600 /* Strong emphasis */
--font-bold: 700     /* Headings, buttons */
```

### Line Heights

```css
--leading-tight: 1.2   /* Headings */
--leading-snug: 1.4    /* Subheadings */
--leading-normal: 1.5  /* Body text */
--leading-relaxed: 1.6 /* Long-form content */
--leading-loose: 1.8   /* Spacious layouts */
```

### Typography Scale

| Element | Size | Weight | Line Height |
|---------|------|--------|-------------|
| Hero Title | 32px | 700 | 1.2 |
| Page Title | 28px | 700 | 1.2 |
| Section Title | 24px | 700 | 1.3 |
| Heading | 18px | 600 | 1.4 |
| Body Large | 16px | 400 | 1.6 |
| Body Regular | 15px | 400 | 1.5 |
| Body Small | 14px | 400 | 1.5 |
| Caption | 13px | 400 | 1.4 |
| Tiny | 12px | 400 | 1.3 |

---

## 🔲 Border Radius

```css
/* Radius Scale */
--radius-sm: 4px   /* Small elements */
--radius-md: 8px   /* Default (buttons, inputs) */
--radius-lg: 12px  /* Cards, panels */
--radius-xl: 16px  /* Large containers */
--radius-full: 50% /* Circles */
```

### Common Usage

| Element | Radius | Value |
|---------|--------|-------|
| Buttons | `radius-md` | 8px |
| Inputs | `radius-md` | 8px |
| Cards | `radius-xl` | 16px |
| Checkboxes | `radius-sm` | 4px |
| Avatar | `radius-full` | 50% |

---

## 🎭 Shadows

```css
/* Shadow Scale */
--shadow-sm: 0 2px 4px rgba(139, 21, 56, 0.1);
--shadow-md: 0 4px 8px rgba(139, 21, 56, 0.15);
--shadow-lg: 0 8px 24px rgba(139, 21, 56, 0.2);
--shadow-xl: 0 12px 32px rgba(139, 21, 56, 0.25);
```

### Shadow Usage

| Element | Shadow | When |
|---------|--------|------|
| Buttons (default) | `shadow-md` | Always |
| Buttons (hover) | `shadow-lg` | On hover |
| Cards | `shadow-lg` | Always |
| Dropdowns | `shadow-xl` | When open |
| Modals | `shadow-xl` | When open |

---

## ⏱️ Animation & Transitions

### Timing Functions

```css
/* Easing */
--ease-linear: linear;
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-out: cubic-bezier(0, 0, 0.2, 1);
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);

/* Default */
--ease-default: cubic-bezier(0.4, 0, 0.2, 1);
```

### Duration

```css
/* Speed */
--duration-fast: 150ms;    /* Quick feedback */
--duration-base: 300ms;    /* Default animations */
--duration-slow: 500ms;    /* Smooth transitions */
--duration-slower: 700ms;  /* Attention-grabbing */
```

### Transition Presets

```css
/* Common transitions */
--transition-all: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
--transition-colors: color 0.3s, background-color 0.3s;
--transition-transform: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
--transition-opacity: opacity 0.3s;
```

---

## 📏 Component Dimensions

### Buttons

```css
/* Button Heights */
--btn-height-sm: 32px;   /* Small */
--btn-height-md: 40px;   /* Medium */
--btn-height-lg: 48px;   /* Large */

/* Button Padding */
--btn-padding-sm: 8px 16px;
--btn-padding-md: 12px 24px;
--btn-padding-lg: 16px 32px;
```

### Inputs

```css
/* Input Heights */
--input-height: 48px;

/* Input Padding */
--input-padding: 14px 16px;
--input-padding-with-icon: 14px 16px 14px 48px;
```

### Cards

```css
/* Card Dimensions */
--card-padding: 24px;
--card-radius: 16px;
```

---

## 🎯 Breakpoints

### Responsive Design

```css
/* Mobile First Breakpoints */
--breakpoint-xs: 0px;      /* Extra small devices */
--breakpoint-sm: 576px;    /* Small devices (phones) */
--breakpoint-md: 768px;    /* Medium devices (tablets) */
--breakpoint-lg: 992px;    /* Large devices (desktops) */
--breakpoint-xl: 1200px;   /* Extra large devices */
```

### Media Queries

```css
/* Usage */
@media (max-width: 576px) { /* Mobile */ }
@media (min-width: 577px) and (max-width: 968px) { /* Tablet */ }
@media (min-width: 969px) { /* Desktop */ }
```

---

## 🌈 Opacity Scale

```css
/* Opacity Values */
--opacity-0: 0;
--opacity-10: 0.1;
--opacity-20: 0.2;
--opacity-30: 0.3;
--opacity-40: 0.4;
--opacity-50: 0.5;
--opacity-60: 0.6;
--opacity-70: 0.7;
--opacity-80: 0.8;
--opacity-90: 0.9;
--opacity-100: 1;
```

---

## 📊 Z-Index Scale

```css
/* Layering */
--z-base: 0;
--z-dropdown: 10;
--z-sticky: 100;
--z-fixed: 200;
--z-modal-backdrop: 500;
--z-modal: 600;
--z-popover: 700;
--z-tooltip: 800;
--z-notification: 900;
--z-max: 9999;
```

### Layer Usage

| Element | Z-Index | Value |
|---------|---------|-------|
| Base content | `z-base` | 0 |
| Language selector | `z-fixed` | 200 |
| Alert container | `z-sticky` | 100 |
| Modal backdrop | `z-modal-backdrop` | 500 |
| Modal | `z-modal` | 600 |

---

## 🎨 Gradients

### Brand Gradients

```css
/* Primary Gradient */
background: linear-gradient(135deg, #8B1538 0%, #6B0F2A 100%);

/* Gold Gradient */
background: linear-gradient(90deg, #D4AF37 0%, #F4D03F 50%, #D4AF37 100%);

/* Subtle Background */
background: linear-gradient(180deg, #8B1538 0%, #6B0F2A 100%);
```

---

## 🔤 Content Guidelines

### Text Lengths

| Element | Max Length | Notes |
|---------|------------|-------|
| Page Title | 60 chars | Keep concise |
| Button Text | 20 chars | Action-oriented |
| Input Placeholder | 40 chars | Helpful hint |
| Error Message | 100 chars | Clear, specific |
| Form Label | 30 chars | Descriptive |

### Tone of Voice

- **Professional** - Formal but friendly
- **Clear** - Simple, understandable language
- **Concise** - Brief and to the point
- **Helpful** - Guiding users
- **Respectful** - Appropriate for government

---

## ♿ Accessibility Requirements

### Color Contrast Ratios

| Usage | Ratio | WCAG Level |
|-------|-------|------------|
| Normal Text | 4.5:1 | AA |
| Large Text (18px+) | 3:1 | AA |
| UI Components | 3:1 | AA |
| Graphical Objects | 3:1 | AA |

### Touch Targets

```css
/* Minimum Sizes */
--touch-target-min: 44px;   /* iOS */
--touch-target-ideal: 48px; /* Material Design */
```

### Focus Indicators

```css
/* Focus Style */
outline: 2px solid var(--qatar-maroon);
outline-offset: 2px;
```

---

## 📱 Mobile-Specific

### Safe Areas

```css
/* iOS Safe Area */
padding-top: env(safe-area-inset-top);
padding-bottom: env(safe-area-inset-bottom);
```

### Tap Highlights

```css
/* Remove tap highlight on mobile */
-webkit-tap-highlight-color: transparent;
```

---

## 🎯 Icon System

### Icon Sizes

```css
--icon-xs: 12px;
--icon-sm: 16px;
--icon-md: 20px;
--icon-lg: 24px;
--icon-xl: 32px;
```

### Icon Usage

| Context | Size | Value |
|---------|------|-------|
| Form icons | `icon-md` | 20px |
| Button icons | `icon-sm` | 16px |
| Feature icons | `icon-lg` | 24px |
| Hero icons | `icon-xl` | 32px |

---

## 📐 Grid System

### Container

```css
--container-max-width: 1200px;
--container-padding: 20px;
```

### Columns

```css
/* 12-column grid */
--col-1: 8.333%;
--col-2: 16.666%;
--col-3: 25%;
--col-4: 33.333%;
--col-5: 41.666%;
--col-6: 50%;
--col-7: 58.333%;
--col-8: 66.666%;
--col-9: 75%;
--col-10: 83.333%;
--col-11: 91.666%;
--col-12: 100%;
```

---

## 🎨 Usage Examples

### Button Styles

```css
/* Primary Button */
.btn-primary {
    background: linear-gradient(135deg, #8B1538, #6B0F2A);
    color: #FFFFFF;
    padding: 16px 24px;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    box-shadow: 0 4px 8px rgba(139, 21, 56, 0.15);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(139, 21, 56, 0.3);
}
```

### Input Styles

```css
/* Text Input */
.input {
    padding: 14px 16px 14px 48px;
    font-size: 15px;
    border: 2px solid #D4D4D4;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.input:focus {
    border-color: #8B1538;
    box-shadow: 0 0 0 3px rgba(139, 21, 56, 0.1);
    outline: none;
}
```

---

## 📚 Quick Reference

### Most Common Values

```css
/* Colors */
Primary: #8B1538
Accent: #D4AF37
Text: #2C2C2C

/* Spacing */
Small: 8px
Medium: 16px
Large: 24px

/* Typography */
Body: 15px / 400
Heading: 28px / 700
Button: 16px / 600

/* Effects */
Radius: 8px
Shadow: 0 4px 8px rgba(139, 21, 56, 0.15)
Transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1)
```

---

**🎨 Design System Version:** 1.0.0  
**Last Updated:** December 2025  
**Status:** Production Ready

**🇶🇦 Qatar Digital Excellence**
