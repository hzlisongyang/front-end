﻿<!--#include   file= "conn.asp "-->
<!--#include file="JSON_2.0.4.asp"-->
<!--#include file="JSON_UTIL_0.1.1_uft8.asp"-->

<%
	term=request.querystring("term")
	set Rs=Server.CreateObject("ADODB.recordset")
	if not term="" then
		Sql="SELECT  DISTINCT(course.xkId),course.kcId,course.name,course.teacher,course.numbers,count(elective.score) as count,elective.xkId as score FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"' and elective.score>0  GROUP BY course.xkId ,course.kcId,course.name,course.teacher,course.numbers,elective.xkId UNION SELECT  DISTINCT(course.xkId),course.kcId,course.name,course.teacher,course.numbers,0 as count,elective.xkId as score FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"'   GROUP BY course.xkId ,course.kcId,course.name,course.teacher,course.numbers,elective.xkId having max(elective.score)=0" 
		QueryToJSON(Conn, Sql).Flush
	end if
	Conn.close
	set Conn=nothing
%>