import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    require('codemirror/addon/mode/loadmode');
    require('codemirror/mode/meta');
    require('codemirror/mode/python/python');
    
    var CodeMirror = require('codemirror');

    var code_input = document.getElementById("codemirror-input");

    var editor = CodeMirror.fromTextArea(code_input, {
      lineNumbers: true,
      mode: 'python',
      indentUnit: 4,
      indentWithTabs: true,
      theme: 'neo'
    });

    editor.on("change", (cm, change) => {
      editor.save();
    })

    var themes = ['default', 'neo', 'elegant', 'monokai'];
    var current_theme = 1;

    var changebutton = document.createElement('button');
    changebutton.innerHTML = 'Change code highlight';
    changebutton.type = 'button';
    changebutton.className = 'light_button';
    changebutton.onclick = () => {
      var mode = prompt("Enter lang/mode name", "clike");
      require(`codemirror/mode/${mode}/${mode}`);
      editor.setOption("mode", mode);
    }

    var themebutton = document.createElement('button');
    themebutton.innerHTML = 'Change theme';
    themebutton.type = 'button';
    themebutton.className = 'light_button';
    themebutton.onclick = () => {
      if(current_theme == themes.length - 1)
        current_theme = 0;
      else
        current_theme += 1;
      editor.setOption("theme", themes[current_theme]);
    }

    // var savebutton = document.createElement('button');
    // savebutton.innerHTML = 'Save'
    // savebutton.type = 'button'
    // savebutton.className = 'light_button'
    // savebutton.onclick = () => {
    //   editor.save();
    // }

    code_input.parentNode.children[0].style.width = '100%';

    code_input.parentNode.children[0].appendChild(changebutton);
    code_input.parentNode.children[0].appendChild(themebutton);
    // code_input.parentNode.children[0].appendChild(savebutton);

  }
}