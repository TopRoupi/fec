import Rails from "@rails/ujs"
// import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import { Turbo, cable } from "@hotwired/turbo-rails"

require("channels")
require('jquery')
require("@nathanvda/cocoon")

import '../stylesheets/application'
import 'bootstrap'
import 'channels'

Rails.start()
ActiveStorage.start()
window.Turbo = Turbo

import 'controllers'
