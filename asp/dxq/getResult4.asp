<!--#include   file= "conn.asp "-->
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1_uft8.asp"-->

<%
	term=request.querystring("term")
	set Rs=Server.CreateObject("ADODB.recordset")
	if not term="" then
		Sql="SELECT course.xkId,course.name as courseName,course.teacher,student.sId,student.name,student.tel,student.class FROM student,elective,course where elective.score=0 and  elective.sId=student.sId and course.xkId=elective.xkId and course.date='"&term&"' order by elective.xkId " 
		QueryToJSON(Conn, Sql).Flush
	end if
	Conn.close
	set Conn=nothing
%>