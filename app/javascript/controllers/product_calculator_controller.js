// app/javascript/controllers/product_calculator_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["price", "quantity", "discount", "subtotal", "total"];

  connect() {
    this.calculateSubtotal();
    this.calculateTotalPrice();
  }

  updatePriceAndCalculate(event) {
    const productId = event.target.value;
    if (productId) {
      fetch(`/products/${productId}.json`)
        .then((response) => response.json())
        .then((data) => {
          this.priceTarget.value = data.price; // Preenche o preço unitário
          this.calculateSubtotal(); // Recalcula o subtotal
          this.calculateTotalPrice(); // Recalcula o total_price
        });
    } else {
      this.priceTarget.value = 0;
      this.calculateSubtotal();
      this.calculateTotalPrice();
    }
  }

  calculateSubtotal() {
    const price = parseFloat(this.priceTarget.value) || 0;
    const quantity = parseInt(this.quantityTarget.value) || 0;
    const discount = parseFloat(this.discountTarget.value) || 0;

    const subtotal = (price * quantity) - discount;
    this.subtotalTarget.value = subtotal.toFixed(2);
  }

  calculateTotalPrice() {
    const allSubtotals = document.querySelectorAll("[data-product-calculator-target='subtotal']");
    let total = 0;

    allSubtotals.forEach((element) => {
      const value = parseFloat(element.value) || 0;
      total += value;
    });

    // Atualiza o campo total_price no formulário
    const totalPriceElement = document.querySelector("[data-product-calculator-target='total']");
    if (totalPriceElement) {
      totalPriceElement.value = total.toFixed(2);
    }
  }
}