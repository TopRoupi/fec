require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("./darkmode")
require("./nested_form")

import '../stylesheets/application'
import 'bootstrap'
import 'controllers'
import 'channels'

var bootstrap = require("bootstrap/dist/js/bootstrap.bundle")

document.addEventListener('turbolinks:load', () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
})
