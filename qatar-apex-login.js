/**
 * Qatar Branded Oracle APEX Login Page - JavaScript
 * Handles form validation, interactions, and animations
 */

// ==========================================
// Configuration
// ==========================================
const CONFIG = {
    minPasswordLength: 6,
    maxLoginAttempts: 5,
    lockoutDuration: 300000, // 5 minutes in milliseconds
    languages: {
        en: {
            welcomeBack: 'Welcome Back',
            welcomeSubtitle: 'Enter your credentials to access your account',
            username: 'Username',
            password: 'Password',
            rememberMe: 'Remember me',
            forgotPassword: 'Forgot Password?',
            signIn: 'Sign In',
            signingIn: 'Signing In...',
            usernameRequired: 'Username is required',
            passwordRequired: 'Password is required',
            passwordTooShort: 'Password must be at least 6 characters',
            invalidCredentials: 'Invalid username or password',
            accountLocked: 'Account locked due to multiple failed attempts. Please try again later.',
            loginSuccess: 'Login successful! Redirecting...',
            networkError: 'Network error. Please check your connection.'
        },
        ar: {
            welcomeBack: 'مرحباً بعودتك',
            welcomeSubtitle: 'أدخل بيانات الاعتماد الخاصة بك للوصول إلى حسابك',
            username: 'اسم المستخدم',
            password: 'كلمة المرور',
            rememberMe: 'تذكرني',
            forgotPassword: 'نسيت كلمة المرور؟',
            signIn: 'تسجيل الدخول',
            signingIn: 'جاري تسجيل الدخول...',
            usernameRequired: 'اسم المستخدم مطلوب',
            passwordRequired: 'كلمة المرور مطلوبة',
            passwordTooShort: 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل',
            invalidCredentials: 'اسم المستخدم أو كلمة المرور غير صحيحة',
            accountLocked: 'تم قفل الحساب بسبب محاولات فاشلة متعددة. يرجى المحاولة لاحقاً.',
            loginSuccess: 'تم تسجيل الدخول بنجاح! جاري إعادة التوجيه...',
            networkError: 'خطأ في الشبكة. يرجى التحقق من اتصالك.'
        }
    }
};

// Current language (default: English)
let currentLanguage = 'en';

// Login attempt tracking
let loginAttempts = parseInt(localStorage.getItem('loginAttempts') || '0');
let lockoutTime = parseInt(localStorage.getItem('lockoutTime') || '0');

// ==========================================
// Initialization
// ==========================================
document.addEventListener('DOMContentLoaded', function() {
    initializeForm();
    checkAccountLockout();
    loadRememberedUsername();
    setupAccessibility();
});

/**
 * Initialize form elements and event listeners
 */
function initializeForm() {
    const usernameInput = document.getElementById('username');
    const passwordInput = document.getElementById('password');
    
    // Clear any APEX-added classes or attributes that might interfere
    if (usernameInput) {
        usernameInput.addEventListener('input', function() {
            clearError('username');
        });
        usernameInput.addEventListener('blur', function() {
            validateUsername();
        });
    }
    
    if (passwordInput) {
        passwordInput.addEventListener('input', function() {
            clearError('password');
        });
        passwordInput.addEventListener('blur', function() {
            validatePassword();
        });
    }
    
    // Prevent form submission on Enter in input fields (let the form handle it)
    const inputs = document.querySelectorAll('.form-input');
    inputs.forEach(input => {
        input.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                document.getElementById('login-form').dispatchEvent(new Event('submit'));
            }
        });
    });
}

/**
 * Check if account is locked out
 */
function checkAccountLockout() {
    const now = Date.now();
    
    if (lockoutTime > 0 && now < lockoutTime) {
        const remainingTime = Math.ceil((lockoutTime - now) / 1000);
        showAlert('error', CONFIG.languages[currentLanguage].accountLocked + ` (${remainingTime}s)`);
        disableForm(true);
        
        // Set timeout to re-enable form
        setTimeout(() => {
            resetLoginAttempts();
            disableForm(false);
            clearAlerts();
        }, lockoutTime - now);
    } else if (lockoutTime > 0 && now >= lockoutTime) {
        resetLoginAttempts();
    }
}

/**
 * Load remembered username if exists
 */
function loadRememberedUsername() {
    const rememberedUsername = localStorage.getItem('rememberedUsername');
    const rememberCheckbox = document.getElementById('remember');
    
    if (rememberedUsername) {
        document.getElementById('username').value = rememberedUsername;
        if (rememberCheckbox) {
            rememberCheckbox.checked = true;
        }
    }
}

/**
 * Setup accessibility features
 */
function setupAccessibility() {
    // Add ARIA live region for dynamic alerts
    const alertContainer = document.getElementById('alert-container');
    if (alertContainer) {
        alertContainer.setAttribute('role', 'alert');
        alertContainer.setAttribute('aria-live', 'polite');
    }
}

// ==========================================
// Form Validation
// ==========================================

/**
 * Validate username field
 */
function validateUsername() {
    const username = document.getElementById('username').value.trim();
    const lang = CONFIG.languages[currentLanguage];
    
    if (!username) {
        showFieldError('username', lang.usernameRequired);
        return false;
    }
    
    clearError('username');
    return true;
}

/**
 * Validate password field
 */
function validatePassword() {
    const password = document.getElementById('password').value;
    const lang = CONFIG.languages[currentLanguage];
    
    if (!password) {
        showFieldError('password', lang.passwordRequired);
        return false;
    }
    
    if (password.length < CONFIG.minPasswordLength) {
        showFieldError('password', lang.passwordTooShort);
        return false;
    }
    
    clearError('password');
    return true;
}

/**
 * Validate entire form
 */
function validateForm() {
    const isUsernameValid = validateUsername();
    const isPasswordValid = validatePassword();
    
    return isUsernameValid && isPasswordValid;
}

/**
 * Show field-specific error
 */
function showFieldError(fieldId, message) {
    const input = document.getElementById(fieldId);
    const errorElement = document.getElementById(`${fieldId}-error`);
    const errorText = document.getElementById(`${fieldId}-error-text`);
    
    if (input) {
        input.classList.add('error');
        input.setAttribute('aria-invalid', 'true');
    }
    
    if (errorElement && errorText) {
        errorText.textContent = message;
        errorElement.style.display = 'flex';
    }
}

/**
 * Clear field-specific error
 */
function clearError(fieldId) {
    const input = document.getElementById(fieldId);
    const errorElement = document.getElementById(`${fieldId}-error`);
    
    if (input) {
        input.classList.remove('error');
        input.removeAttribute('aria-invalid');
    }
    
    if (errorElement) {
        errorElement.style.display = 'none';
    }
}

// ==========================================
// Alert System
// ==========================================

/**
 * Show alert message
 * @param {string} type - 'success', 'error', or 'info'
 * @param {string} message - Alert message to display
 */
function showAlert(type, message) {
    const container = document.getElementById('alert-container');
    if (!container) return;
    
    const icons = {
        success: '<svg class="alert-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>',
        error: '<svg class="alert-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>',
        info: '<svg class="alert-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="16" x2="12" y2="12"/><line x1="12" y1="8" x2="12.01" y2="8"/></svg>'
    };
    
    const alert = document.createElement('div');
    alert.className = `alert alert-${type}`;
    alert.innerHTML = `
        ${icons[type]}
        <span>${message}</span>
    `;
    
    container.innerHTML = '';
    container.appendChild(alert);
}

/**
 * Clear all alerts
 */
function clearAlerts() {
    const container = document.getElementById('alert-container');
    if (container) {
        container.innerHTML = '';
    }
}

// ==========================================
// Form Submission Handler
// ==========================================

/**
 * Handle login form submission
 */
function handleLogin(event) {
    event.preventDefault();
    
    // Clear previous alerts
    clearAlerts();
    
    // Check if account is locked
    if (lockoutTime > Date.now()) {
        showAlert('error', CONFIG.languages[currentLanguage].accountLocked);
        return;
    }
    
    // Validate form
    if (!validateForm()) {
        return;
    }
    
    // Get form values
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value;
    const remember = document.getElementById('remember').checked;
    
    // Handle remember me
    if (remember) {
        localStorage.setItem('rememberedUsername', username);
    } else {
        localStorage.removeItem('rememberedUsername');
    }
    
    // Show loading state
    setLoadingState(true);
    
    // In a real APEX application, this would submit to APEX authentication
    // For now, we'll simulate the process
    simulateLogin(username, password);
}

/**
 * Simulate login process (for demo/testing)
 * In production, remove this and let APEX handle authentication
 */
function simulateLogin(username, password) {
    // Simulate network delay
    setTimeout(() => {
        // For demo purposes, accept any non-empty credentials
        // In production APEX, remove this entire function
        
        const success = username && password && password.length >= CONFIG.minPasswordLength;
        
        if (success) {
            handleLoginSuccess();
        } else {
            handleLoginFailure();
        }
    }, 1500);
}

/**
 * Handle successful login
 */
function handleLoginSuccess() {
    resetLoginAttempts();
    showAlert('success', CONFIG.languages[currentLanguage].loginSuccess);
    
    // In production APEX, the page will redirect automatically
    // For demo, simulate redirect after 1 second
    setTimeout(() => {
        // window.location.href = 'your-apex-app-url';
        console.log('Redirecting to APEX application...');
    }, 1000);
}

/**
 * Handle failed login
 */
function handleLoginFailure() {
    loginAttempts++;
    localStorage.setItem('loginAttempts', loginAttempts.toString());
    
    setLoadingState(false);
    
    if (loginAttempts >= CONFIG.maxLoginAttempts) {
        // Lock account
        lockoutTime = Date.now() + CONFIG.lockoutDuration;
        localStorage.setItem('lockoutTime', lockoutTime.toString());
        showAlert('error', CONFIG.languages[currentLanguage].accountLocked);
        disableForm(true);
        
        // Schedule unlock
        setTimeout(() => {
            resetLoginAttempts();
            disableForm(false);
            clearAlerts();
        }, CONFIG.lockoutDuration);
    } else {
        const remainingAttempts = CONFIG.maxLoginAttempts - loginAttempts;
        showAlert('error', `${CONFIG.languages[currentLanguage].invalidCredentials} (${remainingAttempts} attempts remaining)`);
    }
}

/**
 * Reset login attempts
 */
function resetLoginAttempts() {
    loginAttempts = 0;
    lockoutTime = 0;
    localStorage.setItem('loginAttempts', '0');
    localStorage.setItem('lockoutTime', '0');
}

/**
 * Set form loading state
 */
function setLoadingState(isLoading) {
    const button = document.getElementById('login-button');
    const buttonText = document.getElementById('login-button-text');
    const form = document.getElementById('login-form');
    
    if (isLoading) {
        button.classList.add('loading');
        button.disabled = true;
        buttonText.innerHTML = '<span class="spinner"></span>' + CONFIG.languages[currentLanguage].signingIn;
        
        // Disable all inputs
        const inputs = form.querySelectorAll('input, button');
        inputs.forEach(input => input.disabled = true);
    } else {
        button.classList.remove('loading');
        button.disabled = false;
        buttonText.textContent = CONFIG.languages[currentLanguage].signIn;
        
        // Re-enable all inputs
        const inputs = form.querySelectorAll('input, button');
        inputs.forEach(input => input.disabled = false);
    }
}

/**
 * Disable/enable entire form
 */
function disableForm(disable) {
    const form = document.getElementById('login-form');
    const inputs = form.querySelectorAll('input, button');
    
    inputs.forEach(input => {
        input.disabled = disable;
    });
}

// ==========================================
// Password Toggle
// ==========================================

/**
 * Toggle password visibility
 */
function togglePassword() {
    const passwordInput = document.getElementById('password');
    const eyeIcon = document.getElementById('eye-icon');
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        eyeIcon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';
    } else {
        passwordInput.type = 'password';
        eyeIcon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
    }
}

// ==========================================
// Language Toggle
// ==========================================

/**
 * Toggle between English and Arabic
 */
function toggleLanguage() {
    currentLanguage = currentLanguage === 'en' ? 'ar' : 'en';
    updateLanguage();
}

/**
 * Update UI text based on current language
 */
function updateLanguage() {
    const lang = CONFIG.languages[currentLanguage];
    const html = document.documentElement;
    const langButton = document.getElementById('current-lang');
    
    // Update language button
    if (langButton) {
        langButton.textContent = currentLanguage === 'en' ? 'EN' : 'AR';
    }
    
    // Update HTML direction for RTL
    html.setAttribute('dir', currentLanguage === 'ar' ? 'rtl' : 'ltr');
    html.setAttribute('lang', currentLanguage);
    
    // Update all text elements
    document.querySelector('.login-title').textContent = lang.welcomeBack;
    document.querySelector('.login-subtitle').textContent = lang.welcomeSubtitle;
    document.querySelector('label[for="username"]').innerHTML = lang.username + '<span style="color: var(--qatar-error);">*</span>';
    document.querySelector('label[for="password"]').innerHTML = lang.password + '<span style="color: var(--qatar-error);">*</span>';
    document.querySelector('.remember-label').textContent = lang.rememberMe;
    document.querySelector('.forgot-password').textContent = lang.forgotPassword;
    document.getElementById('login-button-text').textContent = lang.signIn;
    
    // Update font family for Arabic
    if (currentLanguage === 'ar') {
        document.body.style.fontFamily = "'Cairo', 'Traditional Arabic', sans-serif";
    } else {
        document.body.style.fontFamily = "'Segoe UI', 'Dubai', 'Helvetica Neue', Arial, sans-serif";
    }
    
    // Save language preference
    localStorage.setItem('preferredLanguage', currentLanguage);
}

/**
 * Load saved language preference
 */
function loadLanguagePreference() {
    const savedLang = localStorage.getItem('preferredLanguage');
    if (savedLang && (savedLang === 'en' || savedLang === 'ar')) {
        currentLanguage = savedLang;
        updateLanguage();
    }
}

// Load language preference on page load
loadLanguagePreference();

// ==========================================
// Forgot Password Handler
// ==========================================

/**
 * Handle forgot password click
 */
function handleForgotPassword(event) {
    event.preventDefault();
    
    // In APEX, this would typically redirect to a password reset page
    // For now, show an info message
    showAlert('info', 'Password reset functionality will redirect to the recovery page.');
    
    // In production APEX:
    // window.location.href = 'f?p=&APP_ID.:PASSWORD_RESET:&SESSION.';
}

// ==========================================
// SSO Login Handler (Optional)
// ==========================================

/**
 * Handle SSO login
 */
function handleSSOLogin() {
    // Implement SSO logic here
    showAlert('info', 'Redirecting to Single Sign-On provider...');
    
    // In production:
    // window.location.href = 'your-sso-provider-url';
}

// ==========================================
// APEX Integration Helpers
// ==========================================

/**
 * Get APEX session information
 */
function getApexSession() {
    // This would be populated by APEX in production
    return {
        appId: typeof apex !== 'undefined' && apex.env ? apex.env.APP_ID : null,
        pageId: typeof apex !== 'undefined' && apex.env ? apex.env.APP_PAGE_ID : null,
        session: typeof apex !== 'undefined' && apex.env ? apex.env.APP_SESSION : null
    };
}

/**
 * Submit form to APEX (for production use)
 */
function submitToApex() {
    // In production APEX environment, the form will naturally submit to:
    // wwv_flow.accept with p_username and p_password parameters
    // This is handled automatically by APEX's login process
    
    // For custom APEX integration:
    if (typeof apex !== 'undefined' && apex.submit) {
        apex.submit({
            request: 'LOGIN',
            validate: true
        });
    }
}

// ==========================================
// Utility Functions
// ==========================================

/**
 * Debounce function for input validation
 */
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

/**
 * Check if browser has localStorage support
 */
function supportsLocalStorage() {
    try {
        const test = '__localStorage_test__';
        localStorage.setItem(test, test);
        localStorage.removeItem(test);
        return true;
    } catch (e) {
        return false;
    }
}

// ==========================================
// Console Message
// ==========================================
console.log('%c Qatar Branded APEX Login ', 'background: #8B1538; color: #fff; padding: 5px 10px; border-radius: 3px;');
console.log('Version: 1.0.0');
console.log('Environment:', getApexSession());
