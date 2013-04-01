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
"use strict"
   var headStr="<tr><td><div align='center'><span>序号</span></div></td><td><div align='center'><span>选课号</span></div></td><td><div align='center'><span>学号</span></div></td><td><div align='center'><span>评分</span></div></td><td><div align='center'><span>删除</span></div></td><td><div align='center'><span>修改</span></div></td></tr>";
	window.dateAll=null;
	window.onload=function (){
			
			$("#searchAll").click(function(){
				$.getJSON("getElectiveAll.asp",{ran:Date.now()},
					function(date){
						if(date.length>0){
						  window.dateAll=date;
						  $("#tableAll").html("");
						  $("#tableAll").append(headStr);
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
								td.innerHTML="<div align='center'><a href='javascript:deleteElective("+k+",0)'>删除"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateElective("+k+",0)'>修改"+"</a></div>";
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
			});				


			$("#search").click(function(){
				var sendDate =$("#searchId").attr("value");
				if (sendDate!=""){
				$.getJSON("getElective.asp",{xkId:sendDate,ran:Date.now()},
						function(date){
						if(date.length>0){
						  window.dateAll=date;
						  $("#tableAll").html("");
						  $("#tableAll").append(headStr);
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
								td.innerHTML="<div align='center'><a href='javascript:deleteElective("+k+",0)'>删除"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateElective("+k+",0)'>修改"+"</a></div>";
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
								  
								if(Math.ceil(date.length/15)>3 && i==Math.ceil(date.length/50)-1){
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
				Boxy.alert("查询条件不能为空",null, {title:"提示"}); //boxy属性 
				}
			});	
			
		$("#update").click(function(){
				var xkId=$("#xkId").attr("value");
				var sId=$("#sId").attr("value");
				var Score=$("#elective").attr("value");
				var currPage=$("#currPage").attr("value");
				var currIndex=$("#currIndex").attr("value");
				if (sId!="" && xkId!="" && Score !="" && currPage!="" && currIndex!=""){		
					$.getJSON("updateElective.asp",{xkId:xkId,sId:sId,Score:Score,ran:Date.now()},
						function(date){
							if(date=="1"){
								window.dateAll[currIndex]={xkId:xkId,sId:sId,Score:Score};
								alert("更新成功!");
								Boxy.get(document.getElementById('box')).hide();
								getContext(currPage);
								
							}else if(date=="2"){
								alert("插入成功!");
								Boxy.get(document.getElementById('box')).hide();
								Array.prototype.push.call(window.dateAll,{xkId:xkId,sId:sId,Score:Score});
								getContext(currPage);
							}else{
								alert("操作失败!");
							}					
					});	
				}else{
					Boxy.alert("提交的信息不够详细",null, {title:"提示"}); 
				}
		});			
			
	}


			function getContext(pageCount){
				 if(window.dateAll!=null){
					$("#tableAll").html("");
					$("#tableAll").append(headStr);					
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
						td.innerHTML="<div align='center'><a href='javascript:deleteElective("+k+","+pageCount+")'>删除"+"</a></div>";
						$tr.append(td);
						var td=document.createElement("td");
						td.innerHTML="<div align='center'><a href='javascript:updateElective("+k+","+pageCount+")'>修改"+"</a></div>";
						$tr.append(td);
						$("#tableAll").append($tr);
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
			
			
			
		function deleteElective(n,i){
			Boxy.confirm("确认删除？", function() {$.getJSON("deleteElective.asp",{xkId:window.dateAll[n].xkId,sId:window.dateAll[n].sId,ran:Date.now()},
				function(date){if(date=="1"){
					Array.prototype.splice.apply(window.dateAll,[n,1]);
					getContext(i);
				}		
			})}, {title: "提示信息"});
		}	


		function updateElective(n,i){
				$("#xkId").attr("value",window.dateAll[n].xkId);
				$("#sId").attr("value",window.dateAll[n].sId);
				$("#elective").attr("value",window.dateAll[n].Score);
				$("#currPage").attr("value",i);
				$("#currIndex").attr("value",n);
				var box =document.getElementById("box");
				new Boxy(box,{title:"修改",closeText:"[关闭]"});	
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
	width:6%;
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
                <td width="94%" valign="bottom"><span class="STYLE1"> 选课信息配置</span></td>
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
					<td width="50%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">选课号查询</span></div></td>
					<td width="50%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">查询所有选课</span></div></td>
				  </tr>
				  <tr>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<input type="text" id="searchId" name="searchId"  ><button id="search"  >查询</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF"><div align="center"><button id="searchAll"  >查询</button></div></td>
				  </tr>
				</table>

	    </td>
  </tr>
    <tr>
	<td height="20"><div width='50%'><div id="info" style="float:left;"><span></span></div></div><div width='50%'><div id="page" style="float:right;" ></div></div></td>
  </tr>
  <tr>
    <td><span style="color:red;" id="tip"></span></td>
  </tr>
    <tr>
			<table  id="tableAll" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
			  
			  <tr>
				  <td></td>
				  <td></td>
				  <td></td>
			  </tr>
			</table>
  </tr>

</table>

<div style="display:none;">
		<div id="box" style="width:800px;">
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
			  <tr>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">选课号</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">学号</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">评分</span></div></td>
				<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
			  </tr>
			  <tr>

				<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input style='width:200px;' type="text" id="xkId" name="xkId"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="sId" name="sId"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="elective" name="elective"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><button id="update">提交</button></div></td>

			  </tr>
			  <tr>
			</table>
	    </div>
			<input type="hidden" name="currPage" id="currPage">
	<input type="hidden" name="currIndex" id="currIndex">
</div>
</body>
</html>
