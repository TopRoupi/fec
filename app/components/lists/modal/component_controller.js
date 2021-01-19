import ApplicationController from '../../../javascript/controllers/application_controller'
import { Modal } from 'bootstrap'

export default class extends ApplicationController {
  static targets = ['modal', 'list_form', 'create_list_button']

  connect() {
    this.modal = new Modal(this.modalTarget, {
      backdrop: 'static',
      keyboard: false
    })
    this.modal.show()
  }

  destroy() {
    this.modal.hide()
    this.modalTarget.remove()
  }

  show_list_form() {
    this.list_formTarget.classList.remove('d-none')
    this.create_list_buttonTarget.classList.add('d-none')
  }
}
