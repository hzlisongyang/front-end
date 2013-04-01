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
strSql = "SELECT course.xkId as 选课号,course.name as 课程名,course.teacher as 教师,student.sId as 学号,student.name as 姓名,student.tel as 手机号,student.class as 班级 FROM student,elective,course where elective.score=0 and  elective.sId=student.sId and course.xkId=elective.xkId and course.date='"&term&"' order by elective.xkId"
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