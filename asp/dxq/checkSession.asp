<%
if Session("admin") ="" then
 response.write "<script>alert('操作超时，请重新登录');location.href='loginAdmin.html'</script>"
end if
%>