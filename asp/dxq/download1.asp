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
strSql = "SELECT course.xkId as ѡ�κ�,course.name as �γ���,course.teacher as ��ʦ,student.sId as ѧ��,student.name as ����,student.tel as �ֻ���,student.class as �༶ FROM student,elective,course where elective.score=0 and  elective.sId=student.sId and course.xkId=elective.xkId and course.date='"&term&"' order by elective.xkId"
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