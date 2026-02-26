<%@ page import="java.time.LocalTime" %>
<html>
  <body>
    <%
      int hour = LocalTime.now().getHour();
      String name = "Daria";
      if (hour < 12) {
    %>
        <h2>Good morning, <%= name %>, Welcome to COMP367</h2>
    <%
      } else {
    %>
        <h2>Good afternoon, <%= name %>, Welcome to COMP367</h2>
    <%
      }
    %>
  </body>
</html>