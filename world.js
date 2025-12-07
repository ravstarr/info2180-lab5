{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c100000;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 /**\
 * INFO2180 Lab 5 - World Database Lookup\
 * JavaScript file for handling AJAX requests\
 * Author: Ravaughn Marsh\
 */\
\
document.addEventListener('DOMContentLoaded', function() \{\
    const countryInput = document.getElementById('country');\
    const lookupBtn = document.getElementById('lookup');\
    const lookupCitiesBtn = document.getElementById('lookupCities');\
    const resultDiv = document.getElementById('result');\
    \
    // Helper function to show loading state\
    function showLoading() \{\
        resultDiv.innerHTML = `\
            <div class="loading">\
                <div class="spinner"></div>\
                <p>Loading data...</p>\
            </div>\
        `;\
    \}\
    \
    // Helper function to handle errors\
    function showError(message) \{\
        resultDiv.innerHTML = `\
            <div class="error">\
                <p style="color: #e74c3c;">\uc0\u10060  Error: $\{message\}</p>\
                <p>Please try again or check your connection.</p>\
            </div>\
        `;\
    \}\
    \
    // Helper function to make AJAX request\
    function fetchData(url, type) \{\
        showLoading();\
        \
        fetch(url)\
            .then(response => \{\
                if (!response.ok) \{\
                    throw new Error(`HTTP error! Status: $\{response.status\}`);\
                \}\
                return response.text();\
            \})\
            .then(data => \{\
                resultDiv.innerHTML = data;\
                \
                // Add some custom styles for the loaded content\
                const style = document.createElement('style');\
                style.textContent = `\
                    .loading \{\
                        text-align: center;\
                        padding: 40px;\
                    \}\
                    .spinner \{\
                        border: 4px solid #f3f3f3;\
                        border-top: 4px solid #3498db;\
                        border-radius: 50%;\
                        width: 40px;\
                        height: 40px;\
                        animation: spin 1s linear infinite;\
                        margin: 0 auto 20px;\
                    \}\
                    @keyframes spin \{\
                        0% \{ transform: rotate(0deg); \}\
                        100% \{ transform: rotate(360deg); \}\
                    \}\
                    .error \{\
                        background: #ffeaea;\
                        padding: 20px;\
                        border-radius: 8px;\
                        border-left: 4px solid #e74c3c;\
                    \}\
                `;\
                document.head.appendChild(style);\
            \})\
            .catch(error => \{\
                console.error('Fetch error:', error);\
                showError(error.message);\
            \});\
    \}\
    \
    // Country lookup button handler\
    lookupBtn.addEventListener('click', function() \{\
        const country = countryInput.value.trim();\
        const url = `world.php?country=$\{encodeURIComponent(country)\}`;\
        fetchData(url, 'countries');\
        \
        // Add visual feedback\
        this.style.transform = 'scale(0.95)';\
        setTimeout(() => \{\
            this.style.transform = 'scale(1)';\
        \}, 150);\
    \});\
    \
    // Cities lookup button handler\
    lookupCitiesBtn.addEventListener('click', function() \{\
        const country = countryInput.value.trim();\
        const url = `world.php?country=$\{encodeURIComponent(country)\}&lookup=cities`;\
        fetchData(url, 'cities');\
        \
        // Add visual feedback\
        this.style.transform = 'scale(0.95)';\
        setTimeout(() => \{\
            this.style.transform = 'scale(1)';\
        \}, 150);\
    \});\
    \
    // Allow pressing Enter in the input field\
    countryInput.addEventListener('keypress', function(event) \{\
        if (event.key === 'Enter') \{\
            event.preventDefault();\
            lookupBtn.click();\
        \}\
    \});\
    \
    // Focus the input field on page load\
    countryInput.focus();\
    \
    // Add some initial instructions\
    console.log('World Database Lookup initialized');\
    console.log('Enter a country name and click Lookup or Lookup Cities');\
\});\
}