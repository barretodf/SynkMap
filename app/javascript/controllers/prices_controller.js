// app/javascript/controllers/prices_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["display", "editForm", "inputs", "field"];
  static values = { index: Number };

  connect() {
    console.log("Prices controller connected");
    console.log("Field targets:", this.fieldTargets);
    this.indexValue = this.fieldTargets.length;
  }

  toggleEdit() {
    const isHidden = this.editFormTarget.style.display === "none";
    this.editFormTarget.style.display = isHidden ? "block" : "none";
    this.displayTarget.style.display = isHidden ? "none" : "block";
  }

  addField() {
    console.log("Adding new field, current index:", this.indexValue);
    const newField = `
      <div class="price-field" data-prices-target="field">
        <input type="text" name="user[prices][${this.indexValue}_description]" class="price-description-input" placeholder="Descrição do serviço" required>
        <input type="text" name="user[prices][${this.indexValue}_amount]" class="price-input" placeholder="Valor (R$)" required pattern="\\d*\\.?\\d{0,2}">
        <button type="button" class="remove-btn" data-action="click->prices#removeField" aria-label="Remover serviço">🗑️</button>
      </div>
    `;
    this.inputsTarget.insertAdjacentHTML("beforeend", newField);
    this.indexValue++;
  }

  removeField(event) {
    console.log("Removing field");
    const field = event.target.closest(".price-field");
    field.remove();
  }

  submitForm(event) {
    console.log("Submit form triggered, field targets:", this.fieldTargets);
    if (this.fieldTargets.length === 0) {
      console.log("No fields found, preventing form submission");
      event.preventDefault();
      alert("Adicione pelo menos um serviço antes de salvar.");
    }
  }

  submitEnd(event) {
    console.log("Submit end triggered, success:", event.detail.success);
    if (!event.detail.success) {
      alert("Erro ao salvar os preços. Por favor, tente novamente.");
    }
  }
}