import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "lang", "code" ]

  generate_test_output(event) {
    var input = event.currentTarget.parentNode.children[0].children[1].value
    var output = event.currentTarget.parentNode.children[1].children[1]
    var lang = document.getElementById(`lang${this.langTarget.value}`).innerHTML
    var code = this.codeTarget.value

    var to_compile = {
      "LanguageChoice": lang,
      "Program": code,
      "Input": input,
      "CompilerArgs" : ""
    }

    $.ajax ({
      url: "https://rextester.com/rundotnet/api",
      type: "POST",
      data: to_compile
    }).done(function(data) {
      if(data.Result){
        output.value = data.Result
      }
      else {
        output.value = `Error: ${data.Errors}`
      }
    }).fail(function(data, err) {
      alert("fail " + JSON.stringify(data) + " " + JSON.stringify(err))
    })
  }

  connect() {
    require("../packs/nested_form")
    var easyMDE = new EasyMDE({element: document.getElementById('exercice_content')})
  }
}