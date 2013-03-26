<%
	'SQL 2000
	'set Conn=server.CreateObject("ADOdb.Connection")
    'Conn.open "driver={SQL Server};server=(127.0.0.1);uid=root;pwd=oracle;database=test;" 
	
	' ODBC Çý¶¯Á¬½Ó
	set Conn=Server.CreateObject("ADODB.Connection") 
	Conn.Open "Dxq"
	
	' SQL 2005
	'Set Conn = Server.CreateObject("ADODB.Connection")
	'ConnStr = "Provider=SQLNCLI.1;Server=127.0.0.1,1433;Database=test;Uid=sa;Pwd=sa;"
	'Conn.Open ConnStr
	
	'MySQL
	'Set Conn = Server.CreateObject("ADODB.Connection")
	'ConnStr ="driver={mysql odbc 3.51 driver};database=test;server=127.0.0.1;uid=root;password=;stmt=SET NAMES GBK"
	'Conn.Open ConnStr
%>
