If (Form:C1466.trace)
	TRACE:C157
End if 

If (Form:C1466.context#Null:C1517)
	WP SET DATA CONTEXT:C1786(Form:C1466.template; Form:C1466.context)
	WP COMPUTE FORMULAS:C1707(Form:C1466.template)
	
	Form:C1466.contextSet:=True:C214
	SET TIMER:C645(-1)
Else 
	// この場合はボタンが無効化されているため、このケースは発生しない筈
End if 

