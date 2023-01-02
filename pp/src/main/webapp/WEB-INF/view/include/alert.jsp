<%@ page contentType="text/html; charset=utf-8" %>
<%
String code = (String)request.getAttribute("code");
String message = (String)request.getAttribute("message");
String url = (String)request.getAttribute("url");
String target = (String)request.getAttribute("target");
String frmId = (String)request.getAttribute("frmId");
%>

<% if ("alertMessageBack".equals(code)) { %>
<script>
	alert("<%=message%>");
	history.back();
</script>
<% } else if ("alertMessageUrl".equals(code)) { %>
<script>
	alert("<%=message%>");
	location.href="<%=url%>";
</script>
<% } else if ("alertMessageUrlClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	location.href="<%=url%>";
	window.close();
</script>
<% } else if ("alertMessageClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	window.close();
</script>
<% } else if ("alertMessageTargetUrlClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	<%=target%>.location.href='<%=url%>';
	window.close();	
</script>
<% } else if ("alertMessageTargetReloadClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	<%=target%>.location.href='<%=url%>';
	window.reload();
</script>
<% } else if ("alertMessageLoginIframeClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	parent.delTabForChild('member_write');
</script>
<% } else if ("alertMessageLogout".equals(code)) { %>
<script>
	alert("<%=message%>");
	parent.location.href='/index.do';
</script>
<% } else if ("alertMessageIframeClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	parent.delTabForChild('<%=frmId%>');
</script>
<% } %>