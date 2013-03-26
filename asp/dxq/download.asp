<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include   file= "conn.asp "-->
<%
term=request.querystring("term")
dim s,sql,filename,fs,myfile,x  
Set fs = server.CreateObject("scripting.filesystemobject")
'--假设你想让生成的EXCEL文件做如下的存放 
name=year(date)&month(date)&".xls"
downname="downfiles/"&name
filename = Server.MapPath("downfiles/"&name)  
'--如果原来的EXCEL文件存在的话删除它  
if fs.FileExists(filename) then  
      fs.DeleteFile(filename)  
end    if  
'--创建EXCEL文件  
set myfile = fs.CreateTextFile(filename,true)  
Set Rs = Server.CreateObject("ADODB.Recordset")  
StartTime = Request("StartTime")
EndTime = Request("EndTime")
StartEndTime = "AddTime between #"& StartTime &" 00:00:00# and #"& EndTime &" 23:59:59#"
strSql = "SELECT  DISTINCT(course.xkId) as 选课号,course.kcId as 课程编号,course.name as 课程名,course.teacher as 老师,course.numbers as 总人数,count(elective.score) as 已评人数,elective.xkid as 得分 FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"' and elective.score>0  GROUP BY course.xkId ,course.kcId,course.name,course.teacher,course.numbers,elective.xkId UNION SELECT  DISTINCT(course.xkId) as 选课号,course.kcId as 课程编号,course.name as 课程名,course.teacher as 老师,course.numbers as 总人数,0 as 已评人数,elective.xkid as 得分 FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"'   GROUP BY course.xkId ,course.kcId,course.name,course.teacher,course.numbers,elective.xkId  having max(elective.score)=0"
Set Rs =conn.execute(strSql)
if not Rs.EOF and not Rs.BOF then  
      dim    trLine,responsestr  
      strLine=""  
      For each x in Rs.fields  
          strLine = strLine & x.name & chr(9)  
     Next

'--将表的列名先写入EXCEL  
      myfile.writeline strLine 
	  index=1
      Do while Not Rs.EOF  
          strLine=""  
          for each x in Rs.Fields  
			  if x.name="得分" then
				score=0
				count=0
				sqlTemp="select score from elective where score>0 and xkid='"&x.value&"'"
				Set RsTemp =conn.execute(sqlTemp)
				if not RsTemp.EOF and not RsTemp.BOF then
					Do while Not RsTemp.EOF 
						 For each y in RsTemp.fields
							  score=score+y.value
							  count=count+1
						 Next
					RsTemp.MoveNext 
					loop	
				end if
				if count=0 then
						count=1
				end if
				strLine = strLine & (score/count) &    chr(9)  				
			  else
				strLine = strLine & x.value &    chr(9)
			  end if
          next

          myfile.writeline    strLine  
		  index=index+1
          Rs.MoveNext  
      loop  
end if  
Response.Write    "生成EXCEL文件成功，点击<a href='"&downname&"' >下载</a>！"
Rs.Close  
set Rs = nothing
Conn.Close
Set Conn = nothing
%> 