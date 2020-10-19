import { Controller } from "stimulus"

import Cookies from 'js-cookie'
var DarkReader = require('darkreader')

export default class extends Controller {
  static targets = [ "darkswitch" ]

  switch(event){
    if (event.currentTarget.checked == true){
      Cookies.set('darkmode', 'true')

      DarkReader.setFetchMethod(window.fetch)
      DarkReader.enable({
        brightness: 100,
        contrast: 95,
        sepia: 15
      });
    }
    else{
      DarkReader.disable()

      Cookies.set('darkmode', '')
    }
  }

  connect() {
    var darkmode = Cookies.get('darkmode')

    if (darkmode == "")
      this.darkswitchTarget.checked = false
    else {
      this.darkswitchTarget.checked = true
      DarkReader.setFetchMethod(window.fetch)
      DarkReader.enable({
        brightness: 100,
        contrast: 95,
        sepia: 15
      })
    }
  }
}
