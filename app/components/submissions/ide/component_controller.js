import './component.scss'
import ApplicationController from '../../../javascript/controllers/application_controller'
import Split from 'split.js'

export default class extends ApplicationController {
  connect() {
    document.querySelector("#submission-wrapper").parentNode.setAttribute("style", "height: calc(100% - 59px);");

    Split(['#top', '#bottom'], {
      sizes: [75, 25],
      direction: 'vertical',
      minSize: [50,30],
    })
  }

  submit() {
    document.getElementById("new_submission").submit()
  }
}
