import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "lang", "code", 'mode' ]

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
    var easyMDE = new EasyMDE({
      autosave: {
          enabled: true,
          delay: 1000,
          uniqueId: 'mde-autosave-demo'
      },
      element: document.getElementById('exercice_content')
    })

    //code mirror

    require('codemirror/addon/mode/loadmode');
    require('codemirror/mode/meta');
    
    var CodeMirror = require('codemirror');

    var editor = CodeMirror.fromTextArea(document.getElementById("exercice_code"), {
      lineNumbers: true
    });

    $('#change').on('click', (event) => {
      var mode = document.getElementById("mode").value
      require(`codemirror/mode/${mode}/${mode}`);
      editor.setOption("mode", mode);
    })

  }
}