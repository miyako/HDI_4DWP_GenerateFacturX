var $options : Object
var $fileInfo : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$options:={}
$fileInfo:={}

Case of 
		
	: (Form:C1466.templateLanguage="french")
		
		$options.facturX:={}
		$options.facturX.profile:="BASIC"  // XML から推定されるため、入力不要
		$options.facturX.version:="1.0"  // "1.0" はデフォルト値
		
		$fileInfo.name:="factur-x.xml"  // 最初のファイルのデフォルト値 (factur-x/ZUGFeRD xml)
		$fileInfo.description:="Factur-X/ZUGFeRD Invoice"  // 最初のファイルのデフォルト値 ("factur-x/ZUGFeRD invoice")
		$fileInfo.mimeType:="text/xml"  // これも推定可能
		$fileInfo.relationship:="Data"
		
		If (Form:C1466.xmlFile.exists)  // 手順{4} が実行されたのであれば、ファイルはディスク上に存在します
			$fileInfo.file:=Form:C1466.xmlFile
		Else 
			$fileInfo.data:=Form:C1466.xml  // 手順3 で作成されたもの。fileプロパティがない場合には必須。
		End if 
		
	: (Form:C1466.templateLanguage="german")
		
		$options.facturX:={}
		$options.facturX.profile:="RECHNUNG"  // XML から推定されるため、入力不要
		$options.facturX.version:="2.1"
		
		$fileInfo.name:="rechnung.xml"
		$fileInfo.description:="Factur-X/ZUGFeRD Invoice"
		$fileInfo.mimeType:="text/xml"
		$fileInfo.relationship:="Alternative"
		
		If (Form:C1466.xmlFile.exists)  // 手順{4} が実行されたのであれば、ファイルはディスク上に存在します
			$fileInfo.file:=Form:C1466.xmlFile
		Else 
			$fileInfo.data:=Form:C1466.xml  // 手順3 で作成されたもの。fileプロパティがない場合には必須。
		End if 
		
End case 


$options.files:=[$fileInfo]  // ファイルをさらに追加することが可能です。最初のファイルは facturX/ZUGFeDR

WP EXPORT DOCUMENT:C1337(Form:C1466.template; Form:C1466.facturxFile.platformPath; wk pdf:K81:315; $options)

SET TIMER:C645(-1)
