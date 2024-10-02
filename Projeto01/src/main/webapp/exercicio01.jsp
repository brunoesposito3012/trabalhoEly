<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calculadora</title>
</head>
<body>

<h1>Tabuada</h1>
<%
    for (int i=1; i<=10; i++){
        for (int j=1; j<=10; j++) {
            int resp = i * j;
            out.print("<div>");
            out.print(i + " x " + j + " = " + resp);
            out.print("</div>");
        }
        out.print("<hr/>");
    }
    %>

</body>
</html>