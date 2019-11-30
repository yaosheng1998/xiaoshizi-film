<%--
  Created by IntelliJ IDEA.
  User: yaosh
  Date: 2019/11/29
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="net.sf.json.JSON" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.ys.dao.UserDao" %>
<%@ page import="com.ys.po.UserPO" %>
<%@ page import="com.ys.dao.FilmDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ys.po.FilmPO" %>
<%@ page import="java.util.ArrayList" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.addHeader("Access-Control-Allow-Origin", "*");
    FilmDao fd = new FilmDao();
    List<FilmPO> list = new ArrayList<FilmPO>();
    String type = request.getParameter("type");
    list = fd.findFilm(type);
    JSONObject jsonObject = new JSONObject();
    JSONArray jsonArray = new JSONArray();
    for(int i=0;i<list.size();i++){
        jsonArray.add(list.get(i));
    }
    out.print(jsonArray);


%>
