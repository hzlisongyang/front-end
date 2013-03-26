<%@ Language=VBScript %>
<% 
option explicit 
Response.Expires = -1
Server.ScriptTimeout = 600
Session.CodePage  = 936
%>
<!--#include   file= "checkSession.asp "-->
<!-- #include file="freeaspupload.asp" -->
<%


  Dim uploadsDirVar
  uploadsDirVar = Server.mappath("savefiles") 

function OutputForm()
%>
<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title></title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
<script type='text/javascript'>
	function upload(){
		var ele =document.getElementById('upload');
		ele.innerText='正在上传...请稍候';
	}
</script>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 课程信息配置</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
			  <tr >	
					<div align="center"><span class="STYLE10"><h2>课程数据 EXCEL导入 模板下载</h2> </span>
					</div>					
			  </tr>
			  <tr >
				<hr>
			  </tr>
			  <tr >	
					<div align="center"><a href="downfiles/course.xls" ><h2>点击下载模板</h2></a>
					</div>					
			  </tr>
			  	<tr>
				<td height="40" bgcolor="#FFFFFF" class="STYLE6"><div align="center">
				<span><h2 style="color:red;">选择文件-> 提交 -> 会出现文件列表 选择导入 ->导入成功后，应<a href="editCourse.asp">查询</a>下导入的数据格式是否正确<h2></span>
				</div></td>
			  </tr>		  
			</table>
	    </td>
  </tr>
  <tr>
    
  </tr>
    <tr>
		<td>
			<form name="frmSend" method="POST" enctype="multipart/form-data" accept-charset="GBK" action="addCourse.asp" >
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
				  <tr>
					<td width="56.5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">Excel文件</span></div></td>
					<td width="43.5%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">基本操作</span></div></td>
				  </tr>
				  <tr>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="file" name="attach1"></div></td>
					<td height="20" bgcolor="#FFFFFF"><input type=submit name="submit" value="提交"></td>
				  </tr>
				</table>
			</form>
<%
end function

function TestEnvironment()
    Dim fso, fileName, testFile, streamTest
    TestEnvironment = ""
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    if not fso.FolderExists(uploadsDirVar) then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not exist.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    fileName = uploadsDirVar & "\test.txt"
    on error resume next
    Set testFile = fso.CreateTextFile(fileName, true)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have write permissions.</B><br>The value of your uploadsDirVar is incorrect. Open uploadTester.asp in an editor and change the value of uploadsDirVar to the pathname of a directory with write permissions."
        exit function
    end if
    Err.Clear
    testFile.Close
    fso.DeleteFile(fileName)
    If Err.Number<>0 then
        TestEnvironment = "<B>Folder " & uploadsDirVar & " does not have delete permissions</B>, although it does have write permissions.<br>Change the permissions for IUSR_<I>computername</I> on this folder."
        exit function
    end if
    Err.Clear
    Set streamTest = Server.CreateObject("ADODB.Stream")
    If Err.Number<>0 then
        TestEnvironment = "<B>The ADODB object <I>Stream</I> is not available in your server.</B><br>Check the Requirements page for information about upgrading your ADODB libraries."
        exit function
    end if
    Set streamTest = Nothing
end function

function SaveFiles
    Dim Upload, fileName, fileSize, ks, i, fileKey

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

	' If something fails inside the script, but the exception is handled
	If Err.Number<>0 then Exit function

    SaveFiles = ""
    ks = Upload.UploadedFiles.keys
    if (UBound(ks) <> -1) then
        SaveFiles = "<B>文件列表:</B> "
        for each fileKey in Upload.UploadedFiles.keys
			Response.Cookies("fileName")=Upload.UploadedFiles(fileKey).FileName
            SaveFiles = SaveFiles &"<a id='upload' onclick='upload()' href='courseInsert.asp?"&Upload.UploadedFiles(fileKey).FileName &"'>导入</a>"
        next
		
    else
        SaveFiles = "请选择上传文件"
    end if
end function
%>			
	    </td>
  </tr>
</table>
<%
Dim diagnostics
if Request.ServerVariables("REQUEST_METHOD") <> "POST" then
    diagnostics = TestEnvironment()
    if diagnostics<>"" then
        response.write diagnostics
    else
        response.write "<div>"
        OutputForm()
        response.write "</div>"
    end if
else
    response.write "<div >"
    OutputForm()
    response.write SaveFiles()
    response.write "<br><br></div>"
end if

%>
</body>
</html>
