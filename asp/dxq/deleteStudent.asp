<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include   file= "checkSession.asp "-->
<!--#include   file= "conn.asp "-->
<%
	sId=request.querystring("sId")
	if sId <>"" then
		Sql= "delete from student  where sId ='"&sId&"'"
		Conn.Execute Sql
		if err<>0 then
			response.write("0")
		else 
		response.write("1")
		end if
	else
		response.write("0")
	end if
	Conn.close
	set Conn=nothing
%>