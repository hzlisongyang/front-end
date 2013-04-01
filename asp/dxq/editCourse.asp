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
	var headStr="<tr><td><div align='center'><span>序号</span></div></td><td><div align='center'><span>选课号</span></div></td><td><div align='center'><span>课程号</span></div></td><td><div align='center'><span>课程名</span></div></td><td><div align='center'><span>上课时间</span></div></td><td><div align='center'><span>上课地址</span></div></td><td><div align='center'><span>人数</span></div></td><td><div align='center'><span>年级</span></div></td><td><div align='center'><span>老师</span></div></td><td><div align='center'><span>学期</span></div></td><td><div align='center'><span>删除</span></div></td><td><div align='center'><span>修改</span></div></td></tr>";
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
								td.innerHTML="<div align='center'><a href='javascript:deleteCourse("+k+",0)'>删除"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateCourse("+k+",0)'>修改"+"</a></div>";
								$tr.append(td);
							$("#tableAll").append($tr);
						  }
								
						}else{
							$("#tip").text("错误 或 查询不到");
						}
						
					});
				}else{
					Boxy.alert("选课号不能为空",null, {title:"提示"});
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
								td.innerHTML="<div align='center'><a href='javascript:deleteCourse("+k+",0)'>删除"+"</a></div>";
								$tr.append(td);
								var td=document.createElement("td");
								td.innerHTML="<div align='center'><a href='javascript:updateCourse("+k+",0)'>修改"+"</a></div>";
								$tr.append(td);
							$("#tableAll").append($tr);
						  }
							
						}else{
							alert("错误 或 查询不到");
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
								
								alert("更新成功!");
								Boxy.get(document.getElementById('box')).hide();
								getContext(currPage);
								
							}else if(date=="2"){
								alert("插入成功!");
								Boxy.get(document.getElementById('box')).hide();
								Array.prototype.push.call(window.dateAll,{xkId:xkId,kcId:kcId,name:name,time:time,address:address,numbers:numbers,grade:grade,teacher:teacher,date:term});
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


			
			

	 
		function deleteCourse(n,i){
			
			Boxy.confirm("确认删除？", function() {$.getJSON("deleteCourse.asp",{xkId:window.dateAll[n].xkId,ran:Date.now()},
				function(date){
					if(date=="1"){
						Array.prototype.splice.apply(window.dateAll,[n,1]);
						getContext(i);
						
					}		
			})}, {title: "提示信息"});
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
						td.innerHTML="<div align='center'><a href='javascript:deleteCourse("+k+","+pageCount+")'>删除"+"</a></div>";
						$tr.append(td);
						var td=document.createElement("td");
						td.innerHTML="<div align='center'><a href='javascript:updateCourse("+k+","+pageCount+")'>修改"+"</a></div>";
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
                <td width="94%" valign="bottom"><span class="STYLE1"> 课程信息配置</span></td>
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
					<td width="50%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">选课号</span></div></td>
					<td width="50%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">查询所有课程</span></div></td>
				  </tr>
				  <tr>
					<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">
					<input type="text" id="searchId" name="searchId" ><button id="search"  >查询</button>
					</div></td>
					<td height="20" bgcolor="#FFFFFF"><div align="center"><button id="searchAll"  >查询</button></div></td>
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
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">选课号</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">课程号</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">课程名</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">上课时间</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">上课地址</span></div></td>
			  </tr>
			  <tr>
				<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><input type="text" id="xkId" name="xkId"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="kcId" name="kcId"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="name" name="name"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="time" name="time"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="address" name="address"></div></td>
			  </tr>
<tr>

				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">人数</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">年级</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">老师</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">学期</span></div></td>
				<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
</tr>
<tr>

				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="numbers" name="numbers"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="grade" name="grade"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="teacher" name="teacher"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><input type="text" id="date" name="date"></div></td>
				<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><button id="update">提交</button></div></td>
</tr>
			</table>
				<input type="hidden" name="currPage" id="currPage">
	<input type="hidden" name="currIndex" id="currIndex">
	</div>
</div>
</body>
</html>
