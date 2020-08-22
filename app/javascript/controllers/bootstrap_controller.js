import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    const selects = document.querySelectorAll('select');
    selects.forEach(select => {
      select.classList.add("form-select");
    })
  }
}
