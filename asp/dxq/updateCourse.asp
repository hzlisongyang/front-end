<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%	Response.CodePage = 65001
	response.Charset="utf-8"
%>
<!--#include   file= "checkSession.asp "-->
<!--#include   file= "conn.asp "-->
<%

	xkId=request.querystring("xkId")
	kcId=request.querystring("kcId")
	name=request.querystring("name")
	myTime=request.querystring("time")
	address=request.querystring("address")
	numbers=request.querystring("numbers")
	grade=request.querystring("grade")
	teacher=request.querystring("teacher")
	theDate=request.querystring("date")
	set Rs=Server.CreateObject("ADODB.recordset")
	if not xkId="" then
		Sql= "select * from course where xkId='"&xkId&"'"
		Rs.Open sql , Conn
		if not Rs.eof then
			sqlStr="update course set  kcId='"&kcId&"' ,  name='"&name&"' , time='"&myTime&"', address='"&address&"' , numbers="&numbers&" ,grade='"&grade&"', teacher='"&teacher&"' , date='"&theDate&"' where xkId='"&xkId&"'"
			'       
			on error resume next
			Conn.Execute sqlStr,recaffected
			response.write "1"
		else
			 sqlStr="insert into course (xkId,kcId,name,time,address,numbers,grade,teacher,date) values ('"&xkId&"','"&kcId&"','"&name&"','"&myTime&"','"&address&"',"&numbers&",'"&grade&"','"&teacher&"','"&theDate&"')	"
			 on error resume next
			 Conn.Execute sqlStr,recaffected
			 response.write "2"
		end if
	end if
	Rs.close
	set Rs=nothing
	Conn.close
	set Conn=nothing
%>
