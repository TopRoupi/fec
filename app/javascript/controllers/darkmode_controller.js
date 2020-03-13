import { Controller } from "stimulus"

var cookie = require("../packs/cookies");

export default class extends Controller {
  static targets = [ "darkswitch" ];

  switch(event){
    if (event.currentTarget.checked == true)
      cookie.setCookie("darkmode", 'true', 365);
    else
      cookie.setCookie("darkmode", '', 365);
  }

  connect() {
    var darkmode = cookie.getCookie("darkmode");

    if (darkmode != "")
      this.darkswitchTarget.checked = true;
    else
      this.darkswitchTarget.checked = false;
  }
}