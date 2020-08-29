import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { PrefetchTurbolinksController } from '@hopsoft/controllers'

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))
application.register('prefetch', PrefetchTurbolinksController)
