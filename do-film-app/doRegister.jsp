<%--
  Created by IntelliJ IDEA.
  User: yaosh
  Date: 2019/11/26
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="net.sf.json.JSON" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.ys.dao.UserDao" %>
<%@ page import="com.ys.po.UserPO" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.addHeader("Access-Control-Allow-Origin", "*");
    UserDao ud = new UserDao();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String repeat = request.getParameter("repeat");
    int avatarID = Integer.parseInt(request.getParameter("avatarID"));
    JSONObject jsonObject = new JSONObject();
    if(password.equals(repeat)){
        if(ud.register(username, password, avatarID)){
            jsonObject.put("status", "success");
            jsonObject.put("msg", "注册成功!");
        }else{
            jsonObject.put("status", "error");
            jsonObject.put("msg", "用户名已存在!");
        }
    }else{
        jsonObject.put("status", "error");
        jsonObject.put("msg", "密码重复错误!");
    }
    out.print(jsonObject);
%>
