result=str(eval(editor.getSelText()))
editor.setSelectionStart(editor.getSelectionEnd())
editor.addText("\n="+result)