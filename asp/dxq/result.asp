<!--#include   file= "checkSession.asp "-->
<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title></title>
<script  type="text/javascript" language="javascript" src="js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="css/boxy.css" type="text/css" />
<script type="text/javascript" src="js/jquery.boxy.js" ></script>
<script  type="text/javascript">
	var myTr="<tr><td><div align='center'><span>ѡ�κ�</span></div></td><td><div align='center'><span>�γ̺�</span></div></td><td><div align='center'><span>�γ���</span></div></td><td><div align='center'><span>��ʦ</span></div></td><td><div align='center'><span>������</span></div></td><td><div align='center'><span>������</span></div></td><td><div align='center'><span>�÷�(�����ܷ�/����������)</span></div></td></tr>";
	var noele="<tr><td style='width:17%;'><div align='center'><span>ѡ�κ�</span></div></td><td style='width:20%;'><div align='center'><span>�γ���</span></div></td><td><div align='center'><span>��ʦ</span></div></td><td><div align='center'><span>ѧ��</span></div></td><td><div align='center'><span>����</span></div></td><td><div align='center'><span>�ֻ�</span></div></td><td><div align='center'><span>�༶</span></div></td></tr>";
	 window.onload=function (){

		
			var currTerm=(function(){
				var currTerm;
				var now=new Date();
				var currYear=now.getFullYear();
				var currMonth=now.getMonth();
				if(currMonth<5)
					currTerm=(currYear-1)+"-"+currYear+"-"+1;
				else if(5<=currMonth && currMonth<11)
					currTerm=(currYear-1)+"-"+currYear+"-"+2;
				else
					currTerm=currYear+"-"+(currYear+1)+"-"+1;
				return currTerm;
			});
			
			$("#currTerm").attr("value",currTerm);

			$("#searchxk").click(function(){
				var sendDate =$("#searchxkId").attr("value");
				if (sendDate!=""){
				$.getJSON("getResult.asp",{xkId:sendDate,ran:Date.now()},
					function(date){
						if(date.length>0){
							
							$("#myTable").html("");
						    $("#myTable").append(myTr);
							  for(var k=0;k<date.length;k++){
									var mydate=date[k];
									var $tr = $("<tr></tr>");
									for(var i in  mydate){
										var td=document.createElement("td");
										td.innerHTML="<div>"+mydate[i]+"</div>";
										$tr.append(td);
									}
								$("#myTable").append($tr);
							  }
								
						}else{
							Boxy.alert("���� �� ��ѯ����",null, {title:"��ʾ"});
						}
					});
				}else{
					Boxy.alert("��ѯֵ����Ϊ��",null, {title:"��ʾ"});
				}
			});


			$("#searchkc").click(function(){
				var currTerm =$("#currTerm").attr("value");
				var sendDate =$("#searchkcId").attr("value");
				if (sendDate!=""){
				$.getJSON("getResult1.asp",{kcId:sendDate,term:currTerm,ran:Date.now()},
					function(date){
						if(date.length>0){
						  $("#myTable").html("");
						  $("#myTable").append(myTr);
						  for(var k=0;k<date.length;k++){
								var mydate=date[k];
								var $tr = $("<tr></tr>");
								for(var i in  mydate){
									var td=document.createElement("td");
									td.innerHTML="<div>"+mydate[i]+"</div>";
									$tr.append(td);
								}
							$("#myTable").append($tr);
						  }
								
						}else{
							Boxy.alert("���� �� ��ѯ����",null, {title:"��ʾ"});
						}
					});
				}else{
					Boxy.alert("��ѯֵ����Ϊ��",null, {title:"��ʾ"});
				}
			});


			$("#searchteacher").click(function(){
				var currTerm =$("#currTerm").attr("value");
				var sendDate =$("#searchtc").attr("value");
				if (sendDate!=""){
				$.getJSON("getResult2.asp",{teacher:sendDate,term:currTerm,ran:Date.now()},
					function(date){
						if(date.length>0){
						  $("#myTable").html("");
						  $("#myTable").append(myTr);
						  for(var k=0;k<date.length;k++){
								var mydate=date[k];
								var $tr = $("<tr></tr>");
								for(var i in  mydate){
									var td=document.createElement("td");
									td.innerHTML="<div>"+mydate[i]+"</div>";
									$tr.append(td);
								}
							$("#myTable").append($tr);
						  }
								
						}else{
							Boxy.alert("���� �� ��ѯ����",null, {title:"��ʾ"});
						}
					});
				}else{
					Boxy.alert("��ѯֵ����Ϊ��",null, {title:"��ʾ"});
				}
			});		

			
			$("#search").click(function(){
				var currTerm =$("#currTerm").attr("value");
				
				if (currTerm!=""){
				
				$.getJSON("getResult3.asp",{term:currTerm,ran:Date.now()},
					function(date){
					
						if(date.length>0){
						  $("#myTable").html("");
						  $("#myTable").append(myTr);
						  for(var k=0;k<date.length;k++){
								var mydate=date[k];
								var $tr = $("<tr></tr>");
								for(var i in  mydate){
									var td=document.createElement("td");
									td.innerHTML="<div>"+mydate[i]+"</div>";
									$tr.append(td);
								}
							$("#myTable").append($tr);
						  }
							
						
						}else{
							Boxy.alert("���� �� ��ѯ����",null, {title:"��ʾ"});
						}
						
					});
				}else{
					//Boxy.alert("��ѯֵ����Ϊ��",null, {title:"��ʾ"});
				}
			});		
			
			
			$("#searchNoele").click(function(){
				var currTerm =$("#currTerm").attr("value");
				
				if (currTerm!=""){
				
				$.getJSON("getResult4.asp",{term:currTerm,ran:Date.now()},
					function(date){
					
						if(date.length>0){
						  $("#myTable").html("");
						  $("#myTable").append(noele);
						  for(var k=0;k<date.length;k++){
								var mydate=date[k];
								var $tr = $("<tr></tr>");
								for(var i in  mydate){
									var td=document.createElement("td");
									td.innerHTML="<div>"+mydate[i]+"</div>";
									console.log(mydate[i]);
									$tr.append(td);
								}
							$("#myTable").append($tr);
						  }
							
						
						}else{
							Boxy.alert("���� �� ��ѯ����",null, {title:"��ʾ"});
						}
						
					});
				}else{
					//Boxy.alert("��ѯֵ����Ϊ��",null, {title:"��ʾ"});
				}
			});					
			
			$("#outPut").click(function(){
				var currTerm =$("#currTerm").attr("value");
				if (currTerm!=""){
					location.href='download.asp?term='+currTerm;
				}else{
					$("#tip").text("����Ϊ��");
				}
			});	
			$("#outPutNoele").click(function(){
				var currTerm =$("#currTerm").attr("value");
				if (currTerm!=""){
					location.href='download1.asp?term='+currTerm;
				}else{
					$("#tip").text("����Ϊ��");
				}
			});	
			
	 }
</script>
<style type="text/css">

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
.table tr td{
	height:20px;
	background-color:#FFFFFF;
	font-size: 12px;
}
.table tr td div{
	text-align:center;
}

</style>
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
                <td width="94%" valign="bottom"><span class="STYLE1"> ��Ϣͳ��</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              </span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table>
	</td>
      </tr>
    </table></td>
  </tr>

      <tr>
		<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
				  <tr>
					<td width="18%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ѡ�κ�</span></div></td>
					<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�γ̺�</span></div></td>
					<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ʦ</span></div></td>
					<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ѧ��(�Զ����ɵ��ɱ༭)</span></div></td>
					<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ѧ������</span></div></td>
					<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ѧ��δ����</span></div></td>
				  </tr>
				  <tr>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center" >
					<input type="text" id="searchxkId" name="searchxkId" style="width:140px;"><button id="searchxk"  >��ѯ</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<input type="text" id="searchkcId" name="searchkcId" ><button id="searchkc"  >��ѯ</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<input type="text" id="searchtc" name="searchtc" style="width:100px;" ><button id="searchteacher"  >��ѯ</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<input type="text" id="currTerm" style="width:100px;" >
					</div></td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<button id="search"  >��ѯ</button><button id="outPut"  >����</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<button id="searchNoele"  >��ѯ</button><button id="outPutNoele"  >����</button>
					</div></td>
				  </tr>
				</table>

	    </td>
  </tr>
  
  <tr>
		<td>
			<table id="myTable" class="table" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
			  <tr id="myTr">
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ѡ�κ�</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�γ̺�</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�γ���</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ʦ</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">������</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��������</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�÷֣������ܷ�/����������</span></div></td>
			  </tr>
			</table>
	    </td>
  </tr>
  <tr>
    <td height="90"><span style="color:red;" id="tip"></span></td>
  </tr>

</table>
</body>
</html>
