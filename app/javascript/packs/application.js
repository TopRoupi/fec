import Rails from "@rails/ujs"
// import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"

require("channels")
require('jquery')
require("@nathanvda/cocoon")

import '../stylesheets/application'
import 'bootstrap'
import 'controllers'
import 'channels'

Rails.start()
ActiveStorage.start()
require("turbolinks").start()
