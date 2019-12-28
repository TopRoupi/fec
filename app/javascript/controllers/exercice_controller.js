import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    require("../packs/nested_form")
    var easyMDE = new EasyMDE({element: document.getElementById('exercice_content')});
  }
}