<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include   file= "conn.asp "-->
<%
		if Request.Form("TxtUserName")<>"" then
				sId=trim(Request.Form("TxtUserName"))
			else 
				sId=trim(Request.Form("TxtUserName"))
			end if
			
		 set rs=Server.CreateObject("ADODB.recordset")
		 sql ="Select * from student  WHERE sId='"&sId&"'"
		 rs.Open sql , Conn
		 
		 if rs.eof then
				'response.write "<script>alert('’ ∫≈≤ª¥Ê‘⁄');history.back();</script>"
		  else
				  if rs("password")<>trim(Request.Form("TxtPassword")) then
				  'response.write(rs("password"))
				  response.write(Request.Form("TxtPassword"))
						  response.write "<script>alert('√‹¬Î”–ŒÛ');history.back();</script>"
						  response.end     
					end if
				Session("name")=rs("name")
				Session("sId")=rs("sId")
				Session("class")=rs("class")
			    response.write"<script>location.href='main.asp'</script>"

				'response.write rs("name")
		  end if
	   rs.close
	   set rs=nothing
	   Conn.close
	   set Conn=nothing
%>