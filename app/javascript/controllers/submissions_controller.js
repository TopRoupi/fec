import { Controller } from "stimulus"
import Split from 'split.js'
var judge0 = require('../packs/judge0')


export default class extends Controller {
  static targets = ["code", "output", "compileroutput", "input", "timelimit", "memlimit", "exerciceid"]

  submit(event) {

    if (this.codeTarget.value == null) {
      alert("Code can't be null.")
      return
    }
    if (document.querySelector('input[name="language"]:checked') == null){
      alert("Select a language.")
      return
    }

    if (!confirm("Confirm the submission.")) return 

    var csrf = $('meta[name="csrf-token"]').attr("content") 
    var exercice = this.exerciceidTarget.innerHTML
    var code = this.codeTarget.value
    var lang = document.querySelector('input[name="language"]:checked').id


    var params = {
      authenticity_token: csrf,
      submission: {
        code: code,
        language_id: lang,
        exercice_id: exercice
      }
    }

    $('#tests-tab').click()
    $('#tests-results').append('waiting submission result')
    $('#content').scrollTop($('#content')[0].scrollHeight)

    $.ajax({
      url: '../submissions',
      type: 'POST',
      data: params,
      success: (data) => {
        $('#tests-results').append(data)
        $('#content').scrollTop($('#content')[0].scrollHeight)

      },
      error: (data) => {
        alert(JSON.stringify(data))
      }
    })


  }

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
    var lang = document.querySelector('input[name="language"]:checked').value
    var time_limit = this.timelimitTarget.innerHTML
    var mem_limit = this.memlimitTarget.innerHTML * 1024

    var comp_output = this.compileroutputTarget
    var output = this.outputTarget

    var params = {
      'language_id': lang,
      'source_code': code,
      'stdin': input,
      // 'cpu_time_limit': time_limit,
      // 'memory_limit': mem_limit
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
    $("#submission-wrapper").parent().attr("style", "height: calc(100% - 59px);");

    Split(['#top', '#bottom'], {
      sizes: [75, 25],
      direction: 'vertical',
      minSize: [50,30],
    })
  }
}
