-- ============================================================================
-- Qatar Branded APEX Login Page Template
-- ============================================================================
-- This SQL script helps you quickly set up the Qatar-branded login page
-- in your Oracle APEX application.
--
-- INSTRUCTIONS:
-- 1. Replace [YOUR_APP_ID] with your actual Application ID
-- 2. Replace [YOUR_LOGIN_PAGE] with your login page number (typically 9999 or 101)
-- 3. Ensure CSS and JS files are uploaded to Static Application Files
-- 4. Run this script in SQL Workshop > SQL Commands
-- ============================================================================

-- Step 1: Update Login Page Template (if using default login template)
-- This example shows how to customize the login page

BEGIN
    -- Update page template to include Qatar branding class
    APEX_APPLICATION_PAGE.UPDATE_PAGE(
        p_application_id => [YOUR_APP_ID],
        p_page_id => [YOUR_LOGIN_PAGE],
        p_page_template_display_name => 'Login',
        p_css_inline => q'[
/* Qatar Branded APEX Login Page Styles */

/* Import main Qatar branding CSS */
/* Note: Upload qatar-apex-login.css to Static Application Files first */
@import url("#APP_IMAGES#qatar-apex-login.css");

/* APEX-specific overrides */
body {
    background: none !important;
}

.t-Login-body {
    background: transparent !important;
}

.t-Login-container {
    background: transparent !important;
    box-shadow: none !important;
    max-width: 1000px !important;
    margin: 0 auto !important;
}

.t-Login-region {
    background: white !important;
    border-radius: 16px !important;
    box-shadow: 0 8px 24px rgba(139, 21, 56, 0.2) !important;
    padding: 0 !important;
}

/* Hide default APEX login title */
.t-Login-header {
    display: none;
}

/* Style APEX form items */
.apex-item-wrapper .apex-item-text,
.apex-item-wrapper .apex-item-password {
    border: 2px solid #D4D4D4 !important;
    border-radius: 8px !important;
    padding: 14px 16px 14px 48px !important;
    font-size: 15px !important;
    transition: all 0.3s ease !important;
}

.apex-item-wrapper .apex-item-text:focus,
.apex-item-wrapper .apex-item-password:focus {
    border-color: #8B1538 !important;
    box-shadow: 0 0 0 3px rgba(139, 21, 56, 0.1) !important;
    outline: none !important;
}

/* Style APEX login button */
.t-Button--hot,
button[type="submit"].t-Button {
    background: linear-gradient(135deg, #8B1538 0%, #6B0F2A 100%) !important;
    border: none !important;
    color: white !important;
    padding: 16px 24px !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    border-radius: 8px !important;
    cursor: pointer !important;
    transition: all 0.3s ease !important;
    box-shadow: 0 4px 8px rgba(139, 21, 56, 0.15) !important;
    width: 100% !important;
}

.t-Button--hot:hover,
button[type="submit"].t-Button:hover {
    transform: translateY(-2px) !important;
    box-shadow: 0 6px 16px rgba(139, 21, 56, 0.3) !important;
}

/* Style labels */
.t-Form-label {
    font-size: 14px !important;
    font-weight: 600 !important;
    color: #2C2C2C !important;
}

/* Error messages */
.t-Alert--horizontal.t-Alert--defaultIcons.t-Alert--warning {
    background: #FFEBEE !important;
    color: #D32F2F !important;
    border: 1px solid #FFCDD2 !important;
    border-radius: 8px !important;
}
]',
        p_javascript_file_urls => '#APP_IMAGES#qatar-apex-login.js'
    );
    
    COMMIT;
END;
/

-- ============================================================================
-- Alternative: Manual HTML Template for Login Region
-- ============================================================================
-- Copy this HTML into your Login Region's Region Template
-- Navigate to: Page Designer > Login Region > Source > HTML Template
-- ============================================================================

/*
<div class="apex-login-container">
    <!-- Left Panel: Qatar Branding -->
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
                Built with excellence for Qatar's digital transformation.
            </p>
        </div>
        <div class="branding-features">
            <div class="feature-item">
                <div class="feature-icon">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                    </svg>
                </div>
                <span class="feature-text">Secure Authentication</span>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"/>
                        <polyline points="12 6 12 12 16 14"/>
                    </svg>
                </div>
                <span class="feature-text">24/7 Availability</span>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 2L2 7l10 5 10-5-10-5z"/>
                        <path d="M2 17l10 5 10-5M2 12l10 5 10-5"/>
                    </svg>
                </div>
                <span class="feature-text">Enterprise Grade</span>
            </div>
        </div>
    </div>
    
    <!-- Right Panel: Login Form -->
    <div class="apex-login-form-panel">
        <div class="login-header">
            <h2 class="login-title">Welcome Back</h2>
            <p class="login-subtitle">Enter your credentials to access your account</p>
        </div>
        <div id="alert-container"></div>
        
        <!-- APEX will inject the form fields here -->
        #BODY#
    </div>
</div>
*/

-- ============================================================================
-- Language Selector (Optional)
-- ============================================================================
-- Add this as a Static Region before the Login Region
-- Position: Before the login container
-- ============================================================================

/*
<div class="language-selector">
    <button class="language-toggle" onclick="toggleLanguage()">
        <span id="current-lang">EN</span>
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polyline points="6 9 12 15 18 9"></polyline>
        </svg>
    </button>
</div>
*/

-- ============================================================================
-- Authentication Scheme Configuration
-- ============================================================================
-- Configure your authentication scheme with these recommended settings:
--
-- 1. Navigate to: Shared Components > Authentication Schemes
-- 2. Click on your authentication scheme
-- 3. Update the following settings:
--
-- Login Processing:
--   - Login Page: [YOUR_LOGIN_PAGE]
--   - Maximum Login Attempts: 5
--   - Account Locked Message: "Your account has been locked due to multiple failed login attempts. Please try again after 5 minutes."
--
-- Session Management:
--   - Maximum Session Length: 28800 seconds (8 hours)
--   - Maximum Session Idle Time: 3600 seconds (1 hour)
--
-- Security:
--   - Verify function: [Your verification logic]
--   - Post-Authentication Procedure: [Optional]
--   - Switch in Session: [As needed]
-- ============================================================================

-- ============================================================================
-- Application Settings Recommendations
-- ============================================================================
-- Navigate to: Shared Components > Security Attributes
--
-- Session Management:
--   ✓ Session Timeout URL: f?p=&APP_ID.:&LOGIN_PAGE.
--   ✓ Maximum Session Length: 28800
--   ✓ Maximum Session Idle Time: 3600
--
-- Security:
--   ✓ Session State Protection: Unrestricted (or as per your requirements)
--   ✓ Page Access Protection: Unrestricted
--   ✓ Deep Linking: Disabled
--   ✓ Browser Security:
--     - Embed in Frames: Deny
--     - HTML Escaping Mode: Extended
--
-- Database Session:
--   ✓ Initialization PL/SQL Code: [Your session setup code]
--   ✓ Cleanup PL/SQL Code: [Your cleanup code]
-- ============================================================================

-- ============================================================================
-- Testing Checklist
-- ============================================================================
-- After implementing, test the following:
--
-- [ ] Valid credentials login successfully
-- [ ] Invalid credentials show error message
-- [ ] Account lockout after 5 failed attempts
-- [ ] Session timeout redirects to login
-- [ ] Mobile responsive design works correctly
-- [ ] Keyboard navigation (Tab, Enter) works
-- [ ] Language toggle (if implemented) works
-- [ ] Password visibility toggle works
-- [ ] Remember me (if implemented) works
-- [ ] HTTPS is enabled in production
-- [ ] No console errors in browser
-- [ ] Page loads in under 3 seconds
-- [ ] Accessibility testing passed
-- ============================================================================

-- ============================================================================
-- Additional Resources
-- ============================================================================
-- For detailed instructions, see:
-- - APEX_INTEGRATION_GUIDE.md
-- - README.md
-- - demo.html (for visual reference)
-- ============================================================================

PROMPT
PROMPT ====================================================================
PROMPT Qatar Branded APEX Login Page Setup
PROMPT ====================================================================
PROMPT
PROMPT Next Steps:
PROMPT 1. Upload CSS and JS files to Static Application Files
PROMPT 2. Update [YOUR_APP_ID] and [YOUR_LOGIN_PAGE] in this script
PROMPT 3. Run the PL/SQL block above
PROMPT 4. Test the login page
PROMPT 5. Refer to APEX_INTEGRATION_GUIDE.md for detailed instructions
PROMPT
PROMPT ====================================================================
