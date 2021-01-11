import datetime as dt
datetime_object = dt.datetime.now().strftime("%Y%m%d_%H%M%S") 
editor.addText("-- ")
editor.addText(datetime_object)
editor.addText("\r\n")


