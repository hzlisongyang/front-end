<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
</head>
<body>
<!--#include   file= "conn.asp "-->
<!--#include   file= "checkSession.asp "-->
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
		'Response.write excelRs("ѧ��")
		'Response.write excelRs("����")
		'Response.write excelRs("����")
		'Response.write excelRs("�༶")
		'Response.write excelRs("�ֻ�")
		'Response.write "<br>"
		Sql="insert into student (sId,name,password,class,tel) values('"&excelRs("ѧ��")&"','"&excelRs("����")&"','"&excelRs("����")&"','"&excelRs("�༶")&"','"&excelRs("�ֻ�")&"')"
		on error resume next
		Conn.Execute Sql,recaffected
		If Err.Number then
			Response.write excelRs("ѧ��")&"���ܵ���ʧ�ܣ����Ѵ���<br>"
		end if
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
	response.write"<script>alert('����ɹ�');setTimeout(function(){location.href='addStudent.asp'},3000)</script>"
%>

</body>

</html>