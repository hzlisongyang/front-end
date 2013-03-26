<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%	Response.CodePage = 936
	response.Charset="gbk"
%>
<!--#include   file= "conn.asp "-->
<%
		if Request.Form("TxtUserName")<>"" then
				account=Request.Form("TxtUserName")
			else 
				account=Request.Form("TxtUserName")
			end if
			
		 set rs=Server.CreateObject("ADODB.recordset")
		 sql ="Select * from admin  WHERE account='"&account&"'"
		 rs.Open sql , Conn
		 
		 if rs.eof then
				response.write "<script>alert('’ ∫≈≤ª¥Ê‘⁄');location.href='./mainAdmin.asp'</script>"
				response.end
		  else
				  if rs("password")<>Request.Form("TxtPassword") then
				  'response.write(rs("password"))
				  response.write(Request.Form("TxtPassword"))
						  response.write "<script>alert('√‹¬Î”–ŒÛ');history.back();</script>"
						  response.end     
					end if      
			    response.write"<script>location.href='./mainAdmin.asp'</script>"
				response.write(rs("account"))
				Session("admin")=rs("account")
				'response.write rs("name")
		  end if
	   rs.close
	   set rs=nothing
	   Conn.close
	   set Conn=nothing
%>