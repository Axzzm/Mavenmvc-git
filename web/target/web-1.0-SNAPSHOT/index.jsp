<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/8 0008
  Time: 上午 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"> </c:set>
<html>
  <head>
    <script type="text/javascript" src="${ctx}/js/jquery-1.11.0.js"></script>
    <title>登录</title>
  </head>
  <body>
  <form action="${ctx}/user/login.action" method="post" id="login">
    账号:<input type="text" name="username" id="username"/><br>
    密码:<input type="password" name="password" id="password"/><br>
    <input type="submit" value="登录" id="submit"/><br>
    <span id="loginPd" style="color: red"></span><br>
    <input type="hidden" id="show" value="查看"/>
    <table class="layui-hide" id="test">
    </table>
  </form>
  </body>
</html>
