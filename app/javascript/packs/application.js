require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require("@nathanvda/cocoon")

import '../stylesheets/application'
import 'bootstrap'
import 'controllers'
import 'channels'

var bootstrap = require("bootstrap/dist/js/bootstrap.bundle")

document.addEventListener('turbolinks:load', () => {
  var toastElList = [].slice.call(document.querySelectorAll('.toast'))
  var toastList = toastElList.map(function(toastEl) {
    return new bootstrap.Toast(toastEl) // No need for options; use the default options
  });
  toastList.forEach(toast => toast.show());
})

