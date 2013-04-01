
<!--#include   file= "conn.asp "-->
<%
		set rs=Server.CreateObject("ADODB.recordset")
		sId=Request.Form("sId")
		if Request.Form("radio1")<>"" and Request.Form("rad1")<>"" and sId<>"" then
				set rs=Server.CreateObject("ADODB.recordset")
				radio1=Request.Form("radio1")
				response.write(radio1)
				xkId  =Request.Form("rad1")
				sql ="update elective set Score="&radio1&" where xkId='"&xkId&"' and sId='"&sId&"'"
				rs.Open sql , Conn
				on error resume next
				conn.Execute sql
				rs.close
				set rs =nothing
			end if
		if Request.Form("radio2")<>"" and Request.Form("rad2")<>"" and sId<>"" then
				set rs=Server.CreateObject("ADODB.recordset")
				radio2=Request.Form("radio2")
				xkId  =Request.Form("rad2")
				sql ="update elective set Score="&radio2&" where xkId='"&xkId&"' and sId='"&sId&"'"
				rs.Open sql , Conn
				on error resume next
				conn.Execute sql
				rs.close
				set rs =nothing
			end if
		if Request.Form("radio3")<>"" and Request.Form("rad3")<>"" and sId<>"" then
				set rs=Server.CreateObject("ADODB.recordset")
				radio3=Request.Form("radio3")
				xkId  =Request.Form("rad3")
				sql ="update elective set Score="&radio3&" where xkId='"&xkId&"' and sId='"&sId&"'"
				rs.Open sql , Conn
				on error resume next
				conn.Execute sql
				rs.close
				set rs =nothing
			end if

		Conn.close
		set Conn = nothing
		response.write "<script>alert('提交成功 ');location.href='main.asp'</script>"
%>