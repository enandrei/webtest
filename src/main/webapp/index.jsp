<html>
<body>
<h2>Hello from test app !</h2>
<%
java.util.Properties prop = new java.util.Properties();
prop.load(getServletContext().getResourceAsStream("/META-INF/MANIFEST.MF"));
out.println("<h2>Development-Version: " + prop.getProperty("Development-Version") + "</h2>");
out.println("<h2>Build-Version: " + prop.getProperty("Build-Version") + "</h2>");
%>
</body>
</html>
