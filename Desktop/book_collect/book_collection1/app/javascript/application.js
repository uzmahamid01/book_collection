// app/javascript/application.js
import { Turbo } from "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";

Turbo.start();

const application = Application.start();
application.debug = false;
window.Stimulus = application;

export { application };
// javascript/application.js
// assets/javascripts/application.js

// assets/javascripts/application.js

// assets/javascripts/application.js

document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('confirmationModal');
  const cancelButton = document.getElementById('cancelModal');
  const confirmButton = document.getElementById('confirmDelete');

  // Open modal
  document.querySelectorAll('.delete-link').forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      modal.style.display = 'block';
      confirmButton.href = this.href; // Set the href of the confirm button to the link href
    });
  });

  // Close modal
  cancelButton.addEventListener('click', function() {
    modal.style.display = 'none';
  });

  window.addEventListener('click', function(event) {
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  });
});

(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.flash').fadeOut();
  }, 5000); // Automatically fade out flash messages after 5 seconds
});
