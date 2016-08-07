<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->

<%
username=request("textfield1")
nickname=request("textfield2")
password1=request("textfield3")
password2=request("textfield4")

if username="" then
  response.write "<script>window.alert('用户名不能为空');history.go(-1);</script>"
else 
if nickname="" then
  response.write "<script>window.alert('昵称不能为空');history.go(-1);</script>"
else 
if password1="" then
  response.write "<script>window.alert('密码不能为空');history.go(-1);</script>"
else 

sqla="select * from gameuserinfo where  guaccount='"&username&"'"    
set rsa=conn.execute(sqla)    
if not rsa.eof and not rsa.bof then    
	response.write "<script>window.alert('"&username&"已经注册过了');history.go(-1);</script>"   

else if password1<>password2 then
response.write "<script>window.alert('密码不一致');history.go(-1);</script>"
else
sql="insert into gameuserinfo (guparentuserid,guhighuserid0,guhighuserid1,guhighuserid2,guhighuserid3,guhighuserid4,guaccount,gulevel,gustate,gupasswd,guname,gufaceid,gustatecongealflag,guuserright,gumasterright,gumescore,gumidscore,gulowscore,guoccupancyrate,GUOccupancyRate_NoFlag,GULowOccupancyRate_Max,GULowOccupancyRate_Max_NoFlag,GULowOccupancyRate_Min,GULowOccupancyRate_Min_NoFlag,GUTaxOccupancyRate,GURollbackRate,GUBetLimit,GURegisterTime,GULessUserCount,GUExtend_UserRight,GUExtend_TotalBetScore) values(810,806,807,808,809,810,'"&username&"',5,0,'"&md5(password1)&"','"&nickname&"',0,0,0,0,10000.0000,0.0000,0.0000,0.0000,0,0.0000,0,0.0000,0,0.0000,0.0000,0,112233,0,0,0.0000)"

set rs=conn.execute(sql)

Response.Write "注册成功"
response.write  "-------------<br>"
response.write  "用户名："
response.write username
response.write  "<br>"
response.write  "昵  称："
response.write nickname
response.write  "<br>"
response.write  "密  码："
Response.Write password1
response.write  "<br>"
response.write  "密码MD5："
Response.Write md5(password1)

'**********************************************************
response.write "<br><br>已注册用户如下：<br>"
set rsc=conn.execute("select * from gameuserinfo") 
if not rsc.eof and not rsc.bof then 
do while not rsc.eof 
response.write(rsc("guaccount")) 
response.write "<br>" 
rsc.movenext 
loop 
end if 
rsc.close 
set rsc=nothing 
conn.close 
set conn=nothing 
'************************************************

response.write "<script>window.alert('"&username&"注册成功了');history.go(-1);</script>"

end if
end if

end if
end if
end if

set rs=nothing   
conn.close
set conn=nothing 

%>