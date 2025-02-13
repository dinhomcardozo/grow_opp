# Pin your application's JavaScript files here
pin "application", preload: true

# Turbo and Stimulus dependencies
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

# Import all Stimulus controllers from the `app/javascript/controllers` directory
pin_all_from "app/javascript/controllers", under: "controllers"

# Optional: Add external libraries like jQuery
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"