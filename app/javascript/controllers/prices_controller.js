import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["display", "editForm", "inputs", "field"];

  toggleEdit() {
    this.displayTarget.style.display = this.displayTarget.style.display === "none" ? "block" : "none";
    this.editFormTarget.style.display = this.editFormTarget.style.display === "none" ? "block" : "none";
  }

  addField() {
    const index = this.fieldTargets.length;
    const newField = `
      <div class="price-field" data-prices-target="field">
        <input type="text" name="user[prices][${index}_description]" class="price-description-input" placeholder="Descrição do evento">
        <input type="text" name="user[prices][${index}_amount]" class="price-input" placeholder="Valor">
        <button type="button" class="remove-btn" data-action="click->prices#removeField">🗑️</button>
      </div>`;
    this.inputsTarget.insertAdjacentHTML("beforeend", newField);
  }

  removeField(event) {
    event.target.closest(".price-field").remove();
  }
}