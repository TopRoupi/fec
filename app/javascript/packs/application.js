require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import '../stylesheets/application'
import 'bootstrap'
import "controllers"

document.addEventListener('turbolinks:load', () =>{
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
