<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include   file= "checkSession.asp "-->
<!--#include   file= "conn.asp "-->
<%
	xkId=request.querystring("xkId")
	sId=request.querystring("sId")
	Sql= "delete from elective  where xkId ='"&xkId&"' and sId='"&sId&"'"
	Conn.Execute Sql
	if err<>0 then
		response.write("0")
	else 
    response.write("1")
	end if
	Conn.close
	set Conn=nothing
%>