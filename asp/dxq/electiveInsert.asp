
<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
</head>
<body>
<!--#include   file= "conn.asp "-->
<%
	fileName=Request.Cookies("fileName")
'	response.write("Firstname=" & fname)
	if  fileName <>"" then
		Set excelConn = Server.CreateObject("ADODB.Connection")  
		'excelDriver = "Driver={Microsoft Excel Driver (*.xls)};"
		excelDBPath =Server.MapPath("savefiles/"&fileName)
		excelConn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Extended Properties=Excel 8.0;Data Source=" & excelDBPath
		excelSql="Select * From [Sheet1$] where 1=1"
		Set excelRs=excelConn.Execute(excelSql)  
		IF excelRs.Eof And excelRs.Bof Then  
		Response.write "û���ҵ�����Ҫ������!!"  
		Else  
		Do While Not excelRs.EOF
		'Response.write excelRs("ѡ�κ�")
		'Response.write excelRs("ѧ��")
		'Response.write "<br>"
		set Rs=Server.CreateObject("ADODB.Recordset")
		Rs.open "SELECT * FROM elective WHERE xkId='" & excelRs("ѡ�κ�") & "' and sId='"&excelRs("ѧ��")&"'",Conn,1,1
		If  RS.Eof Then
			Sql="insert into elective (xkId,sId) values('"&excelRs("ѡ�κ�")&"','"&excelRs("ѧ��")&"')"
			on error resume next
			Conn.Execute Sql,recaffected	  
		end if
		Rs.Close
		Set Rs=nothing 
		excelRs.MoveNext
		Loop  
		End IF  
		excelRs.Close  
		Set excelRs=nothing  
		excelConn.Close  
		Set excelConn=Nothing  
	end if
	Conn.Close
	set Conn=Nothing
	response.write"<script>alert('����ɹ�');setTimeout(function(){location.href='editElective.asp'},1000)</script>"
%>

</body>

</html>