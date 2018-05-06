<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="divPager">
	<table style="width: 100%">
	<tr>
		<td style="color: gray;">
			Nr. înregistrari :
			<span style="color: #0070d0; font-weight: bold;">${pager.recordCount}</span> 
		</td>
		<td align="center"> 
			<a href="#" onclick="changePage(1);">&laquo;</a> &nbsp;	
			<c:forEach var="pageNo" items="${pager.visiblePages}">
				<c:if test="${pager.pageNo == pageNo}">
					<a href="#" onclick="changePage(${pageNo});" style="font-size: 15pt;">${pageNo}</a> 
				</c:if>
				<c:if test="${pager.pageNo != pageNo}">
					<a href="#" onclick="changePage(${pageNo});">${pageNo}</a>
				</c:if>
				&nbsp;
			</c:forEach>
			<a href="#" onclick="changePage(${pager.pageCount});">&raquo;</a>
		</td>
		<td align="right" style="color: gray;">
			Pag. curentă : 
			<span style="color: #0070d0;">${pager.pageNo}</span> 
			din  
			<span style="color: #0070d0;">${pager.pageCount}</span>
		</td>
	
	</tr>	
	</table>
	
</div>
