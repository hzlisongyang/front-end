<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%	Response.CodePage = 65001
	response.Charset="utf-8"
%>
<!--#include   file= "checkSession.asp "-->
<!--#include   file= "conn.asp "-->
<%
	sId=request.querystring("sId")
	name=request.querystring("name")
	password=request.querystring("password")
	className=request.querystring("className")
	tel=request.querystring("tel")

	set Rs=Server.CreateObject("ADODB.recordset")
	if not sId="" then
		Sql= "select * from student where sId='"&sId&"'"
		Rs.Open sql , Conn
		if not Rs.eof then
			sqlStr="update student set name='"&name&"' , password='"&password&"' , class='"&className&"' , tel='"&tel&"'  where sId='"&sId&"'"
			on error resume next
			Conn.Execute sqlStr,recaffected
			response.write "1" 'update
		else
			 sqlStr="insert into student (sId,name,password,class,tel) values ('"&sId&"','"&name&"','"&password&"','"&className&"','"&tel&"')	"
			 on error resume next
			 Conn.Execute sqlStr,recaffected
			 response.write "2" 'insert
		end if
	end if
	Rs.close
	set Rs=nothing
	Conn.close
	set Conn=nothing
%>
