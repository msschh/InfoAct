<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<img title="view" style="cursor: pointer;" src="${pageContext.request.contextPath}/img/actions/view.png" onclick="window.location='view?id=${param.id}';"> &nbsp;
<img title="edit" style="cursor: pointer;" src="${pageContext.request.contextPath}/img/actions/edit.png" onclick="window.location='edit?id=${param.id}';"> &nbsp;
<img title="delete" style="cursor: pointer;" src="${pageContext.request.contextPath}/img/actions/delete.png" onclick="jQueryDeleteModal('delete', ${param.id})">
