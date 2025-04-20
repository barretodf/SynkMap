// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "controllers"

function toggleBannerForm() {
  const form = document.querySelector('.banner-form');
  form.style.display = form.style.display === 'none' ? 'block' : 'none';
}