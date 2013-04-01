<!--#include   file= "checkSession.asp "-->
<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title></title>
<script  type="text/javascript" language="javascript" src="js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="css/boxy.css" type="text/css" />
<script type="text/javascript" src="js/jquery.boxy.js" ></script>
<script type="text/javascript">
"use strict"
	window.dateAll = null;
	var headStr="<tr><td><div align='center'><span>序号</span></div></td><td><div align='center'><span>学号</span></div></td><td><div align='center'><span>姓名</span></div></td><td><div align='center'><span>密码</span></div></td><td><div align='center'><span>班级</span></div></td><td><div align='center'><span>手机</span></div></td><td><div align='center'><span>删除</span></div></td><td><div align='center'><span>修改</span></div></td></tr>";
	window.onload=function(){
	
		$("#searchAll").click(function(){
		$('#tableAll').html("");
		$.getJSON("getStudentAll.asp",{ran:Date.now()},
			function(date){
				if(date.length>0){
						$('#tableAll').append(headStr);
							  window.dateAll=date;
							  for(var k=0;k<date.length&& k<50;k++){
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
									td.innerHTML="<div align='center'><a href='javascript:deleteStudent("+k+",0)'>删除"+"</a></div>";
									$tr.append(td);
									var td=document.createElement("td");
									td.innerHTML="<div align='center'><a href='javascript:updateStudent("+k+",0)'>修改"+"</a></div>";
									$tr.append(td);
									
									$('#tableAll').append($tr);	
									
								  var info=document.getElementById("info");
								  info.innerHTML="<span>当前1/共"+Math.ceil(date.length/50)+"页 | "+date.length+"条记录</span>";
								  var div=document.getElementById("page");
								  div.innerHTML="";
								  for(var i=0;i<Math.ceil(date.length/50);i++){
										if(i==0 ||i==1 || i==2 || i==3 ){
										  var span=document.createElement("span");
										  span.innerHTML="&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
										  div.appendChild(span);									
										}
										  
										if(i==Math.ceil(date.length/50)-1){
										  var span=document.createElement("span");
										  span.innerHTML="....&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
										  div.appendChild(span);									
										}
						  
								  }	
							  }
				}else{
					alert("错误 或 查询不到");
				}
			});
	});

	
$("#search").click(function(){
				var sendDate =$("#searchId").attr("value");
				if (sendDate!=""){
				$.getJSON("getStudent.asp",{sId:sendDate,ran:Date.now()},
						function(date){
						if(date.length>0){
						  window.dateAll=date;
						  $('#tableAll').html("");
						  $('#tableAll').append(headStr);	

						  for(var k=0;k<date.length&& k<15;k++){
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
								td.innerHTML="<div align='center'><a href='javascript:deleteStudent("+k+",0)'>删除"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateStudent("+k+",0)'>修改"+"</a></div>";
								$tr.append(td);

								$('#tableAll').append($tr);
						  }
						  var info=document.getElementById("info");
						  info.innerHTML="<span>当前1/共"+Math.ceil(date.length/15)+"页 | "+date.length+"条记录</span>";
						  var div=document.getElementById("page");
						  div.innerHTML="";
						  for(var i=0;i<Math.ceil(date.length/15);i++){
								if(i==0 ||i==1 || i==2 || i==3 ){
								  var span=document.createElement("span");
								  span.innerHTML="&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
								  div.appendChild(span);									
								}
								  
								if(Math.ceil(date.length/15)>3 && i==Math.ceil(date.length/15)-1){
								  var span=document.createElement("span");
								  span.innerHTML="....&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
								  div.appendChild(span);									
								}
				  
						  }
						}else{
							alert("错误 或 查询不到");
						}
					});
				}else{
					alert("查询条件不能为空");

				}
			});		


		$("#update").click(function(){
				var sId=$("#sId").attr("value");
				var name=$("#name").attr("value");
				var password=$("#password").attr("value");
				var className=$("#class").attr("value");
				var tel=$("#tel").attr("value");
				var currPage=$("#currPage").attr("value");
				var currIndex=$("#currIndex").attr("value");
				
				if (sId!="" && name!="" && password !="" && className!="" && currPage!="" && currIndex!=""){
				
					$.getJSON("updateStudent.asp",{sId:sId,name:name,password:password,className:className,tel:tel,ran:Date.now()},
						function(date){
						
							if(date=="1"){
								window.dateAll[currIndex]={sId:sId,name:name,password:password,"class":className,tel:tel};
								
								alert("更新成功!");
								Boxy.get(document.getElementById('box')).hide();
								getContext(currPage);
								
							}else if(date=="2"){
								alert("插入成功!");
								Boxy.get(document.getElementById('box')).hide();
								Array.prototype.push.call(window.dateAll,{sId:sId,name:name,password:password,"class":className,tel:tel});
								getContext(currPage);
							}else{
								alert("操作失败!");
							}
							
					});	
					
				}else{
	
					alert("提交的信息不够详细");
				}
				
				
		});		

			$("#searchClass").click(function(){
				var sendDate =$("#className").attr("value");
				if (sendDate!=""){
				$.getJSON("getStudentClass.asp",{className:sendDate,ran:Date.now()},
						function(date){
						if(date.length>0){
						  window.dateAll=date;
						  $('#tableAll').html("");
						  $('#tableAll').append(headStr);
						  
						  for(var k=0;k<date.length&& k<50;k++){
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
								td.innerHTML="<div align='center'><a href='javascript:deleteStudent("+k+",0)'>删除"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateStudent("+k+",0)'>修改"+"</a></div>";
								$tr.append(td);
							$("#tableAll").append($tr);
						  }
						  var info=document.getElementById("info");
						  info.innerHTML="<span>当前1/共"+Math.ceil(date.length/50)+"页 | "+date.length+"条记录</span>";
						  var div=document.getElementById("page");
						  div.innerHTML="";
						  for(var i=0;i<Math.ceil(date.length/50);i++){
								if(i==0 ||i==1 || i==2 || i==3 ){
								  var span=document.createElement("span");
								  span.innerHTML="&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
								  div.appendChild(span);									
								}
								  
								if(Math.ceil(date.length/50)>3 && i==Math.ceil(date.length/50)-1){
								  var span=document.createElement("span");
								  span.innerHTML="....&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
								  div.appendChild(span);									
								}
				  
						  }
						}else{
							alert("错误 或 查询不到");
						}
					});
				}else{
					Boxy.alert("查询条件不能为空",null, {title:"提示"}); 
				}
			});		

		
	}

	
	
function deleteStudent(n,i){
	   if(confirm("确认删除？"))
		   if(true){
			$.getJSON("deleteStudent.asp",{sId:window.dateAll[n].sId,ran:Date.now()},
				function(date){
				if(date=="1"){
					Array.prototype.splice.apply(window.dateAll,[n,1]);
					getContext(i);
				}else{
					alert("删除失败");
				}				
			});
		   }
}



function getContext(pageCount){
				 if(window.dateAll!=null){

					$('#tableAll').html("");
					$('#tableAll').append(headStr);					
					for(var k=pageCount*50;k<window.dateAll.length && k<(pageCount+1)*50;k++){
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
						td.innerHTML="<div align='center'><a href='javascript:deleteStudent("+k+","+pageCount+")'>删除"+"</a></div>";
						$tr.append(td);
						var td=document.createElement("td");
						td.innerHTML="<div align='center'><a href='javascript:updateStudent("+k+","+pageCount+")'>修改"+"</a></div>";
						$tr.append(td);
						$('#tableAll').append($tr);
					}
					var info=document.getElementById("info");
					info.innerHTML="<span>当前"+(pageCount+1)+"/共"+Math.ceil(window.dateAll.length/50)+"页 | "+window.dateAll.length+"条记录</span>";
					var div=document.getElementById("page");
					div.innerHTML="";
					
					for(var i=0;i<Math.ceil(window.dateAll.length/50);i++){
						if(pageCount>=2 && i==0 ){
							var span=document.createElement("span");
							span.innerHTML="&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp....";
							div.appendChild(span);									
						}
						if(pageCount>=3 && i==pageCount-2 ||i==pageCount-1 ||i==pageCount || i==pageCount+1 || i==pageCount+2 ){
							var span=document.createElement("span");
							span.innerHTML="&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
							div.appendChild(span);									
						}								  
						if(pageCount+2<Math.ceil(window.dateAll.length/50) && i==Math.ceil(window.dateAll.length/50)-1){
							var span=document.createElement("span");
							span.innerHTML="....&nbsp<a href='javascript:getContext("+i+");'>第"+(i+1)+"页</a>&nbsp";
							div.appendChild(span);									
						}
				  
				    }
				}
			}	
			
			
function updateStudent(n,i){
		
		$("#sId").attr("value",window.dateAll[n].sId);
		$("#name").attr("value",window.dateAll[n].name);
		$("#password").attr("value",window.dateAll[n].password);
		$("#class").attr("value",window.dateAll[n]['class']);
		$("#tel").attr("value",window.dateAll[n].tel);
		$("#currPage").attr("value",i);
		$("#currIndex").attr("value",n);
		
		var box =document.getElementById("box");
		new Boxy(box,{title:"修改",closeText:"[关闭]"});	
}			
/*










			
			
			

			

*/
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
	width:10%;
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
                <td width="94%" valign="bottom"><span class="STYLE1"> 学生信息配置</span></td>
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
					<td width="33%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">学号</span></div></td>
					<td width="33%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">查询所有</span></div></td>
					<td width="33%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">所属班</span></div></td>
				
				  </tr>
				  <tr>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<input type="text" id="searchId" name="searchId" ><button id="search"  >查询</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF"><div align="center"><button id="searchAll"  >查询</button>
					</div></div></td>
					<td height="20" bgcolor="#FFFFFF"><div align="center"><input type="text" id="className" name="className" ><button id="searchClass"  >查询</button>
					</div></div></td>
				  </tr>
				</table>

	    </td>
  </tr>
  
  <tr>
		<td>

</div>
	    </td>

  </tr>
  
  <tr>
	<td height="20"><div width=50%><div id="info" style="float:left;"><span></span></div></div><div width=50%><div id="page" style="float:right;" ></div></div></td>
  </tr>
  <tr>
			<table  id="tableAll" style="width:100%;" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
			  
			  <tr>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
			  </tr>
			</table>
  </tr>
  <tr>
    <td height="90"><span style="color:red;" id="tip"></span></td>
  </tr>

</table>
<div style="display:none;">
<div  id="box" >
			<table  border="1"  style="margin-top:60px;margin-left:25px;">
			  <tr style="">
				<td bgcolor="d3eaef"  ><div align="center"><span class="STYLE10">学号</span></div></td>
				<td bgcolor="d3eaef"  ><div align="center"><span class="STYLE10">姓名</span></div></td>
				<td bgcolor="d3eaef" ><div align="center"><span class="STYLE10">密码</span></div></td>
				<td bgcolor="d3eaef"  ><div align="center"><span class="STYLE10">班级</span></div></td>
				<td bgcolor="d3eaef" ><div align="center"><span class="STYLE10">手机</span></div></td>
				<td bgcolor="d3eaef"  width="100"><div align="center"><span class="STYLE10">基本操作</span></div></td>
			  </tr>
			
			  <tr>
				<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input style="width:100px;" type="text" id="sId" name="sId"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input style="width:100px;" type="text" id="name" name="name"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input style="width:100px;" type="password" id="password" name="password"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input style="width:100px;" type="text" id="class" name="class"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input style="width:100px;" type="text" id="tel" name="tel"></div></td>
				<td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21"><button id="update">提交</button></div></td>
			  </tr>
			</table>
	<input type="hidden" name="currPage" id="currPage">
	<input type="hidden" name="currIndex" id="currIndex">
</div>
</div>       

</body>
</html>
