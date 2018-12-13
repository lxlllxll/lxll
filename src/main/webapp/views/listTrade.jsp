<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'movebooking.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<h4>资金记录查询</h4>
<%--<a id="addBtn" href="/mavenweb2_war_exploded/movebooking/toadd.do">添加</a>--%>
<form action="/aaa/traderecord/listTrade" method="post">
    状态：<select name="btype">
    <option value="0">所有</option>
    <option value="1">充值</option>
    <option value="2">提现</option>
</select><br>
    从<input name="bbegintime" id="begin" type="text"/>到<input name="bendtime" id="end" type="text"/><br>
    <%--联系人：<input name="bname" type="text"/><br>--%>
    <button type="submit">查询</button>
</form>
<table border="1px">
    <tr>
        <td>时间</td>
        <td>交易号</td>
        <td>类型</td>
        <td>金额</td>
        <td>备注</td>
    </tr>
    <c:forEach items="${all}" var="all">
        <tr>
            <td><f:formatDate value="${all.recordtime}" pattern="yyyy-MM-dd hh:mm:SS"/></td>
            <td>${all.recordno}</td>
            <td>${all.tradeId.tradeName}</td>
            <td>${all.recordmoney}</td>
            <td>${all.recordremark}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
