<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%> 
<!--#include   file= "conn.asp "-->
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1_uft8.asp"-->
<%
	kcId=request.querystring("kcId")
	term=request.querystring("term")
	Dim member
	Set member = jsObject()
	set Rs=Server.CreateObject("ADODB.recordset")
	if not kcId="" then
		Sql="SELECT DISTINCT(course.xkId),course.kcId,course.name,course.teacher,course.numbers,count(elective.score) as count,elective.xkId as score FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"' and elective.score>0  and course.kcId='"&kcId&"' GROUP BY course.xkId , course.kcId,course.name,course.teacher,course.numbers,elective.xkId UNION SELECT  DISTINCT(course.xkId),course.kcId,course.name,course.teacher,course.numbers,0 as count,elective.xkId as score FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"'  and course.kcId='"&kcId&"' GROUP BY course.xkId , course.kcId,course.name,course.teacher,course.numbers,elective.xkId having max(elective.score)=0"
		QueryToJSON(Conn, Sql).Flush
	end if
	Conn.close
	set Conn=nothing
%>