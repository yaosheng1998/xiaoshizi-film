<%--
  Created by IntelliJ IDEA.
  User: yaosh
  Date: 2019/11/29
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="net.sf.json.JSON" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.ys.dao.UserDao" %>
<%@ page import="com.ys.dao.FilmDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ys.po.HistoryPO" %>
<%@ page import="java.net.URLDecoder" %>
<%
    response.setContentType("text/html;chatset=utf-8");
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.addHeader("Access-Control-Allow-Origin", "*");
    UserDao ud = new UserDao();
    String username = request.getParameter("username");
    String filmName = request.getParameter("filmName");
    String time = request.getParameter("time");
    ud.addHistory(username, filmName, time);
%>