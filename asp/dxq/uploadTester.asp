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
    <form name="frmSend" method="POST" enctype="multipart/form-data" accept-charset="GBK" action="uploadTester.asp" onSubmit="return onSubmitForm();">
    <input name="attach1" type="file" size=35>    <input style="margin-top:4" type=submit value="上传">
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
        SaveFiles = "<B>导入:</B> "
        for each fileKey in Upload.UploadedFiles.keys
            SaveFiles = SaveFiles &"<a href='test.asp?"&Upload.UploadedFiles(fileKey).FileName &"'>导入</a>"
        next
		
    else
        SaveFiles = "请选择上传文件"
    end if
end function
%>



<BODY>
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
</BODY>
</HTML>
