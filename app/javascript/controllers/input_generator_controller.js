import { Controller } from "stimulus"
var judge0 = require('../packs/judge0')

export default class extends Controller {
  static targets = [ "cases", "lang", "code", "output"]

  run(event) {
    var lang = this.langTarget.value
    var cases_number = this.casesTarget.value
    var source_code = this.codeTarget.value

    var params = {
      'language_id': lang,
      'source_code': source_code
    };

    var output = ""
    if(cases_number > 1)
      output += `${cases_number}\n`

    judge0.round_runs(params, cases_number, (data) => {
      for(var i = 0; i < data.length; i++){
        output += judge0.result_to_string(data[i]);
      }
      this.outputTarget.value = output
    });

  }

  connect() {
    console.log("a")
  }
}
