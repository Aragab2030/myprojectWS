# Qatar Branded Oracle APEX Login Page - Integration Guide

## 📋 Table of Contents
1. [Overview](#overview)
2. [Files Included](#files-included)
3. [Prerequisites](#prerequisites)
4. [Installation Methods](#installation-methods)
5. [Configuration](#configuration)
6. [Customization](#customization)
7. [Troubleshooting](#troubleshooting)
8. [Browser Support](#browser-support)
9. [Accessibility](#accessibility)
10. [Security Considerations](#security-considerations)

---

## 🎯 Overview

This Qatar-branded login page provides a modern, secure, and accessible authentication interface for Oracle APEX applications. It follows Qatar's national branding guidelines with the official color palette (Maroon #8B1538, Gold #D4AF37) and incorporates Arabic/English bilingual support.

### Key Features
- ✅ Qatar national branding compliance
- ✅ Responsive design (mobile, tablet, desktop)
- ✅ Bilingual support (English/Arabic with RTL)
- ✅ Form validation and security features
- ✅ Accessibility (WCAG 2.1 AA compliant)
- ✅ Smooth animations and transitions
- ✅ Account lockout protection
- ✅ Remember me functionality
- ✅ Password visibility toggle

---

## 📦 Files Included

```
qatar-apex-login/
├── qatar-apex-login.css          # Main stylesheet with Qatar branding
├── qatar-apex-login.js           # JavaScript for interactions and validation
├── qatar-apex-login.html         # Standalone HTML template (for reference)
├── qatar-logo.svg                # Qatar-themed logo/emblem
├── qatar-patterns.svg            # Decorative background patterns
├── demo.html                     # Complete demo page
├── APEX_INTEGRATION_GUIDE.md     # This file
└── README.md                     # Project overview
```

---

## 🔧 Prerequisites

- Oracle APEX 19.2 or higher (recommended: APEX 21.x or 22.x)
- Workspace Administrator access
- Application Builder access
- Basic knowledge of APEX Shared Components

---

## 🚀 Installation Methods

### Method 1: Using Custom Login Page (Recommended)

This method creates a custom login page within your APEX application.

#### Step 1: Upload Static Files

1. Navigate to **Shared Components > Static Application Files**
2. Upload the following files:
   - `qatar-apex-login.css`
   - `qatar-apex-login.js`
   - `qatar-logo.svg` (optional)
   - `qatar-patterns.svg` (optional)

#### Step 2: Create Login Page

1. In Application Builder, go to **Shared Components > Authentication Schemes**
2. Click on your current authentication scheme (or create a new one)
3. Scroll to **Login Processing**
4. Note the Login Page number (typically page 9999 or 101)

#### Step 3: Modify Login Page

1. Navigate to your Login Page (e.g., Page 9999)
2. In Page Designer, go to **Page Attributes**
3. Modify the page as follows:

**Page CSS:**
```css
/* Include in Page > CSS > Inline */
@import url("#APP_IMAGES#qatar-apex-login.css");

/* Override APEX default login page styles */
body {
    background: none !important;
}

.t-Login-container {
    background: transparent !important;
    box-shadow: none !important;
    max-width: 1000px !important;
}
```

**Page JavaScript:**
```javascript
/* Include in Page > JavaScript > File URLs */
#APP_IMAGES#qatar-apex-login.js
```

#### Step 4: Modify Page Template

1. Go to **Page > Advanced > Page Template**
2. Select **"Login"** template or create a custom one
3. Click on the template name to edit it
4. In the **Body** section, wrap the default content with:

```html
<body class="apex-login-page">
    #BODY#
</body>
```

#### Step 5: Update HTML Structure

1. In your login page, select the **Login Region**
2. Go to **Source > HTML Template** and use:

```html
<div class="apex-login-container">
    <div class="apex-login-branding">
        <div class="qatar-logo-container">
            <div class="qatar-emblem">
                <img src="#APP_IMAGES#qatar-logo.svg" alt="Qatar Logo" style="width: 80px;">
            </div>
            <h1 class="branding-title">Oracle APEX Portal</h1>
            <p class="branding-title-ar">بوابة أوراكل أبكس</p>
        </div>
        <div class="branding-decorative-line"></div>
        <div>
            <p class="branding-subtitle">
                Secure access to enterprise applications and digital services.
            </p>
        </div>
        <div class="branding-features">
            <div class="feature-item">
                <div class="feature-icon">🛡️</div>
                <span class="feature-text">Secure Authentication</span>
            </div>
            <div class="feature-item">
                <div class="feature-icon">⏰</div>
                <span class="feature-text">24/7 Availability</span>
            </div>
            <div class="feature-item">
                <div class="feature-icon">🏢</div>
                <span class="feature-text">Enterprise Grade</span>
            </div>
        </div>
    </div>
    
    <div class="apex-login-form-panel">
        <div class="login-header">
            <h2 class="login-title">Welcome Back</h2>
            <p class="login-subtitle">Enter your credentials to access your account</p>
        </div>
        <div id="alert-container"></div>
        #BODY#
    </div>
</div>
```

#### Step 6: Modify Form Fields

Update the page items for username and password:

**Username Field (P9999_USERNAME or similar):**
- **Label:** Username
- **Template:** Hidden
- **HTML Form Element Attributes:**
  ```
  id="username" class="form-input" placeholder="Enter your username"
  ```

**Password Field (P9999_PASSWORD or similar):**
- **Label:** Password
- **Template:** Hidden
- **HTML Form Element Attributes:**
  ```
  id="password" class="form-input" placeholder="Enter your password"
  ```

**Remember Checkbox (Optional):**
- **HTML Form Element Attributes:**
  ```
  id="remember" class="custom-checkbox"
  ```

---

### Method 2: Using Custom Theme (Advanced)

For organization-wide deployment across multiple applications:

1. **Create Custom Theme:**
   - Navigate to **Shared Components > Themes**
   - Create a new theme or copy an existing one
   - Name it "Qatar Theme"

2. **Modify Theme Templates:**
   - Edit the **Login Page** template
   - Incorporate the Qatar branding CSS and HTML structure
   - Add JavaScript includes to the theme

3. **Apply Theme:**
   - Set as default theme for new applications
   - Subscribe existing applications to this theme

---

### Method 3: Direct CSS/JS Injection (Quick Method)

For quick testing or single-page implementation:

1. Go to your login page
2. In **Page > CSS > Inline CSS**, paste entire contents of `qatar-apex-login.css`
3. In **Page > JavaScript > Execute when Page Loads**, paste `qatar-apex-login.js`
4. Modify the page HTML structure to match the template

---

## ⚙️ Configuration

### Authentication Scheme Settings

1. Navigate to **Shared Components > Authentication Schemes**
2. Select your authentication scheme
3. Configure the following:

**Settings:**
```
Authentication Scheme Type: Application Express Accounts
                           OR
                           Custom Authentication
                           OR
                           LDAP Directory
                           OR
                           Your existing scheme

Login Page: [Your Login Page Number]

Session Not Valid:
  Page: [Your Login Page Number]
  Message: Invalid session. Please login again.

Invalid Authentication:
  Message: Invalid username or password.
  
Maximum Login Attempts: 5
Account Locked Message: Account locked. Contact administrator.
```

### Session Management

Configure session settings in **Shared Components > Security Attributes > Session Management**:

```
Maximum Session Length: 28800 (8 hours)
Maximum Session Idle Time: 3600 (1 hour)
Session Timeout URL: [Your Login Page]
```

### Application Settings

In **Shared Components > Security > Application Settings**:

```
✓ Enable Application Access Control
✓ Session State Protection: Unrestricted
✓ Page Access Protection: Unrestricted
✓ Deep Linking: Disabled
```

---

## 🎨 Customization

### Changing Colors

Edit `qatar-apex-login.css` and modify the CSS variables:

```css
:root {
    /* Primary Colors */
    --qatar-maroon: #8B1538;        /* Your primary color */
    --qatar-gold: #D4AF37;          /* Your accent color */
    --qatar-dark-maroon: #6B0F2A;   /* Darker shade */
    
    /* Customize as needed */
    --your-custom-color: #YOURCOLOR;
}
```

### Adding Your Organization Logo

Replace the SVG logo in the branding panel:

```html
<div class="qatar-emblem">
    <img src="#APP_IMAGES#your-logo.png" alt="Your Organization" style="width: 80px;">
</div>
```

### Customizing Text Content

Modify the `CONFIG` object in `qatar-apex-login.js`:

```javascript
const CONFIG = {
    // ... existing config
    languages: {
        en: {
            welcomeBack: 'Your Custom Title',
            welcomeSubtitle: 'Your custom subtitle',
            // ... modify other text
        },
        ar: {
            // ... Arabic translations
        }
    }
};
```

### Changing Branding Features

Edit the features section in your HTML:

```html
<div class="branding-features">
    <div class="feature-item">
        <div class="feature-icon">🔒</div>
        <span class="feature-text">Your Feature 1</span>
    </div>
    <!-- Add more features -->
</div>
```

---

## 🔍 Troubleshooting

### Common Issues and Solutions

#### 1. Styles Not Applying

**Problem:** The page doesn't look like the Qatar-branded design.

**Solutions:**
- Ensure CSS file is uploaded correctly to Static Application Files
- Check that CSS is properly referenced with `#APP_IMAGES#qatar-apex-login.css`
- Clear browser cache (Ctrl+F5 or Cmd+Shift+R)
- Check browser console for 404 errors
- Verify the page has the class `apex-login-page` on the `<body>` tag

#### 2. JavaScript Not Working

**Problem:** Form validation or interactions don't work.

**Solutions:**
- Ensure JS file is uploaded and referenced correctly
- Check browser console for JavaScript errors
- Verify jQuery is loaded (APEX includes it by default)
- Ensure page items have correct IDs (username, password)

#### 3. Layout Breaking on Mobile

**Problem:** Page doesn't display correctly on mobile devices.

**Solutions:**
- Ensure viewport meta tag is present: `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
- Test with different mobile devices/browsers
- Check for APEX template overrides

#### 4. Authentication Not Working

**Problem:** Users can't log in even with correct credentials.

**Solutions:**
- Verify authentication scheme is active
- Check that username/password fields have correct substitution strings
- Ensure page items are named correctly (e.g., P9999_USERNAME, P9999_PASSWORD)
- Review authentication scheme session not valid settings
- Check application access control settings

#### 5. Arabic/RTL Issues

**Problem:** Arabic text or RTL layout not displaying correctly.

**Solutions:**
- Ensure HTML has `dir="rtl"` when Arabic is selected
- Add Arabic font support: `@import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700&display=swap');`
- Verify language toggle function is working

#### 6. Icons Not Displaying

**Problem:** SVG icons are missing or broken.

**Solutions:**
- Ensure SVG files are uploaded to Static Application Files
- Check file paths are correct
- Use inline SVG instead of file references if needed
- Verify SVG MIME type is supported by web server

---

## 🌐 Browser Support

Tested and supported on:

| Browser | Version | Status |
|---------|---------|--------|
| Chrome | 90+ | ✅ Full Support |
| Firefox | 88+ | ✅ Full Support |
| Safari | 14+ | ✅ Full Support |
| Edge | 90+ | ✅ Full Support |
| Opera | 76+ | ✅ Full Support |
| Mobile Safari (iOS) | 14+ | ✅ Full Support |
| Chrome Mobile | Latest | ✅ Full Support |
| Samsung Internet | Latest | ✅ Full Support |

### Progressive Enhancement

The design uses progressive enhancement:
- Core functionality works on all browsers
- Advanced animations/effects on modern browsers
- Graceful degradation for older browsers

---

## ♿ Accessibility

This login page follows WCAG 2.1 Level AA guidelines:

### Features

- ✅ **Keyboard Navigation:** Full keyboard support (Tab, Enter, Esc)
- ✅ **Screen Readers:** Proper ARIA labels and roles
- ✅ **Focus Indicators:** Visible focus states
- ✅ **Color Contrast:** Meets WCAG AA standards (4.5:1 minimum)
- ✅ **Text Scaling:** Supports up to 200% zoom
- ✅ **Reduced Motion:** Respects `prefers-reduced-motion`
- ✅ **Form Labels:** All inputs have associated labels
- ✅ **Error Messages:** Clear, descriptive error messages

### Testing Accessibility

Use these tools to verify:
- **WAVE Browser Extension:** https://wave.webaim.org/
- **axe DevTools:** https://www.deque.com/axe/devtools/
- **Lighthouse (Chrome DevTools):** Audit > Accessibility

### ARIA Attributes Used

```html
<!-- Form inputs -->
<input aria-label="Username" aria-required="true" aria-invalid="false">

<!-- Error messages -->
<span role="alert" aria-live="polite">Error message</span>

<!-- Buttons -->
<button aria-label="Toggle password visibility">...</button>
```

---

## 🔒 Security Considerations

### Built-in Security Features

1. **Account Lockout Protection**
   - Maximum 5 failed attempts (configurable)
   - 5-minute lockout period
   - Stored in localStorage (client-side only)

2. **Password Protection**
   - No password values stored in browser
   - Toggle visibility option
   - Minimum length validation

3. **Session Security**
   - Remember me uses secure cookies (when implemented)
   - Session timeout handling
   - Invalid session detection

4. **Input Validation**
   - Client-side validation (convenience)
   - Server-side validation (APEX handles)
   - XSS protection (through APEX)

### Additional Recommendations

1. **Enable HTTPS**
   ```
   Always use HTTPS in production
   Configure SSL certificate
   Enable HSTS (HTTP Strict Transport Security)
   ```

2. **APEX Security Settings**
   - Enable Session State Protection
   - Set appropriate session timeouts
   - Configure Content Security Policy
   - Enable Application Access Control

3. **Password Policy**
   - Enforce strong passwords (in APEX authentication scheme)
   - Regular password rotation
   - Password complexity requirements
   - Account recovery process

4. **Network Security**
   - Use firewall rules
   - IP whitelisting (if applicable)
   - VPN for sensitive applications
   - DDoS protection

5. **Monitoring & Logging**
   - Enable APEX activity logs
   - Monitor failed login attempts
   - Set up alerts for suspicious activity
   - Regular security audits

### OWASP Top 10 Compliance

This implementation addresses:
- ✅ A1: Injection (APEX handles)
- ✅ A2: Broken Authentication (lockout, validation)
- ✅ A3: Sensitive Data Exposure (HTTPS required)
- ✅ A5: Broken Access Control (APEX handles)
- ✅ A7: Cross-Site Scripting (APEX escaping)
- ✅ A9: Using Components with Known Vulnerabilities (modern libraries)
- ✅ A10: Insufficient Logging & Monitoring (recommendations included)

---

## 📞 Support & Contact

### Getting Help

1. **APEX Documentation:** https://apex.oracle.com/documentation
2. **APEX Community:** https://apex.oracle.com/community
3. **Stack Overflow:** Tag questions with `oracle-apex`

### Reporting Issues

If you encounter issues with this template:
1. Check the Troubleshooting section
2. Review browser console for errors
3. Verify all files are uploaded correctly
4. Test in a different browser

### Version History

- **v1.0.0** (December 2025) - Initial release
  - Qatar branding implementation
  - Bilingual support (EN/AR)
  - Responsive design
  - Accessibility features

---

## 📄 License & Credits

### License
This template is provided for use in Oracle APEX applications.

### Credits
- **Design:** Based on Qatar national branding guidelines
- **Framework:** Oracle APEX
- **Icons:** Feather Icons (inline SVG)
- **Fonts:** System fonts + Google Fonts (Cairo for Arabic)

### Third-Party Resources
- Oracle APEX: https://apex.oracle.com
- Qatar Brand Guidelines: Official State of Qatar standards

---

## 🎓 Additional Resources

### APEX Learning Resources
- [APEX Documentation](https://apex.oracle.com/documentation)
- [APEX Tutorial](https://apex.oracle.com/en/learn/tutorials/)
- [APEX YouTube Channel](https://www.youtube.com/user/OracleAPEX)

### Design Resources
- [Qatar Brand Guidelines](https://portal.www.gov.qa/wps/portal/media-center/brandidentity)
- [Islamic Geometric Patterns](https://en.wikipedia.org/wiki/Islamic_geometric_patterns)
- [Arabic Typography](https://arabictype.com/)

### Web Accessibility
- [WCAG Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [WebAIM Resources](https://webaim.org/)
- [A11y Project](https://www.a11yproject.com/)

---

## ✅ Checklist for Deployment

Before deploying to production, ensure:

- [ ] All static files uploaded to APEX
- [ ] CSS properly linked and loading
- [ ] JavaScript properly linked and loading
- [ ] Authentication scheme configured
- [ ] Session management settings reviewed
- [ ] Security settings enabled
- [ ] HTTPS enabled
- [ ] Login page tested with valid credentials
- [ ] Login page tested with invalid credentials
- [ ] Forgot password link configured
- [ ] Mobile responsiveness tested
- [ ] Browser compatibility tested
- [ ] Accessibility tested
- [ ] Error handling tested
- [ ] Session timeout tested
- [ ] Arabic/English language toggle tested
- [ ] Performance tested (page load time)
- [ ] User acceptance testing completed
- [ ] Documentation updated for end users
- [ ] Backup of previous login page created

---

**Last Updated:** December 2025  
**Version:** 1.0.0  
**Compatibility:** Oracle APEX 19.2+

