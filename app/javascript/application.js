// app/javascript/application.js

// Turbo for page transitions
import "@hotwired/turbo-rails"



// Bootstrap (you’ve pinned it correctly)
import "bootstrap"
import "@popperjs/core"

// Stimulus controllers (optional but good)
import "controllers"

// Rails UJS for method: :delete in link_to
import Rails from "@rails/ujs"
Rails.start()
