<%
if Session("admin") ="" then
 response.write "<script>alert('������ʱ�������µ�¼');location.href='loginAdmin.html'</script>"
end if
%>