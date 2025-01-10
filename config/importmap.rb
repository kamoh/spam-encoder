# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# pin 'controllers/spam-encoder', to: 'spam-encoder.js'

# pin_all_from "app/javascript" in config/importmap.rb will pre-set each of your JS files as a module that can be included with import "path/file"

# Add yield :head AFTER <%= javascript_importmap_tags %> in app/views/layouts/application.html.erb

# Then if/when you have a page that has specific JS you want to import, you can use the below to include a JS file on a single page.

# <% content_for(:head) do %> <%= javascript_import_module_tag("path/file") > <% end %>
