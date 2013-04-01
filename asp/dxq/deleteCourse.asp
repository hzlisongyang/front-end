<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include   file= "checkSession.asp "-->
<!--#include   file= "conn.asp "-->
<%
	xkId=request.querystring("xkId")
	Sql= "delete from course  where xkId ='"&xkId&"'"
	Conn.Execute Sql
	if err<>0 then
		response.write("0")
	else 
    response.write("1")
	end if
	Conn.close
	set Conn=nothing
%>