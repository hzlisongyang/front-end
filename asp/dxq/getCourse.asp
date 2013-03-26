<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%> 
<!--#include   file= "conn.asp "-->
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1.asp"-->
<%
	xkId=request.querystring("xkId")
	if not xkId="" then
		set Rs=Server.CreateObject("ADODB.recordset")
		Sql= "select * from course  where xkId ='"&xkId&"'"
		QueryToJSON(Conn, Sql).Flush
	end if
	Conn.close
	set Conn=nothing
%>