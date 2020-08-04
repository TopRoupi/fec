require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("./darkmode")
require("bootstrap-select")
require("bootstrap-input-spinner/src/bootstrap-input-spinner")

$("input[type='number']").inputSpinner();

import '../stylesheets/application'
import 'bootstrap'
import 'controllers'

// document.addEventListener('turbolinks:load', () =>{
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
// })
