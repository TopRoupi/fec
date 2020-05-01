import { Controller } from "stimulus"
import Split from 'split.js'
var judge0 = require('../packs/judge0')


export default class extends Controller {
  static targets = ["code", "output", "compileroutput", "input"]

  run(event) {
    $("#run-state").attr("class", "running");

    if(document.querySelector('input[name="language"]:checked') === null){
      $("#lang-tab").click()
      $("#run-state").attr("class", "error");
      setTimeout(() => {
        $("#run-state").attr("class", "stopped");
      }, 2000);
      return
    }

    var code = this.codeTarget.value
    var input = this.inputTarget.value
    var lang = document.querySelector('input[name="language"]:checked').value;

    var comp_output = this.compileroutputTarget
    var output = this.outputTarget

    var params = {
      'language_id': lang,
      'source_code': code,
      'stdin': input
    };

    judge0.run(params, (data) => {
      $("#run-state").attr("class", "ready");

      setTimeout(() => {
        $("#run-state").attr("class", "stopped");
      }, 2000);

      output.value = judge0.result_to_string(data);
      comp_output.value = data.compile_output;
      $("#output-tab").click()
    });
  }

  connect() {
    $("#submission-wrapper").parent().removeClass("container")
    $("#submission-wrapper").parent().attr("style", "height: calc(100% - 57px);");

    Split(['#top', '#bottom'], {
      sizes: [75, 25],
      direction: 'vertical',
      minSize: [100,30],
    })
  }
}
