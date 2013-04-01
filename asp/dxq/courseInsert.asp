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
		Response.write "没有找到您需要的数据!!"  
		Else  
		Do While Not excelRs.EOF  
		'Response.write excelRs("选课号")
		'Response.write excelRs("课程号")
		'Response.write excelRs("课程名")
		'Response.write excelRs("上课时间")
		'Response.write excelRs("上课地址")
		'Response.write excelRs("人数")
		'Response.write excelRs("年级")
		'Response.write excelRs("老师")
		'Response.write excelRs("学期")
		'Response.write "<br>"
		Sql="insert into course (xkId,kcId,name,time,address,numbers,grade,teacher,date) values('"&excelRs("选课号")&"','"&excelRs("课程号")&"','"&excelRs("课程名")&"','"&excelRs("上课时间")&"','"&excelRs("上课地址")&"',"&excelRs("人数")&",'"&excelRs("年级")&"','"&excelRs("老师")&"','"&excelRs("学期")&"')"
		on error resume next
		Conn.Execute Sql,recaffected
		If Err.Number then
			Response.write excelRs("选课号")&"可能导入失败,或已存在<br>"
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
	response.write"<script>alert('导入成功');setTimeout(function(){location.href='addCourse.asp'},1000)</script>"
%>

</body>

</html>