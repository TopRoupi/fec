import { Controller } from "stimulus"
var judge0 = require('../packs/judge0')

export default class extends Controller {
  static targets = [ "lang", "code", 'mode', 'cpulimit', 'memlimit' ]

  run(event) {
    var input = event.currentTarget.parentNode.children[0].children[1].value;
    var output = event.currentTarget.parentNode.children[1].children[1];
    var lang = document.getElementById(`lang${this.langTarget.value}`).innerHTML;
    var code = document.getElementById('codemirror-input').value;

    var cpu_time_limit = this.cpulimitTarget.value;
    var memory_limit = this.memlimitTarget.value * 1024;

    var params = {
      'language_id': lang,
      'source_code': code,
      'stdin': input,
      'cpu_time_limit': cpu_time_limit,
      'memory_limit': memory_limit
    };

    judge0.run(params, (data) => {
      console.log(data);
      output.value = judge0.result_to_string(data);
    });
  }

  connect() {
  }
}
