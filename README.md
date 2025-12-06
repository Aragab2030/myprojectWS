# Qatar Branded Oracle APEX Login Page

A custom login page for Oracle APEX applications featuring Qatar branding guidelines with maroon/burgundy color scheme and modern, accessible design.

## Features

- **Qatar Branding**: Uses official Qatar colors (maroon #8B1538) and design elements
- **Bilingual Support**: Includes Arabic and English text
- **Modern UI**: Clean, professional design with smooth animations
- **Responsive**: Works seamlessly on desktop, tablet, and mobile devices
- **Accessible**: WCAG compliant with proper ARIA labels and keyboard navigation
- **Password Toggle**: Show/hide password functionality
- **Form Validation**: Client-side validation with error messages
- **Oracle APEX Compatible**: Includes all necessary hidden fields for APEX authentication

## Files Included

- `login.html` - Main HTML structure for the login page
- `login.css` - Qatar-branded stylesheet with all styling
- `login.js` - JavaScript for form interactions and validation

## Installation Instructions

### Method 1: Using Static Application Files (Recommended)

1. **Upload Files to Oracle APEX Static Application Files**:
   - Log into your Oracle APEX workspace
   - Navigate to **Shared Components** → **Static Application Files**
   - Upload `login.html`, `login.css`, and `login.js` files
   - Note the file URLs (you'll need these in the next step)

2. **Configure Authentication Scheme**:
   - Navigate to **Shared Components** → **Authentication Schemes**
   - Edit your authentication scheme (or create a new one)
   - Go to the **Login Page** section
   - Set **Login Page** to "Custom"
   - In **Login Page URL**, enter the URL to your `login.html` file
   - Save changes

3. **Update File References** (if needed):
   - If your files are in a different location, update the `<link>` and `<script>` tags in `login.html` to point to the correct paths

### Method 2: Using Web Server

1. **Upload Files to Web Server**:
   - Upload all three files (`login.html`, `login.css`, `login.js`) to your web server
   - Ensure they are accessible via HTTP/HTTPS

2. **Configure Authentication Scheme**:
   - Navigate to **Shared Components** → **Authentication Schemes**
   - Edit your authentication scheme
   - Set **Login Page** to "Custom"
   - In **Login Page URL**, enter the full URL to your `login.html` file (e.g., `https://yourserver.com/login.html`)

### Method 3: Inline Styles (Single File)

If you prefer a single file approach:

1. Copy the CSS from `login.css` and place it in a `<style>` tag in the `<head>` of `login.html`
2. Copy the JavaScript from `login.js` and place it in a `<script>` tag before the closing `</body>` tag
3. Upload only the modified `login.html` file

## Customization

### Colors

The color scheme can be customized by modifying CSS variables in `login.css`:

```css
:root {
    --qatar-maroon: #8B1538;        /* Primary maroon color */
    --qatar-maroon-dark: #6B0F2A;   /* Darker maroon for gradients */
    --qatar-maroon-light: #A51D47;  /* Lighter maroon */
    --qatar-white: #FFFFFF;          /* White background */
    /* ... other colors ... */
}
```

### Branding Text

Update the branding text in `login.html`:

```html
<h1 class="brand-title">Qatar Portal</h1>
<p class="brand-subtitle">مرحباً بكم | Welcome</p>
```

### Logo

To add a logo image:

1. Upload your logo file to Static Application Files
2. Add an `<img>` tag in the `.logo-section` div:

```html
<div class="logo-section">
    <img src="#APP_IMAGES#your-logo.png" alt="Qatar Logo" class="brand-logo">
    <h1 class="brand-title">Qatar Portal</h1>
    <!-- ... -->
</div>
```

## Oracle APEX Substitution Strings

The login page uses Oracle APEX substitution strings (prefixed with `#`) that are automatically replaced by APEX:

- `#LOGIN#` - Login URL
- `#REQUEST#` - Request value
- `#INSTANCE#` - Instance ID
- `#FLOW_ID#` - Application ID
- `#FLOW_STEP_ID#` - Page ID
- `#PAGE_ID#` - Page ID
- `#ARG_NAMES#` - Argument names
- `#ARG_VALUES#` - Argument values
- `#ITEM_NAMES#` - Item names
- `#ITEM_VALUES#` - Item values

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Security Considerations

- The form uses POST method for secure credential transmission
- Password fields use `autocomplete="current-password"` for better browser integration
- No credentials are stored in JavaScript or cookies
- All authentication is handled by Oracle APEX server-side

## Troubleshooting

### Login Form Not Submitting

- Verify all hidden form fields are present
- Check that the form action points to `#LOGIN#`
- Ensure JavaScript is enabled in the browser
- Check browser console for JavaScript errors

### Styling Not Applied

- Verify `login.css` is uploaded and accessible
- Check the file path in the `<link>` tag matches the uploaded location
- Clear browser cache and reload

### Password Toggle Not Working

- Ensure `login.js` is loaded correctly
- Check browser console for JavaScript errors
- Verify the password toggle button has the correct ID

## License

This login page template is provided as-is for use with Oracle APEX applications.

## Support

For Oracle APEX specific issues, refer to the [Oracle APEX Documentation](https://docs.oracle.com/en/database/oracle/application-express/).

---

**Note**: Remember to test the login page thoroughly in your Oracle APEX environment before deploying to production.
