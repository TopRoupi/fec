import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $(function () {
        $('select').selectpicker();
    });
  }
}
