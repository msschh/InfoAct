<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="divFilter" style="height: 35px;">
	<div style="float: left; width: 180px;">
		<table>
			<tr>
				<td>Nume</td>
				<td><input type="text" name="nume" value="${filter.nume}" style="width: 120px;"></td>
			</tr>
		</table>
	</div>
	
	<div style="float: left; width: 210px;">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" value="${filter.username}" style="width: 120px;"></td>	
			</tr>
		</table>
	</div>
	
	<div style="float: left; width: 170px;">
		<table>
			<tr>
				<td>Rol</td>
				<td>
					<select name="rol.id" style="width: 120px;">
						<option value="" label=" " />
						<c:forEach var="rol" items="${listRol}">
							<option value="${rol.id}">${rol.nume}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	</div>
</div>