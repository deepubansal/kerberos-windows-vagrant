<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Hello SPNEGO Example</title>
</head>
<body>
Hello <%= request.getRemoteUser() %> !

<p> Authorization Header: <br/> <b> <%= request.getHeader("Authorization") %></b>
</p>

Principal Name:  <%= request.getUserPrincipal().getName() %>
</body>
</html>