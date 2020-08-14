require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("./darkmode")
require("./nested_form")
require("bootstrap-select")

import '../stylesheets/application'
import 'bootstrap'
import 'controllers'
import 'channels'

document.addEventListener('turbolinks:load', () =>{
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

import "controllers"
