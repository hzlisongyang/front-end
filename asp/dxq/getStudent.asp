<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%> 
<!--#include   file= "conn.asp "-->
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1.asp"-->
<%
	sId=request.querystring("sId")
	set Rs=Server.CreateObject("ADODB.recordset")
	Sql= "select * from student  where sId ='"&sId&"'"
	QueryToJSON(Conn, Sql).Flush
	Conn.close
	set Conn=nothing
%>