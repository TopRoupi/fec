import ApplicationController from '../../javascript/controllers/application_controller'
import { Toast } from 'bootstrap'

export default class extends ApplicationController {
  static targets = ['toast']

  connect() {
    var toast = new Toast(this.toastTarget)
    console.log('a')
    toast.show()
  }

  destroy() {
    this.toastTarget.remove()
  }
}
