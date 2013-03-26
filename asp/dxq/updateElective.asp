<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%	Response.CodePage = 65001
	response.Charset="utf-8"
%>
<!--#include   file= "checkSession.asp "-->
<!--#include   file= "conn.asp "-->
<%

	xkId=request.querystring("xkId")
	sId=request.querystring("sId")
	Score=request.querystring("Score")
	set Rs=Server.CreateObject("ADODB.recordset")
	if not xkId="" then
		Sql= "select * from elective where sId='"&sId&"' and xkId='"&xkId&"'"
		Rs.Open sql , Conn
		if not Rs.eof then
			sqlStr="update elective set Score="&Score&" where sId='"&sId&"' and xkId='"&xkId&"'"
			on error resume next
			Conn.Execute sqlStr,recaffected
			response.write "1"
		else
			 sqlStr="insert into elective (xkId,sId,Score) values ('"&xkId&"','"&sId&"','"&Score&"')"
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
