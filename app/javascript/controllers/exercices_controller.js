import { Controller } from "stimulus"

var editor;

export default class extends Controller {
  static targets = [ "lang", "code", 'mode' ]

  generate_test_output(event) {
    var input = event.currentTarget.parentNode.children[0].children[1].value
    var output = event.currentTarget.parentNode.children[1].children[1]
    var lang = document.getElementById(`lang${this.langTarget.value}`).innerHTML
    var code = editor.getValue()

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
    require('codemirror/mode/python/python');
    
    var CodeMirror = require('codemirror');

    var code_input = document.getElementById("exercice_code")

    editor = CodeMirror.fromTextArea(code_input, {
      lineNumbers: true,
      mode: 'python',
      indentUnit: 4,
      indentWithTabs: true,
      theme: 'neo'
    });

    var themes = ['default', 'neo', 'elegant', 'monokai']
    var current_theme = 1

    var changebutton = document.createElement('button');
    changebutton.innerHTML = 'Change code highlight'
    changebutton.type = 'button'
    changebutton.className = 'code_input_button'
    changebutton.onclick = () => {
      var mode = prompt("Enter lang/mode name", "clike")
      require(`codemirror/mode/${mode}/${mode}`)
      editor.setOption("mode", mode)
    }

    var themebutton = document.createElement('button');
    themebutton.innerHTML = 'Change theme'
    themebutton.type = 'button'
    themebutton.className = 'code_input_button'
    themebutton.onclick = () => {
      if(current_theme == themes.length - 1)
        current_theme = 0
      else
        current_theme += 1
      editor.setOption("theme", themes[current_theme])
    }

    code_input.parentNode.children[0].style.width = '100%'

    code_input.parentNode.children[0].appendChild(changebutton)
    code_input.parentNode.children[0].appendChild(themebutton)
    
  }
}