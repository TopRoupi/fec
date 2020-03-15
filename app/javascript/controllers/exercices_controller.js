import { Controller } from "stimulus"
var judge0 = require('../packs/judge0')

export default class extends Controller {
  static targets = [ "lang", "code", 'mode' ]

  run(event) {
    var input = event.currentTarget.parentNode.children[0].children[1].value;
    var output = event.currentTarget.parentNode.children[1].children[1];
    var lang = document.getElementById(`lang${this.langTarget.value}`).innerHTML;
    var code = document.getElementById('codemirror-input').value;

    var params = {
      'language_id': lang,
      'source_code': code,
      'stdin': input
    };

    judge0.run(params, (data) => {
      if(data.stdout)
        output.value = data.stdout;
      else
        output.value = `ERROR: ${data.stderr}`;
    });
  }

  connect() {
  }
}
