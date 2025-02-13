// app/javascript/controllers/contact_autofill_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["email", "phone", "cnpj", "companyName"];

  connect() {
    this.element.addEventListener("change", this.handleContactChange.bind(this));
  }

  async handleContactChange(event) {
    const contactId = event.target.value;
    if (contactId) {
      try {
        const response = await fetch(`/contacts/${contactId}.json`);
        const contact = await response.json();

        // Preencher campos do contato
        this.emailTarget.value = contact.email || "";
        this.phoneTarget.value = contact.phone || "";

        // Preencher campos da empresa associada ao contato
        if (contact.company) {
          this.cnpjTarget.value = contact.company.cnpj || "";
          this.companyNameTarget.value = contact.company.company_name || "";
        } else {
          this.cnpjTarget.value = "";
          this.companyNameTarget.value = "";
        }
      } catch (error) {
        console.error("Erro ao buscar dados do contato:", error);
      }
    } else {
      this.clearFields();
    }
  }

  clearFields() {
    this.emailTarget.value = "";
    this.phoneTarget.value = "";
    this.cnpjTarget.value = "";
    this.companyNameTarget.value = "";
  }
}