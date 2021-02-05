import ApplicationController from '../../../../javascript/controllers/application_controller'

export default class extends ApplicationController {
  static targets = [ "input" ]

  connect() {
    console.log(this.inputTarget)
  }

  sort(event) {
    var param = event.currentTarget.getAttribute("data-param")
    var current_value
    current_value = this.inputTarget.value.split(" ")[0] != param ? "" : this.inputTarget.value
    current_value = current_value == "" ? "" : this.inputTarget.value.split(" ")[1]
    if(this.toggle_sort(current_value) == "") {
      this.inputTarget.value = ""
    } else {
      this.inputTarget.value = `${param} ${this.toggle_sort(current_value)}`
    }
    }

  toggle_sort(current_value) {
    switch(current_value) {
      case "":
        return "ASC"
      case "ASC":
        return "DESC"
      case "DESC":
        return ""
    }
  }
}
