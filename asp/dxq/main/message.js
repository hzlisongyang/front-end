function getXmlHttp(){var a;try{a=new ActiveXObject("Msxml2.XMLHTTP");}catch(b){try{a=new ActiveXObject("Microsoft.XMLHTTP");}catch(b){try{a=new XMLHttpRequest();}catch(b){}}}return a;}function getExpDate(d,a,c){var b=new Date();if(typeof(d)=="number"&&typeof(a)=="number"&&typeof(a)=="number"){b.setDate(b.getDate()+parseInt(d));b.setHours(b.getHours()+parseInt(a));b.setMinutes(b.getMinutes()+parseInt(c));return b.toGMTString();}}function getCookieVal(b){var a=document.cookie.indexOf(";",b);if(a==-1){a=document.cookie.length;}return unescape(document.cookie.substring(b,a));}function getCookie(d){var b=d+"=";var f=b.length;var a=document.cookie.length;var e=0;while(e<a){var c=e+f;if(document.cookie.substring(e,c)==b){return getCookieVal(c);}e=document.cookie.indexOf(" ",e)+1;if(e==0){break;}}return"";}function setCookie(b,d,a,f,c,e){document.cookie=b+"="+escape(d)+((a)?"; expires="+a:"")+((f)?"; path="+f:"")+((c)?"; domain="+c:"")+((e)?"; secure":"");}var divSide=document.getElementById("rbbox");function showBox(){divSide.style.height=divSide.clientHeight+2+"px";var a=Math.max(divSide.offsetHeight,divSide.clientHeight,divSide.scrollHeight);if(divSide.clientHeight<a){setTimeout(function(){showBox();},5);}else{mm();}}function closeBox(a){divSide.style.display="none";if(a){setMessageCookie(2);setMessageCookie(3);setMessageCookie(4);setMessageCookie(5);}}function setMessageCookie(a){if(a==2&&msgCount!="0"){setCookieDefault("leavemessage",msgCount);}else{if(a==3&&msgInviteCount!="0"){setCookieDefault("invitemessage",msgInviteCount);}else{if(a==4&&sysMsg!=""){setCookieDefault("systemmessage",sysMsg);}else{if(a==5&&promoteMsg!=""){setCookieDefault("promotemessage",promoteMsg);}}}}}function setCookieDefault(a,c){var b=window.location.host||"sojump.com";setCookie(a,c,null,"/",b,null);}setTimeout(GetMessage,1000);var msgCount="0";var msgInviteCount="0";var sysMsg="";var promoteMsg="";function GetMessage(){var a=getXmlHttp();a.onreadystatechange=function(){if(a.readyState==4){if(a.status==200){var p=a.responseText;if(p==""){setCookieDefault("systemmessage","");setCookieDefault("promotemessage","");setCookieDefault("leavemessage","0");setCookieDefault("invitemessage","0");return;}divSide.innerHTML=p;var o=getCookie("leavemessage");var b=getCookie("systemmessage");var c=getCookie("promotemessage");var n=getCookie("invitemessage");var d=document.getElementById("lblLeaveCount");var g=document.getElementById("lblInviteCount");var e=document.getElementById("lblSystemMsg");if(e&&b!=e.innerHTML){sysMsg=e.innerHTML;divSide.style.display="";}else{if(e){document.getElementById("trSystemMsg").style.display="none";}else{setCookieDefault("systemmessage","");}}var h=document.getElementById("lblPromoteMsg");if(h&&c!="ssssss12312313qq1"){promoteMsg="ssssss12312313qq1";divSide.style.display="";}else{if(h){document.getElementById("trPromoteMsg").style.display="none";}}if(d&&o!=d.innerHTML){msgCount=d.innerHTML;divSide.style.display="";}else{if(d){document.getElementById("trLeaveMsg").style.display="none";}else{setCookieDefault("leavemessage","0");}}if(g&&n!=g.innerHTML){msgInviteCount=g.innerHTML;divSide.style.display="";}else{if(g){document.getElementById("trInviteMsg").style.display="none";}else{setCookieDefault("invitemessage","0");}}if((o<msgCount&&msgCount!="0")||(n<msgInviteCount&&msgInviteCount!="0")||(b!=sysMsg&&sysMsg!="")||(c!=promoteMsg&&promoteMsg!="")){divSide.style.display="";showBox();setTimeout("closeBox()",20000);}else{if(window.Search_Keyword){var f=window.location.href.toLowerCase().indexOf("/jq/")>-1;var l=Search_Keyword.replace("调查","").replace("问卷","").replace("表","").replace("报告","");if(!l){return;}var k=document.getElementById("tdSearch");k.parentNode.parentNode.style.width="330px";var i=encodeURIComponent(l);var m="<div style='width:300px;padding:2px 5px;text-align:left;margin:15px 0 5px; font-size:14px;'>";if(f&&window.allowViewStat){m+="<div style='margin-bottom:20px;'><img src='/images/wjx/index/rightTineliang.gif' alt=''/>&nbsp;<a  class='link-UF30' href='/viewstat/"+activityId+".aspx?wd="+i+"'>查看此问卷调查报告</a></div>";}var j="";if(!f){j="&sort=1&jt=50&qc=";}m+="<div style='margin-bottom:15px;'><img src='/images/wjx/index/rightTineliang.gif' alt=''/>&nbsp;<a href='/publicsurveys.aspx?keyword="+i+j+"' class='link-06f'><span style='color:red;cursor:pointer;'>搜索更多</span>关于<<b>"+l+"</b>>的问卷</a></div>";if(window.allowCopy){m+="<div style='margin-bottom:8px;'><img src='/images/wjx/index/rightTineliang.gif' alt=''/>&nbsp;<a href='javascript:void(0);' class='link-06f' onclick=\"PDF_launch('/wjx/collect.aspx?activity="+activityId+"',500,120);\">以此问卷为模板<span style='color:red;cursor:pointer;'>创建您自己的问卷</span></a></div>";}else{m+="<div style='margin-bottom:20px;'><img src='/images/wjx/index/rightTineliang.gif' alt=''/>&nbsp;<a  class='link-06f' href='/wjx/join/tiyan.aspx?keyword="+i+"'>创建您自己的问卷</a></div>";}m+="</div>";k.innerHTML=m;divSide.style.display="";showBox();setTimeout("closeBox()",60000);}else{divSide.style.display="none";}return;}}}};a.open("get","/Modules/wjx/MessagePromote.aspx?needpromote="+needPromote+"&t="+(new Date()).valueOf());a.send(null);}var timer;window.onresize=window.onscroll=function(){clearTimeout(timer);timer=setTimeout(mm,2);};function mm(){var d;var a=document.documentElement.clientHeight||document.body.clientHeight;var c=document.documentElement.scrollTop||document.body.scrollTop;var b=Math.max(divSide.offsetHeight,divSide.clientHeight,divSide.scrollHeight);divSide.style.top=a+c-b+"px";}document.execCommand("BackgroundImageCache",false,true);