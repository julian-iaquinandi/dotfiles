const vscode = require("vscode");

/**
 * Macro configuration settings
 * { [name: string]: {              ... Name of the macro
 *    no: number,                   ... Order of the macro
 *    func: ()=> string | undefined ... Name of the body of the macro function
 *  }
 * }
 */
module.exports.macroCommands = {
  FooMacro: {
    no: 2,
    func: fooFunc,
  },
  BarMacro: {
    no: 1,
    func: barFunc,
  },
};

/**
 * FooMacro
 */
function fooFunc() {
  const editor = vscode.window.activeTextEditor;
  if (!editor) {
    // Return an error message if necessary.
    return "Editor is not opening.";
  }
  const document = editor.document;
  const selection = editor.selection;
  const text = document.getText(selection);
  if (text.length > 0) {
    editor.edit((editBuilder) => {
      // To surround a selected text in double quotes(Multi selection is not supported).
      editBuilder.replace(selection, `"${text}"`);
    });
  }
}

/**
 * BarMacro(asynchronous)
 */
async function barFunc() {
  await vscode.window.showInformationMessage("Hello VSCode Macros!");
  // Returns nothing when successful.
}
