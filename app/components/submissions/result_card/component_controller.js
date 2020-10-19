import ApplicationController from '../../../javascript/controllers/application_controller'
import './component'
import hljs from 'highlight.js'

export default class extends ApplicationController {
  static targets = ['code']

  connect() {
    hljs.highlightBlock(this.codeTarget)
  }
}
