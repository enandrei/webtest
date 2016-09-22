<html>
<body>
<h2>Hello from test app !</h2>
<%
java.util.Properties prop = new java.util.Properties();
prop.load(getServletContext().getResourceAsStream("/META-INF/MANIFEST.MF"));
out.println("Development-Version: " + prop.getProperty("Development-Version"));
out.println("<BR></BR>");
out.println("Build-Version: " + prop.getProperty("Build-Version"));
%>
</body>
</html>
