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
"use strick"
	var headStr="<tr><td><div align='center'><span>���</span></div></td><td><div align='center'><span>ѡ�κ�</span></div></td><td><div align='center'><span>�γ̺�</span></div></td><td><div align='center'><span>�γ���</span></div></td><td><div align='center'><span>�Ͽ�ʱ��</span></div></td><td><div align='center'><span>�Ͽε�ַ</span></div></td><td><div align='center'><span>����</span></div></td><td><div align='center'><span>�꼶</span></div></td><td><div align='center'><span>��ʦ</span></div></td><td><div align='center'><span>ѧ��</span></div></td><td><div align='center'><span>ɾ��</span></div></td><td><div align='center'><span>�޸�</span></div></td></tr>";
	window.dateAll=null;
	 window.onload=function (){

			$("#search").click(function(){
				
				var sendDate =$("#searchId").attr("value");
				
				if (sendDate!=""){
				$.getJSON("getCourse.asp",{xkId:sendDate,ran:Date.now()},
					function(date){
					
						if(date.length>0){
						  window.dateAll=date;
						  $("#tableAll").html("");
						  $('#tableAll').append(headStr);
						  
						  for(var k=0;k<date.length;k++){
								var mydate=date[k];
								var $tr =$("<tr></tr>");
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><span>"+(k+1)+"</span></div>";
								$tr.append(td);
								for(var i in  mydate){
									var td=document.createElement("td");
									td.innerHTML="<div align='center'><span>"+mydate[i]+"</span></div>";
									$tr.append(td);
								}
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:deleteCourse("+k+",0)'>ɾ��"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateCourse("+k+",0)'>�޸�"+"</a></div>";
								$tr.append(td);
							$("#tableAll").append($tr);
						  }
								
						}else{
							$("#tip").text("���� �� ��ѯ����");
						}
						
					});
				}else{
					Boxy.alert("ѡ�κŲ���Ϊ��",null, {title:"��ʾ"});
				}
			});	
			

			
		
			
			$("#searchAll").click(function(){
				$.getJSON("getCourseAll.asp",{ran:Date.now()},
					function(date){
						if(date.length>0){
						  window.dateAll=date;
						  $("#tableAll").html("");
						  $("#tableAll").append(headStr);

						  for(var k=0;k<date.length;k++){
								var mydate=date[k];
								var $tr = $("<tr></tr>");
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><span>"+(k+1)+"</span></div>";
								$tr.append(td);
								for(var i in  mydate){
									var td=document.createElement("td");
									td.innerHTML="<div align='center'><span>"+mydate[i]+"</span></div>";
									$tr.append(td);
								}
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:deleteCourse("+k+",0)'>ɾ��"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateCourse("+k+",0)'>�޸�"+"</a></div>";
								$tr.append(td);
							$("#tableAll").append($tr);
						  }
							
						}else{
							alert("���� �� ��ѯ����");
						}
					});
			});			

		$("#update").click(function(){
				var xkId=$("#xkId").attr("value");
				var kcId=$("#kcId").attr("value");
				var name=$("#name").attr("value");
				var time=$("#time").attr("value");
				var address=$("#address").attr("value");
				var numbers=$("#numbers").attr("value");
				var grade=$("#grade").attr("value");
				var teacher=$("#teacher").attr("value");
				var term=$("#date").attr("value");
				var currPage=$("#currPage").attr("value");
				var currIndex=$("#currIndex").attr("value");
				
				if (xkId!="" && name!="" && kcId !="" && address!="" && numbers!="" && currIndex!=""){		
					$.getJSON("updateCourse.asp",{xkId:xkId,kcId:kcId,name:name,time:time,address:address,numbers:numbers,grade:grade,teacher:teacher,date:term,ran:Date.now()},
						function(date){
							if(date=="1"){
								window.dateAll[currIndex]={xkId:xkId,kcId:kcId,name:name,time:time,address:address,numbers:numbers,grade:grade,teacher:teacher,date:term};
								
								alert("���³ɹ�!");
								Boxy.get(document.getElementById('box')).hide();
								getContext(currPage);
								
							}else if(date=="2"){
								alert("����ɹ�!");
								Boxy.get(document.getElementById('box')).hide();
								Array.prototype.push.call(window.dateAll,{xkId:xkId,kcId:kcId,name:name,time:time,address:address,numbers:numbers,grade:grade,teacher:teacher,date:term});
								getContext(currPage);
							}else{
								alert("����ʧ��!");
							}					
					});	
				}else{
					Boxy.alert("�ύ����Ϣ������ϸ",null, {title:"��ʾ"}); 
				}
		});				
}			


			
			

	 
		function deleteCourse(n,i){
			
			Boxy.confirm("ȷ��ɾ����", function() {$.getJSON("deleteCourse.asp",{xkId:window.dateAll[n].xkId,ran:Date.now()},
				function(date){
					if(date=="1"){
						Array.prototype.splice.apply(window.dateAll,[n,1]);
						getContext(i);
						
					}		
			})}, {title: "��ʾ��Ϣ"});
		}
		
		function getContext(pageCount){
				 if(window.dateAll!=null){
					$("#tableAll").html("");
					$("#tableAll").append(headStr);					
					for(var k=pageCount*15;k<window.dateAll.length && k<(pageCount+1)*15;k++){
						 var mydate=window.dateAll[k];
						 var $tr = $("<tr></tr>");
						 var td=document.createElement("td");
						 td.innerHTML="<div align='center'><span>"+(k+1)+"</span></div>";
						 $tr.append(td);						 
						 for(var i in  mydate){
							var td=document.createElement("td");
							td.innerHTML="<div align='center'><span>"+mydate[i]+"</span></div>";
							$tr.append(td);
						}
						var td=document.createElement("td");
						td.innerHTML="<div align='center'><a href='javascript:deleteCourse("+k+","+pageCount+")'>ɾ��"+"</a></div>";
						$tr.append(td);
						var td=document.createElement("td");
						td.innerHTML="<div align='center'><a href='javascript:updateCourse("+k+","+pageCount+")'>�޸�"+"</a></div>";
						$tr.append(td);
						$("#tableAll").append($tr);
					}

				}
			}

		function updateCourse(n,i){
		
				$("#xkId").attr("value",window.dateAll[n].xkId);
				$("#kcId").attr("value",window.dateAll[n].kcId);
				$("#name").attr("value",window.dateAll[n].name);
				$("#time").attr("value",window.dateAll[n].time);
				$("#address").attr("value",window.dateAll[n].address);
				$("#numbers").attr("value",window.dateAll[n].numbers);
				$("#grade").attr("value",window.dateAll[n].grade);
				$("#teacher").attr("value",window.dateAll[n].teacher);
				$("#date").attr("value",window.dateAll[n].date);
				$("#currPage").attr("value",i);
				$("#currIndex").attr("value",n);
				var box =document.getElementById("box");
				new Boxy(box,{title:"�޸�",closeText:"[�ر�]"});	
				
				
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
#tableAll tr td {
	height:20px;
	background-color:#FFFFFF;
	width:5%;
	color: #344b50;
	font-size: 12px;
}
#tableAll tr td  div{
	align:center;
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
                <td width="94%" valign="bottom"><span class="STYLE1"> �γ���Ϣ����</span></td>
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
					<td width="50%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ѡ�κ�</span></div></td>
					<td width="50%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ѯ���пγ�</span></div></td>
				  </tr>
				  <tr>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<input type="text" id="searchId" name="searchId" ><button id="search"  >��ѯ</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF"><div align="center"><button id="searchAll"  >��ѯ</button></div></td>
				  </tr>
				</table>

	    </td>
  </tr>

  <tr>
  
  </tr>

    <tr>
			<table  id="tableAll" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
			  
			  <tr>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
			  </tr>
			</table>
  </tr>

</table>

<div style="display:none;">
		<div id="box">
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
			  <tr>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ѡ�κ�</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�γ̺�</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�γ���</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�Ͽ�ʱ��</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�Ͽε�ַ</span></div></td>
			  </tr>
			  <tr>
				<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input type="text" id="xkId" name="xkId"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="kcId" name="kcId"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="name" name="name"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="time" name="time"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="address" name="address"></div></td>
			  </tr>
<tr>

				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�꼶</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ʦ</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ѧ��</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����</span></div></td>
</tr>
<tr>

				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="numbers" name="numbers"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="grade" name="grade"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="teacher" name="teacher"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="date" name="date"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><button id="update">�ύ</button></div></td>
</tr>
			</table>
				<input type="hidden" name="currPage" id="currPage">
	<input type="hidden" name="currIndex" id="currIndex">
	</div>
</div>
</body>
</html>
