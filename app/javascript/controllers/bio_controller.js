import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "form", "textarea"]

  connect() {
    this.showDisplay()
  }

  edit() {
    this.formTarget.classList.remove("hidden")
    this.displayTarget.classList.add("hidden")
    this.textareaTarget.focus()
  }

  cancel() {
    this.showDisplay()
  }

  showDisplay() {
    this.formTarget.classList.add("hidden")
    this.displayTarget.classList.remove("hidden")
  }

  update(event) {
    event.preventDefault()

    const url = this.formTarget.action
    const token = document.querySelector('meta[name="csrf-token"]').content

    fetch(url, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": token
      },
      body: JSON.stringify({
        biografia: this.textareaTarget.value
      })
    })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          this.displayTarget.textContent = data.biografia
          this.showDisplay()
        } else {
          alert("Erro ao atualizar a bio.")
        }
      })
  }
}
