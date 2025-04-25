// app/javascript/application.js

// Turbo
import "@hotwired/turbo-rails"

// Stimulus (if using it)
import "controllers"

// Rails UJS
import Rails from "@rails/ujs"
Rails.start()

// Bootstrap (includes Popper internally)
import "bootstrap"
