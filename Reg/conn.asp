<%
set conn=Server.CreateObject("AdoDB.Connection")
connStr="PROVIDER=MSDASQL;DRIVER={SQL Server};SERVER=127.0.0.1,1433;DataBase=GServerInfo;uid=sa;pwd=123456"
conn.open connStr
%>