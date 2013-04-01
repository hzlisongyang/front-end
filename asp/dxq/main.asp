<!--#include   file= "conn.asp "-->
<!DOCTYPE html >
<html >
<head id="ctl00_Head1">
<meta http-equiv="Content-Type" content="text/html; charset=GBK"><title>
	计算学院实践教学效果学生评价指标
</title>
<script  type="text/javascript" language="javascript" src="js/jquery-1.7.2.min.js"></script>
<style type="text/css">
   body {
          text-align:left;
        }
    #divDesign{text-align: left}
    #divDesign LI{margin:0px;}
        #divDesign LI A 
        {
	         MARGIN: 0px; CURSOR: pointer; width:100px;
	        color: #666; BACKGROUND-REPEAT: no-repeat; TEXT-DECORATION: none;  DISPLAY:  inline-block;  
        }
         #divDesign LI A:visited 
        {
	        MARGIN: 0px; CURSOR: pointer; width:100px;
	        COLOR: #666; BACKGROUND-REPEAT: no-repeat; TEXT-DECORATION: none;  DISPLAY:  inline-block;  
        }
        #divDesign LI A:hover 
        {
	         color:#ffffff; background-color:#3366cc;  width:100px;
        }
        .divMenu{text-align: left}
    .divMenu LI{margin:0px;}
        .divMenu LI A 
        {
	         MARGIN: 0px; CURSOR: pointer; width:82px;
	        color: #666; BACKGROUND-REPEAT: no-repeat; TEXT-DECORATION: none;  DISPLAY:  inline-block;  
        }
         .divMenu LI A:visited 
        {
	        MARGIN: 0px; CURSOR: pointer; width:82px;
	        COLOR: #666; BACKGROUND-REPEAT: no-repeat; TEXT-DECORATION: none;  DISPLAY:  inline-block;  
        }
        .divMenu LI A:hover 
        {
	         color:#ffffff; background-color:#3366cc! important;  width:82px;
        } 
        .divMenuPer{ line-height:30px; margin:0 auto;
        top:0px; width:1002px; display:block; }
         #ulpermenu{ padding-right:10px;text-align: right; float: right; width:720px;}
        #ulpermenu li {float:right; margin-right:12px; display:inline;  height:23px; padding-top:3px;}
        #ulLinkMeun li{padding-left:0; margin-left:2px; }
       * html div#fixme {position: absolute;
top:expression(eval(document.compatMode &&
document.compatMode=='CSS1Compat') ?
documentElement.scrollTop : document.body.scrollTop);}
* html,* html body{
    background: #fff url(foo) fixed;
  }
  * html div#fixme-bottom {position: absolute;
top:expression(eval(document.compatMode &&
document.compatMode=='CSS1Compat') ?
documentElement.scrollTop
+(documentElement.clientHeight-this.clientHeight) 
: document.body.scrollTop
+(document.body.clientHeight-this.clientHeight));}
  #fixme{position:fixed;}
 #fixmebottom {  z-index:999; position:fixed; bottom:0; left:0; width:100%; _position:absolute; /* for IE6 */
 _top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */ overflow:visible; }
 

</style>


<link href="./main/q.css" rel="stylesheet" type="text/css"><link href="./main/solidcss21.css" rel="stylesheet" type="text/css"></head>

<body>  
    <div id="fixme" style="">
        <div id="ctl00_divMenuPer" class="divMenuPer">
            <div>
             <style>#fixme{width:100%;background:#eff7ff;}</style>
            </div>
            <div>
                <div style="float: left; margin-left: 18px; display: inline;">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tbody><tr>
                            <td>
                                <a href="#">
                                    <img  height="28" width="28" src="./main/logo.bmp"></a>
                            </td>
                            <td style="padding-right: 10px; border: 0;">
                                &nbsp;&nbsp;
                                    
                                    <span id="ctl00_Label1">
									<% 
										Response.Write Session("sId")&"-"&Session("name")&"-"&Session("class")
									%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="./index.html">退出</a>
									</span></td>
                        </tr>
                    </tbody></table>
                </div>
                
                <div style="clear: both">
                </div>
            </div> 
           
        </div>

    </div>
    <div id="ctl00_divHeaderHeight" style="height:34px;"></div>
   
    <div id="jqContent" class="">
        
        <div id="headerCss">
            <div id="headerLeft">
            </div>
            <div id="headerCenter">
            </div>
            <div id="headerRight">
            </div>
        </div>
        <div id="mainCss">
            <div id="mainInner">
                <div id="box">


   <div class="survey" style="margin:0px auto;">
       
      
    <div id="ctl00_ContentPlaceHolder1_JQ1_divHead" class="surveyhead" style="border: 0px;">
    <h1 id="ctl00_ContentPlaceHolder1_JQ1_h1Name">
        <span id="ctl00_ContentPlaceHolder1_JQ1_lblQuestionnaireName">计算学院实践教学效果学生评价指标</span></h1>
    <div id="ctl00_ContentPlaceHolder1_JQ1_divUserInfo" style="float: right; margin: 5px 0px;font-size:14px;">
        <span id="ctl00_ContentPlaceHolder1_JQ1_spanPublisher">发布者：<strong>计算学院</strong>&nbsp;<span class="hei"><span id="PublishDate" style='display:none;' >12-06-25</span></span>&nbsp;&nbsp;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight:bold;"></span>&nbsp;&nbsp;</span>
        
    </div>
    <div style="text-align: left; margin-left: 10px;">
    </div>
    <div style="clear: both;">
    </div>
    
    
    
    <div id="ctl00_ContentPlaceHolder1_JQ1_divDec" class="surveydescription">
        <span style="float: left;">
            
        </span>
        <span id="ctl00_ContentPlaceHolder1_JQ1_lblQuestionnaireDescription" style="vertical-align: middle;font-size:14px;">您好：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 为了能够了解实践教学效果，感谢认真填写本问卷，希望能得到您的支持与协助，衷心祝愿学业进步！<br>
</span>
    </div>
    <div style="clear: both;">
    </div>
    
    
    
    
    
    
    
</div>

<div id="ctl00_ContentPlaceHolder1_JQ1_question" class="surveycontent">
    
    <div id="ctl00_ContentPlaceHolder1_JQ1_surveyContent">
		<fieldset class="fieldset" id="fieldset1">
		<form id="myForm" action="elective.asp" method="post">
		<style>
			#mytable
			  {
			  border-collapse:collapse;
			  }	
		</style>
			<table id="mytable" width="756" height="466" border="1">
			  <tr style="text-align:center;font-weight: bold;height:40px;" >
				<td  width="138">类别</td>
				<td colspan="2" >指标内容</td>
				</tr>
			  <tr style="height:80px;">
				<td>课前准备</td>
				<td colspan="2">课程内容安排符合教学大纲的要求，与科学专业应用背景紧密结合，设计详细合理，目的明确，重点突出</td>
				</tr>
			  <tr style="height:70px;">
				<td rowspan="2">教学态度</td>
				<td colspan="2">工作认真负责、积极投入；对学生在实习过程中遇到的问题和困难，能够认真对待，及时提供指导，帮助解决</td>
				</tr>
			  <tr style="height:80px;">
				<td colspan="2">定期检查学生实习进度，对学生在时间中表现的专业问题，及时在下一个阶段的教学中给予解决或改善</td>
				</tr>
			  <tr style="height:60px;">
				<td rowspan="4">教学能力</td>
				<td width="129">教学组织水平</td>
				<td width="467">做好充分的教学组织和控制，确保实践教学活动顺利、有序的完成</td>
			  </tr>
			  <tr style="height:60px;">
				<td>演讲示范水平</td>
				<td>使用合理的教学手段，准确讲解和演示，互动效果良好，具有启发性和指导性</td>
			  </tr>
			  <tr style="height:60px;">
				<td>答疑解惑水平</td>
				<td>能够及时、准确的发现问题，对学生进行启发和点拨</td>
			  </tr>
			  <tr style="height:60px;">
				<td>启发创新水平</td>
				<td>在巩固和运用理论知识的基础上，能够开发学生的综合分析和解决问题的能力，指导学生创造性的完成实践活动，努力提高学生的动手能力和创新思维</td>
			  </tr>
			  <tr style="height:80px;">
				<td rowspan="2" height="54">教学效果</td>
				<td colspan="2">符合实践教学目标，工作规范，有适当的独立创新；当学年指导本科生实习得到的学生的认可和好评</td>
				</tr>
			  <tr style="height:80px;">
				<td colspan="2">实习学生感觉收获较大（能够培养学习兴趣，巩固理论知识，提高思维和动手能力）</td>
				</tr>
			  <tr>
				<td style="height:40px;" colspan="3">&nbsp;总评分（满分5分）</td>
			  </tr>

			  
				
					
			  <%
					
					sId=Session("sId")
					response.write("<input type='hidden' name='sId' value='"&sId&"' />")
					if month(date)<6 then 
						currTerm=(year(date)-1)&"-"&year(date)&"-"&"1"
					elseif month(date)>=6 and month(date)<12 then
						currTerm=(year(date)-1)&"-"&year(date)&"-"&"2"
					else 
						currTerm=year(date)&"-"&(year(date)+1)&"-"&"1"
					end if
					set rs=Server.CreateObject("ADODB.recordset")
					sql ="Select name,elective.xkId,teacher,time,address from elective left join course  on sId='"&sId&"' where elective.xkId=course.xkId and Score=0 and course.date='"&currTerm&"'"
					rs.Open sql , Conn
					response.write "<td style='height:40px;' colspan='3'>&nbsp;待评价</td>"
					dim count
					count=0
					do until rs.EOF
					count=count+1
						response.write"<tr>"
						for each x in rs.fields

							if x.name="name" then							   
							   response.write("<td>&nbsp;"&x.value&"&nbsp;</td>")
							   response.write("<td style='height:40px;' colspan='2'>&nbsp;")
							   response.write("<input type='radio' name='radio"&count&"' value='3' /> 3分")
							   response.write("<input type='radio' name='radio"&count&"' value='3.5' /> 3.5分")
							   response.write("<input type='radio' name='radio"&count&"' value='4' /> 4分")
							   response.write("<input type='radio' name='radio"&count&"' value='4.5' /> 4.5分")
							   response.write("<input type='radio' name='radio"&count&"' value='5' /> 5分")
						   end if
						   if x.name="teacher" then
								response.write("<span style='font-size:12px;'>&nbsp;&nbsp;("&x.value&"&nbsp;</span>")
							end if
						   if x.name="time" then
								response.write("<span style='font-size:12px';>&nbsp;"&x.value&"&nbsp;</span>")
							end if
						   if x.name="address" then
								response.write("<span style='font-size:12px;'>&nbsp;"&x.value&")</span>")
							end if
						   if x.name="xkId" then 
								response.write("<input type='hidden' name='rad"&count&"' value='"&x.value&"'>")
								response.write("<input type='hidden' name='radCount' >")
						   end if
						next
						response.write "</td></tr>"
					rs.MoveNext
					Loop
					set rs2=Server.CreateObject("ADODB.recordset")
					sql2 ="Select name,elective.score,teacher,time,address from elective left join course  on sId='"&sId&"' where elective.xkId=course.xkId and score>0 and course.date='"&currTerm&"'"
					rs2.Open sql2 , Conn
					response.write "<tr><td style='height:40px;' colspan='3'>&nbsp;已评价</td></tr>"
					count=0
					do until rs2.EOF
					count=count+1
						response.write"<tr>"
						for each x in rs2.fields

							if x.name="name" then							   
							   response.write("<td>&nbsp;"&x.value&"&nbsp;</td>")
							   response.write("<td style='height:40px;' colspan='2'>&nbsp;")
						   end if
						   if x.name="score" then
								response.write("<span style='font-size:18px;'>&nbsp;&nbsp;已评价："&x.value&"分&nbsp;</span>")
							end if
						   if x.name="teacher" then
								response.write("<span style='font-size:12px;'>&nbsp;&nbsp;("&x.value&"&nbsp;</span>")
							end if
						   if x.name="time" then
								response.write("<span style='font-size:12px';>&nbsp;"&x.value&"&nbsp;</span>")
							end if
						   if x.name="address" then
								response.write("<span style='font-size:12px;'>&nbsp;"&x.value&")</span>")
							end if
						next
						response.write "</td></tr>"
					rs2.MoveNext
					Loop

					
				rs.close
				set rs=nothing
				Conn.close
				set Conn=nothing
			  %>

			</table>
		</form>
		</fieldset>
		
	</div>
    <div style="margin-top: 6px;" id="submit_div">
        <table id="submit_table" style="margin: 0px auto; ">
            
            <tbody><tr>
                <td id="ctl00_ContentPlaceHolder1_JQ1_tdCode" style="display: none;">
                </td>

                <td>
				<script type="text/javascript">

					var radCount =document.getElementsByName("radCount");
					
					var myForm=document.getElementById("myForm");
					window.onload=function(){
						//alert(radCount.length);
						if(radCount.length==0){
							$("#submit_button").css('display','none');
						}
					}
					function send(){
						//myForm.submit();
						var flag=0;
						for(var i=1;i<=radCount.length;i++){
							var tempRadio = document.getElementsByName("radio"+i);
							for(var j=0;j<tempRadio.length;j++){
								if(tempRadio[j].checked){
									flag=flag+1;
									break;
								}
							}
						}
						if(flag!=radCount.length){
							alert('请填写好全部评价');
						}else{
							myForm.submit();
						}

					  }	


				</script>
                    <input  type="button" onclick="send()" style="font-size: 14px; font-weight: bold;" value="提交答卷" id="submit_button"><br><span style="color:red"  id="tip">&nbsp;</span>
                        <span id="spanTest" style="display: none;">
                            &nbsp;&nbsp;<input type="button" style="font-size: 14px; font-weight: bold;" value="试填问卷" id="submittest_button" title=><a title= style="color: green" href="javascript:void(0);"><b>(?)</b></a><span style="color:#ff3300;"></span></span>
                </td>
                <td>
                    
                </td>
                <td align="right">
                    
                </td>
                <td align="right" valign="bottom">
                </td>
                
            </tr>
        </tbody></table>
        <div style="clear:both;"></div>
        
    </div>
   
   
</div>




<div style="clear: both;">
</div>
<div id="divNotRun" style="height:100px; text-align:center; display:none;"></div>

    <div style="clear: both;">
    </div>
    </div>

                    <div id="footerss" style="width: 740px; margin: 0 auto; padding-top:30px;">

                    </div>
                </div>
            </div>
            <div style="clear: both;">
            </div>
        </div>
        <div id="footercss">
            <div id="footerLeft">
            </div>
            <div id="footerCenter">
            </div>
            <div id="footerRight">
            </div>
        </div>
        
        <div style="clear: both; height: 10px;">
        </div>
       
        
        <div style="height: 20px;">
            &nbsp;
		</div>
    </div>
   
   
    <div style="clear:both;"></div>
</body>
</html>
