import { Controller } from "stimulus"

var editor;

export default class extends Controller {
  static targets = [ "lang", "code", 'mode' ]

  result(token, output) {
    $.ajax({
      url: "https://api.judge0.com/submissions/" + token,
      context: this,
      type: "GET",
      success: function (data) {
        if (data.status.id <= 2) { // In Queue or Processing
          setTimeout(() => {
            this.result(token, output)
          }, 250)
          return
        }

        if(data.stdout){
          output.value = data.stdout
        }
        else {
          output.value = `ERROR: ${data.stderr}`
        }
      }
    })
  }

  token(lang, code, input, output) {
    var to_compile = {
      "language_id": lang,
      "source_code": code,
      "stdin": input
    }

    $.ajax ({
      url: "https://api.judge0.com/submissions",
      type: "POST",
      context: this,
      data: to_compile
    }).done(function(data) {
      this.result(data.token, output)
    }).fail(function(data, err) {
      alert("fail " + JSON.stringify(data) + " " + JSON.stringify(err))
    })
  }

  run(event) {
    var input = event.currentTarget.parentNode.children[0].children[1].value
    var output = event.currentTarget.parentNode.children[1].children[1]
    var lang = document.getElementById(`lang${this.langTarget.value}`).innerHTML
    var code = document.getElementById('codemirror-input').value

    this.token(lang, code, input, output)
  }

  connect() {
    
  }
}
