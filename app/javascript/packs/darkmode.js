var cookie = require("./cookies");

var DarkReader = require('darkreader');

var darkmode = cookie.getCookie("darkmode");

if (darkmode != "") {
  DarkReader.enable({
    brightness: 100,
    contrast: 95
  });
}
