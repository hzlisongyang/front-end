<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include   file= "conn.asp "-->
<%
term=request.querystring("term")
dim s,sql,filename,fs,myfile,x  
Set fs = server.CreateObject("scripting.filesystemobject")
'--�������������ɵ�EXCEL�ļ������µĴ�� 
name=year(date)&month(date)&".xls"
downname="downfiles/"&name
filename = Server.MapPath("downfiles/"&name)  
'--���ԭ����EXCEL�ļ����ڵĻ�ɾ����  
if fs.FileExists(filename) then  
      fs.DeleteFile(filename)  
end    if  
'--����EXCEL�ļ�  
set myfile = fs.CreateTextFile(filename,true)  
Set Rs = Server.CreateObject("ADODB.Recordset")  
StartTime = Request("StartTime")
EndTime = Request("EndTime")
StartEndTime = "AddTime between #"& StartTime &" 00:00:00# and #"& EndTime &" 23:59:59#"
strSql = "SELECT  DISTINCT(course.xkId) as ѡ�κ�,course.kcId as �γ̱��,course.name as �γ���,course.teacher as ��ʦ,course.numbers as ������,count(elective.score) as ��������,elective.xkid as �÷� FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"' and elective.score>0  GROUP BY course.xkId ,course.kcId,course.name,course.teacher,course.numbers,elective.xkId UNION SELECT  DISTINCT(course.xkId) as ѡ�κ�,course.kcId as �γ̱��,course.name as �γ���,course.teacher as ��ʦ,course.numbers as ������,0 as ��������,elective.xkid as �÷� FROM elective,course where elective.xkId = course.xkId and course.date='"&term&"'   GROUP BY course.xkId ,course.kcId,course.name,course.teacher,course.numbers,elective.xkId  having max(elective.score)=0"
Set Rs =conn.execute(strSql)
if not Rs.EOF and not Rs.BOF then  
      dim    trLine,responsestr  
      strLine=""  
      For each x in Rs.fields  
          strLine = strLine & x.name & chr(9)  
     Next

'--�����������д��EXCEL  
      myfile.writeline strLine 
	  index=1
      Do while Not Rs.EOF  
          strLine=""  
          for each x in Rs.Fields  
			  if x.name="�÷�" then
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
Response.Write    "����EXCEL�ļ��ɹ������<a href='"&downname&"' >����</a>��"
Rs.Close  
set Rs = nothing
Conn.Close
Set Conn = nothing
%> 