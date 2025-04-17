import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list", "form", "nome", "preco", "serviceId"]

  connect() {
    this.resetForm()
  }

  submit(event) {
    event.preventDefault()
    const token = document.querySelector('meta[name="csrf-token"]').content
    const id = this.serviceIdTarget.value
    const url = id ? `/service_types/${id}` : "/service_types"
    const method = id ? "PATCH" : "POST"

    fetch(url, {
      method: method,
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({
        service_type: {
          nome: this.nomeTarget.value,
          preco: this.precoTarget.value
        }
      })
    })
    .then(res => res.json())
    .then(data => {
      if (data.success) {
        this.listTarget.innerHTML = data.html
        this.resetForm()
      }
    })
  }

  edit(event) {
    this.serviceIdTarget.value = event.target.dataset.id
    this.nomeTarget.value = event.target.dataset.nome
    this.precoTarget.value = event.target.dataset.preco
  }

  remove(event) {
    const id = event.target.dataset.id
    const token = document.querySelector('meta[name="csrf-token"]').content

    fetch(`/service_types/${id}`, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": token,
        "Accept": "application/json"
      }
    })
    .then(res => res.json())
    .then(data => {
      if (data.success) {
        this.listTarget.innerHTML = data.html
        this.resetForm()
      }
    })
  }

  cancel() {
    this.resetForm()
  }

  resetForm() {
    this.serviceIdTarget.value = ""
    this.nomeTarget.value = ""
    this.precoTarget.value = ""
  }
}
