<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
</head>
<body>
<!--#include   file= "checkSession.asp "-->
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
		'Response.write excelRs("�γ̺�")
		'Response.write excelRs("�γ���")
		'Response.write excelRs("�Ͽ�ʱ��")
		'Response.write excelRs("�Ͽε�ַ")
		'Response.write excelRs("����")
		'Response.write excelRs("�꼶")
		'Response.write excelRs("��ʦ")
		'Response.write excelRs("ѧ��")
		'Response.write "<br>"
		Sql="insert into course (xkId,kcId,name,time,address,numbers,grade,teacher,date) values('"&excelRs("ѡ�κ�")&"','"&excelRs("�γ̺�")&"','"&excelRs("�γ���")&"','"&excelRs("�Ͽ�ʱ��")&"','"&excelRs("�Ͽε�ַ")&"',"&excelRs("����")&",'"&excelRs("�꼶")&"','"&excelRs("��ʦ")&"','"&excelRs("ѧ��")&"')"
		on error resume next
		Conn.Execute Sql,recaffected
		If Err.Number then
			Response.write excelRs("ѡ�κ�")&"���ܵ���ʧ��,���Ѵ���<br>"
		end if

		excelRs.MoveNext  
		Loop  
		End IF  
		excelRs.Close  
		Set excelRs=nothing  
		excelConn.Close  
		Set exceConn=Nothing  
	end if
	Conn.Close
	set Conn=Nothing
	response.write"<script>alert('����ɹ�');setTimeout(function(){location.href='addCourse.asp'},1000)</script>"
%>

</body>

</html>