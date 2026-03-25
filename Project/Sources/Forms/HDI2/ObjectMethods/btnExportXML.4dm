If (Form:C1466.trace)
	TRACE:C157
End if 

If (Form:C1466.xml#Null:C1517)
	
	Form:C1466.xmlFile.setText(Form:C1466.xml)
	SET TIMER:C645(-1)
	
	SHOW ON DISK:C922(Form:C1466.xmlFile.platformPath)
	
Else 
	// この場合はボタンが無効化されているため、このケースは発生しない筈
End if 



