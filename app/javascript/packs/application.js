require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require("@nathanvda/cocoon")
require("./darkmode")

import hljs from 'highlight.js'
hljs.initHighlightingOnLoad()
import '../stylesheets/application'
import 'bootstrap'
import 'controllers'
import 'channels'

