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
    UserPO po = ud.login(username, password);
    JSONObject jsonObject = new JSONObject();
    if(po != null){
        jsonObject.put("status", "success");
        jsonObject.put("msg", "登录成功!");
        jsonObject.put("avatorID", po.getAvatarID());
    }else{
        jsonObject.put("status", "error");
        jsonObject.put("msg", "账号或密码错误!");
    }
    out.print(jsonObject);
%>
