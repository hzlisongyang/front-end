<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%	Response.CodePage = 65001
	response.Charset="utf-8"
%>
<!--#include   file= "conn.asp "-->
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1.asp"-->
<%
	className=request.querystring("className")
	set Rs=Server.CreateObject("ADODB.recordset")
	Sql= "select * from student  where class='"&className&"'"
	QueryToJSON(Conn, Sql).Flush
	Conn.close
	set Conn=nothing
%>