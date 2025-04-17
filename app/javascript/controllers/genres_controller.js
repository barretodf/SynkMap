import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list"]

  connect() {}

  toggle(event) {
    const button = event.currentTarget
    const url = button.dataset.url
    const method = button.dataset.method
    const tokenElement = document.querySelector('meta[name="csrf-token"]')

    if (!tokenElement) {
      console.error("CSRF token não encontrado.")
      return
    }

    const token = tokenElement.content

    fetch(url, {
      method: method,
      headers: {
        "X-CSRF-Token": token,
        "Accept": "application/json"
      }
    })
      .then(response => {
        if (!response.ok) {
          throw new Error("Erro na requisição.")
        }
        return response.json()
      })
      .then(data => {
        if (data.success) {
          if (this.listTarget) {
            this.listTarget.innerHTML = data.html
          } else {
            console.error("listTarget não encontrado.")
          }
        } else {
          alert("Erro ao atualizar os gêneros.")
        }
      })
      .catch(error => {
        console.error("Erro:", error)
        alert("Ocorreu um erro ao processar a solicitação.")
      })
  }
}