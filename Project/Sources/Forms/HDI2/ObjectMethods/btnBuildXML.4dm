If (Form:C1466.trace)
	TRACE:C157
End if 

If (Form:C1466.context#Null:C1517)
	// コンテキストと同じ内容で XML を構築します
	Form:C1466.xml:=buildXML(Form:C1466.context)
	
	SET TIMER:C645(-1)
	
Else 
	// この場合はボタンが無効化されているため、このケースは発生しない筈
End if 

