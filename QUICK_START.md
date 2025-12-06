# 🚀 Quick Start Guide - Qatar Branded APEX Login

Get your Qatar-branded login page up and running in **5 minutes**!

## 📋 Prerequisites

- ✅ Oracle APEX 19.2 or higher
- ✅ Workspace Administrator access
- ✅ Application Builder permissions

## ⚡ Fast Track Installation

### Step 1: Upload Files (2 minutes)

1. Go to **Shared Components → Static Application Files**
2. Click **Create File**
3. Upload these 3 files:
   - ✅ `qatar-apex-login.css`
   - ✅ `qatar-apex-login.js`
   - ✅ `qatar-logo.svg` (optional)

### Step 2: Update Login Page (2 minutes)

1. Navigate to your **Login Page** (usually page 9999 or 101)
2. Go to **Page Attributes**
3. Add to **CSS → Inline**:
   ```css
   @import url("#APP_IMAGES#qatar-apex-login.css");
   ```
4. Add to **JavaScript → File URLs**:
   ```
   #APP_IMAGES#qatar-apex-login.js
   ```

### Step 3: Update Page HTML (1 minute)

1. Select your **Login Region**
2. Go to **Source → HTML Template**
3. Replace with:

```html
<div class="apex-login-container">
    <div class="apex-login-branding">
        <div class="qatar-logo-container">
            <div class="qatar-emblem">
                <img src="#APP_IMAGES#qatar-logo.svg" alt="Qatar" style="width:80px">
            </div>
            <h1 class="branding-title">Oracle APEX Portal</h1>
            <p class="branding-title-ar">بوابة أوراكل أبكس</p>
        </div>
        <div class="branding-decorative-line"></div>
        <p class="branding-subtitle">Secure access to enterprise applications.</p>
    </div>
    <div class="apex-login-form-panel">
        <div class="login-header">
            <h2 class="login-title">Welcome Back</h2>
            <p class="login-subtitle">Enter your credentials</p>
        </div>
        <div id="alert-container"></div>
        #BODY#
    </div>
</div>
```

## ✅ That's It!

**Test your login page:**
- Try logging in with valid credentials ✓
- Test mobile responsiveness ✓
- Try the language toggle (if added) ✓

---

## 🎨 Optional Enhancements

### Add Language Toggle

Add this as a **Static Region** before your login container:

```html
<div class="language-selector">
    <button class="language-toggle" onclick="toggleLanguage()">
        <span id="current-lang">EN</span>
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polyline points="6 9 12 15 18 9"></polyline>
        </svg>
    </button>
</div>
```

### Customize Colors

Edit the CSS file and change these variables:

```css
:root {
    --qatar-maroon: #8B1538;    /* Your primary color */
    --qatar-gold: #D4AF37;      /* Your accent color */
}
```

### Add Your Logo

Replace the logo image source:

```html
<img src="#APP_IMAGES#your-logo.png" alt="Your Org">
```

---

## 🔍 Troubleshooting

| Problem | Solution |
|---------|----------|
| Styles not showing | Clear browser cache (Ctrl+F5) |
| 404 errors | Verify files uploaded to Static Files |
| Layout broken | Check viewport meta tag |
| JS not working | Check browser console for errors |

---

## 📚 Need More Help?

- **Detailed Guide**: See `APEX_INTEGRATION_GUIDE.md`
- **Demo**: Open `demo.html` in your browser
- **SQL Script**: Use `apex-login-template.sql` for automated setup

---

## 🎯 Testing Checklist

Before going live:

- [ ] Login with valid credentials works
- [ ] Invalid credentials show error
- [ ] Mobile view looks good
- [ ] Keyboard navigation works (Tab, Enter)
- [ ] No console errors
- [ ] HTTPS enabled (production)

---

## 🆘 Quick Fixes

### CSS Not Loading?
```css
/* Try absolute URL */
@import url("https://your-apex-domain/apex/app_images/qatar-apex-login.css");
```

### JS Not Working?
```javascript
// Check if file loaded
console.log('JS loaded:', typeof toggleLanguage !== 'undefined');
```

### Form Not Submitting?
- Verify page items are named correctly (P9999_USERNAME, P9999_PASSWORD)
- Check authentication scheme is active
- Ensure login button type is "submit"

---

## 🌟 Quick Tips

💡 **Use APEX Page Designer** - It's easier than editing raw HTML  
💡 **Test in Private/Incognito** - Avoids cache issues  
💡 **Check Mobile First** - Most users will access from phones  
💡 **Enable Session Timeout** - Security best practice  
💡 **Regular Backups** - Before making changes  

---

## 📞 Support Resources

- **APEX Docs**: https://apex.oracle.com/documentation
- **APEX Community**: https://apex.oracle.com/community
- **Stack Overflow**: Tag `oracle-apex`

---

## ✨ Pro Tips

### Performance Optimization
```css
/* Preload critical assets */
<link rel="preload" href="#APP_IMAGES#qatar-apex-login.css" as="style">
```

### Security Enhancement
```sql
-- Enable session state protection
BEGIN
    APEX_UTIL.SET_SESSION_STATE_PROTECTION(
        p_enabled => TRUE,
        p_page_id => :APP_PAGE_ID
    );
END;
```

### Mobile Testing
```
- iOS Safari 14+
- Chrome Mobile
- Samsung Internet
```

---

**Time to Deploy**: ~5 minutes  
**Difficulty**: Easy ⭐  
**Support**: Full documentation included  

**🇶🇦 Made for Qatar's Digital Excellence**

Last Updated: December 2025 | Version 1.0.0
