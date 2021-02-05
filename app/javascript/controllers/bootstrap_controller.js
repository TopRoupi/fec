import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    var selects = document.querySelectorAll("select");

    for(var i = 0; i < selects.length; i++) {
      selects[i].classList.add("form-select");
    }
  }
}
