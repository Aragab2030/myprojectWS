# Qatar Branded Oracle APEX Login Page

A modern, accessible, and beautifully designed login page for Oracle APEX applications, following Qatar's national branding guidelines.

![Qatar Colors](https://img.shields.io/badge/Qatar-Maroon-%238B1538?style=flat-square)
![Oracle APEX](https://img.shields.io/badge/Oracle-APEX%2019.2%2B-red?style=flat-square&logo=oracle)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)
![Accessibility](https://img.shields.io/badge/WCAG-2.1%20AA-green?style=flat-square)

## 🎨 Features

### Design & Branding
- ✅ **Qatar National Colors**: Official maroon (#8B1538) and gold (#D4AF37) color palette
- ✅ **Modern UI**: Clean, professional design with smooth animations
- ✅ **Responsive Layout**: Optimized for desktop, tablet, and mobile devices
- ✅ **Islamic Geometric Patterns**: Subtle background patterns inspired by Qatar's heritage
- ✅ **Bilingual Support**: English and Arabic with proper RTL (Right-to-Left) layout

### Functionality
- ✅ **Form Validation**: Client-side validation with clear error messages
- ✅ **Security Features**: Account lockout after 5 failed attempts
- ✅ **Password Toggle**: Show/hide password visibility
- ✅ **Remember Me**: Option to save username for convenience
- ✅ **Language Switcher**: Easy toggle between English and Arabic
- ✅ **Keyboard Navigation**: Full keyboard accessibility support
- ✅ **Loading States**: Visual feedback during form submission

### Accessibility
- ✅ **WCAG 2.1 AA Compliant**: Meets international accessibility standards
- ✅ **Screen Reader Support**: Proper ARIA labels and semantic HTML
- ✅ **High Contrast**: Excellent color contrast ratios (4.5:1+)
- ✅ **Focus Indicators**: Clear visual focus states for keyboard navigation
- ✅ **Reduced Motion**: Respects `prefers-reduced-motion` user preference

## 📸 Preview

### Desktop View
```
┌──────────────────────────────────────────────────────┐
│  [EN ▼]                                              │
│  ┌────────────────┬────────────────┐                │
│  │                │  Welcome Back  │                │
│  │  Qatar Logo    │                │                │
│  │  Oracle APEX   │  Username: ___ │                │
│  │  Portal        │  Password: ___ │                │
│  │  بوابة أوراكل  │                │                │
│  │                │  [Sign In]     │                │
│  │  Features:     │                │                │
│  │  • Secure      │                │                │
│  │  • 24/7        │                │                │
│  │  • Enterprise  │                │                │
│  └────────────────┴────────────────┘                │
└──────────────────────────────────────────────────────┘
```

### Mobile View
```
┌──────────────┐
│  [EN ▼]      │
│              │
│  Qatar Logo  │
│  Oracle APEX │
│  Portal      │
│              │
│──────────────│
│ Welcome Back │
│              │
│ Username:___ │
│ Password:___ │
│              │
│  [Sign In]   │
└──────────────┘
```

## 📦 What's Included

```
qatar-apex-login/
│
├── 📄 README.md                      # This file - project overview
├── 📄 APEX_INTEGRATION_GUIDE.md      # Detailed integration instructions
│
├── 🎨 qatar-apex-login.css           # Main stylesheet (Qatar branding)
├── 💻 qatar-apex-login.js            # JavaScript for interactions
├── 📄 qatar-apex-login.html          # HTML template (reference)
│
├── 🖼️ qatar-logo.svg                 # Qatar-themed logo
├── 🖼️ qatar-patterns.svg             # Decorative background patterns
│
└── 🌐 demo.html                      # Live demo page (open in browser)
```

## 🚀 Quick Start

### Option 1: View the Demo

Simply open `demo.html` in your web browser to see the login page in action.

```bash
# Clone or download the repository, then:
cd qatar-apex-login
open demo.html  # macOS
start demo.html # Windows
xdg-open demo.html # Linux
```

### Option 2: Integrate with Oracle APEX

Follow these simple steps:

1. **Upload Files to APEX**
   - Go to **Shared Components > Static Application Files**
   - Upload: `qatar-apex-login.css`, `qatar-apex-login.js`, `qatar-logo.svg`

2. **Modify Your Login Page**
   - Navigate to your login page (typically page 9999 or 101)
   - Add CSS reference: `#APP_IMAGES#qatar-apex-login.css`
   - Add JS reference: `#APP_IMAGES#qatar-apex-login.js`

3. **Update HTML Structure**
   - Copy the HTML structure from `qatar-apex-login.html`
   - Paste into your login page region template

4. **Test & Deploy**
   - Test with valid and invalid credentials
   - Verify responsive design on mobile
   - Test language toggle (EN/AR)

📘 **For detailed instructions, see [APEX_INTEGRATION_GUIDE.md](./APEX_INTEGRATION_GUIDE.md)**

## 🎯 Qatar Branding Guidelines

This design follows the official State of Qatar branding standards:

### Color Palette

| Color | Hex Code | Usage |
|-------|----------|-------|
| **Qatar Maroon** | `#8B1538` | Primary brand color, buttons, accents |
| **Qatar Gold** | `#D4AF37` | Secondary accent, decorative elements |
| **Dark Maroon** | `#6B0F2A` | Hover states, gradients |
| **White** | `#FFFFFF` | Background, text on dark |
| **Sand** | `#E8D5C4` | Subtle backgrounds |

### Typography

- **Primary Font**: Segoe UI, Dubai (system fonts)
- **Arabic Font**: Cairo, Traditional Arabic
- **Title Weight**: 700 (Bold)
- **Body Weight**: 400 (Regular)

### Design Elements

- **Border Radius**: 8px for modern, friendly feel
- **Shadows**: Subtle depth with maroon-tinted shadows
- **Patterns**: Islamic geometric patterns at low opacity
- **Spacing**: Generous whitespace for clarity

## 🔧 Customization

### Changing Colors

Edit `qatar-apex-login.css`:

```css
:root {
    --qatar-maroon: #8B1538;    /* Your primary color */
    --qatar-gold: #D4AF37;      /* Your accent color */
    /* Customize other colors as needed */
}
```

### Adding Your Logo

Replace the logo in the HTML:

```html
<div class="qatar-emblem">
    <img src="your-logo.png" alt="Your Organization">
</div>
```

### Modifying Text Content

Edit the language configuration in `qatar-apex-login.js`:

```javascript
const CONFIG = {
    languages: {
        en: {
            welcomeBack: 'Your Custom Title',
            welcomeSubtitle: 'Your custom subtitle',
            // ... more text
        },
        ar: {
            // Arabic translations
        }
    }
};
```

## 🌐 Browser Support

| Browser | Version | Status |
|---------|---------|--------|
| Chrome | 90+ | ✅ Full Support |
| Firefox | 88+ | ✅ Full Support |
| Safari | 14+ | ✅ Full Support |
| Edge | 90+ | ✅ Full Support |
| Mobile Safari | 14+ | ✅ Full Support |
| Chrome Mobile | Latest | ✅ Full Support |

## ♿ Accessibility Features

- **Keyboard Navigation**: Full Tab, Enter, Escape support
- **Screen Readers**: ARIA labels on all interactive elements
- **Focus Management**: Clear focus indicators
- **Color Contrast**: WCAG AA compliant (4.5:1 minimum)
- **Text Scaling**: Supports up to 200% zoom
- **Reduced Motion**: Respects user motion preferences

## 🔒 Security Features

1. **Account Lockout**: 5 failed attempts = 5-minute lockout
2. **Password Protection**: No client-side password storage
3. **Input Validation**: Client and server-side validation
4. **Session Security**: Integrates with APEX session management
5. **XSS Protection**: Proper input escaping (handled by APEX)

## 📱 Responsive Breakpoints

```css
/* Desktop: 969px and above */
/* Tablet: 576px - 968px */
/* Mobile: Below 576px */
```

The layout automatically adapts:
- **Desktop**: Two-column layout (branding + form)
- **Tablet**: Two-column or single-column based on orientation
- **Mobile**: Single-column stacked layout

## 🧪 Testing Checklist

Before deploying to production:

- [ ] Test with valid credentials
- [ ] Test with invalid credentials (verify error messages)
- [ ] Test account lockout (5 failed attempts)
- [ ] Test language toggle (EN ↔ AR)
- [ ] Test on desktop browser
- [ ] Test on tablet
- [ ] Test on mobile phone
- [ ] Test keyboard navigation (Tab, Enter)
- [ ] Test with screen reader
- [ ] Test "Remember me" functionality
- [ ] Test password visibility toggle
- [ ] Test forgot password link
- [ ] Verify responsive design at all breakpoints
- [ ] Check browser console for errors
- [ ] Verify HTTPS is enabled (production)

## 📚 Documentation

- **[APEX_INTEGRATION_GUIDE.md](./APEX_INTEGRATION_GUIDE.md)** - Complete integration instructions
- **[demo.html](./demo.html)** - Interactive demo page
- **Inline Code Comments** - All CSS and JS files are well-commented

## 🤝 Contributing

Suggestions and improvements are welcome! If you'd like to contribute:

1. Test the changes thoroughly
2. Ensure accessibility standards are maintained
3. Document any new features
4. Follow the existing code style

## 📄 License

This project is provided as-is for use in Oracle APEX applications.

### Third-Party Resources

- **Oracle APEX**: https://apex.oracle.com
- **Feather Icons**: https://feathericons.com (MIT License)
- **Google Fonts (Cairo)**: https://fonts.google.com (OFL)

## 🆘 Support

### Common Issues

1. **Styles not applying?**
   - Clear browser cache (Ctrl+F5)
   - Verify CSS file is uploaded correctly
   - Check browser console for 404 errors

2. **JavaScript not working?**
   - Verify JS file is uploaded correctly
   - Check browser console for errors
   - Ensure jQuery is loaded (APEX includes it)

3. **Layout broken on mobile?**
   - Verify viewport meta tag is present
   - Test on actual mobile device, not just browser resize

4. **Arabic text not displaying correctly?**
   - Ensure Cairo font is loaded from Google Fonts
   - Verify HTML has `dir="rtl"` when Arabic is active

### Getting Help

- **APEX Documentation**: https://apex.oracle.com/documentation
- **APEX Community**: https://apex.oracle.com/community
- **Stack Overflow**: Tag questions with `oracle-apex`

## 📞 Credits

- **Design**: Based on Qatar national branding guidelines
- **Development**: Custom implementation for Oracle APEX
- **Icons**: Feather Icons (inline SVG)
- **Fonts**: System fonts + Google Fonts (Cairo)

## 📊 Version History

### Version 1.0.0 (December 2025)
- ✨ Initial release
- ✅ Qatar branding implementation
- ✅ Bilingual support (EN/AR)
- ✅ Responsive design
- ✅ Accessibility features (WCAG 2.1 AA)
- ✅ Security features (account lockout, validation)
- ✅ Complete documentation

## 🎓 Additional Resources

### Oracle APEX
- [Official Documentation](https://apex.oracle.com/documentation)
- [APEX Tutorial](https://apex.oracle.com/en/learn/tutorials/)
- [YouTube Channel](https://www.youtube.com/user/OracleAPEX)

### Qatar Branding
- [Qatar Portal](https://portal.www.gov.qa)
- [Qatar Brand Guidelines](https://portal.www.gov.qa/wps/portal/media-center/brandidentity)

### Web Development
- [MDN Web Docs](https://developer.mozilla.org/)
- [WCAG Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Can I Use](https://caniuse.com/) - Browser compatibility

---

## 🌟 Quick Demo

Open `demo.html` in your browser to see the login page in action!

**Demo Credentials** (any credentials work in demo mode):
- Username: demo
- Password: password123

---

**Made with 🇶🇦 for Qatar's Digital Transformation**

*Last Updated: December 2025*  
*Version: 1.0.0*  
*Compatible with: Oracle APEX 19.2+*

