import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    var easyMDE = new EasyMDE({
      autosave: {
          enabled: true,
          delay: 1000,
          uniqueId: 'mde-autosave-demo'
      },
      element: document.getElementById('easymde-input')
    })
  }
}
