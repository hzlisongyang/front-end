<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%> 
<!--#include   file= "conn.asp "-->
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1.asp"-->
<%
	set Rs=Server.CreateObject("ADODB.recordset")
	Sql= "select * from course  where 1=1"
	QueryToJSON(Conn, Sql).Flush
	Conn.close
	set Conn=nothing
%>