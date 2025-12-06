/**
 * Qatar Portal - Oracle APEX Login Page JavaScript
 * Handles form interactions, password visibility toggle, and form validation
 */

(function() {
    'use strict';

    // DOM Elements
    const loginForm = document.getElementById('loginForm');
    const passwordInput = document.getElementById('password');
    const passwordToggle = document.getElementById('passwordToggle');
    const usernameInput = document.getElementById('username');
    const loginButton = document.getElementById('loginButton');
    const errorMessage = document.getElementById('errorMessage');

    /**
     * Toggle password visibility
     */
    function togglePasswordVisibility() {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            passwordToggle.setAttribute('aria-label', 'Hide password');
            passwordToggle.querySelector('.eye-icon').innerHTML = `
                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                <line x1="1" y1="1" x2="23" y2="23"></line>
            `;
        } else {
            passwordInput.type = 'password';
            passwordToggle.setAttribute('aria-label', 'Show password');
            passwordToggle.querySelector('.eye-icon').innerHTML = `
                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                <circle cx="12" cy="12" r="3"></circle>
            `;
        }
    }

    /**
     * Show error message
     */
    function showError(message) {
        if (errorMessage) {
            errorMessage.textContent = message;
            errorMessage.style.display = 'block';
            errorMessage.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            
            // Auto-hide after 5 seconds
            setTimeout(() => {
                hideError();
            }, 5000);
        }
    }

    /**
     * Hide error message
     */
    function hideError() {
        if (errorMessage) {
            errorMessage.style.display = 'none';
        }
    }

    /**
     * Validate form inputs
     */
    function validateForm() {
        const username = usernameInput.value.trim();
        const password = passwordInput.value;

        hideError();

        if (!username) {
            showError('Please enter your username');
            usernameInput.focus();
            return false;
        }

        if (!password) {
            showError('Please enter your password');
            passwordInput.focus();
            return false;
        }

        if (username.length < 3) {
            showError('Username must be at least 3 characters long');
            usernameInput.focus();
            return false;
        }

        if (password.length < 6) {
            showError('Password must be at least 6 characters long');
            passwordInput.focus();
            return false;
        }

        return true;
    }

    /**
     * Handle form submission
     */
    function handleFormSubmit(event) {
        if (!validateForm()) {
            event.preventDefault();
            return false;
        }

        // Show loading state
        loginButton.classList.add('loading');
        loginButton.disabled = true;
        loginButton.querySelector('span').textContent = 'Signing in...';

        // Allow form to submit normally
        // The form will be submitted to Oracle APEX
        return true;
    }

    /**
     * Handle Enter key press in inputs
     */
    function handleEnterKey(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            if (validateForm()) {
                loginForm.submit();
            }
        }
    }

    /**
     * Initialize event listeners
     */
    function init() {
        // Password toggle
        if (passwordToggle) {
            passwordToggle.addEventListener('click', togglePasswordVisibility);
        }

        // Form submission
        if (loginForm) {
            loginForm.addEventListener('submit', handleFormSubmit);
        }

        // Enter key handling
        if (usernameInput) {
            usernameInput.addEventListener('keypress', handleEnterKey);
        }

        if (passwordInput) {
            passwordInput.addEventListener('keypress', handleEnterKey);
        }

        // Clear error on input
        if (usernameInput) {
            usernameInput.addEventListener('input', hideError);
        }

        if (passwordInput) {
            passwordInput.addEventListener('input', hideError);
        }

        // Check for URL error parameters (Oracle APEX error handling)
        const urlParams = new URLSearchParams(window.location.search);
        const errorParam = urlParams.get('error') || urlParams.get('p_error');
        
        if (errorParam) {
            let errorMsg = 'Invalid username or password. Please try again.';
            
            // Decode error message if needed
            try {
                errorMsg = decodeURIComponent(errorParam);
            } catch (e) {
                // Use default message if decoding fails
            }
            
            showError(errorMsg);
        }

        // Focus on username field when page loads
        if (usernameInput && !usernameInput.value) {
            setTimeout(() => {
                usernameInput.focus();
            }, 100);
        }

        // Add smooth transitions
        document.body.style.transition = 'opacity 0.3s ease';
    }

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

    // Handle browser back/forward navigation
    window.addEventListener('pageshow', function(event) {
        if (event.persisted) {
            // Page was loaded from cache, reset form state
            if (loginButton) {
                loginButton.classList.remove('loading');
                loginButton.disabled = false;
                loginButton.querySelector('span').textContent = 'Sign In';
            }
            hideError();
        }
    });

})();
