<%--
  Created by IntelliJ IDEA.
  User: yaosh
  Date: 2019/11/24
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="net.sf.json.JSON" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JsonConfig" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    HashMap<String, Object> map = new HashMap<String, Object>();
    Gson gson = new Gson();
    map.put("name", "3");
    String str = gson.toJson(map);
    out.print(str);

//    JSONObject jsonObject = JSONObject.fromObject(map);
//    out.print(jsonObject);
//    JSONObject jsobj = new JSONObject();
//    jsobj.put("id", "1");
//    jsobj.put("name", "ys");
//    out.print(jsobj);
    String username = request.getParameter("username");
    String password = request.getParameter("password");
//    JSONArray jsonArray = new JSONArray();
//    JSONObject jsonObject = new JSONObject();
//    jsonArray.add(0, "30");
//    jsonObject.put("status", jsonArray);
//    out.print(jsonObject);


%>