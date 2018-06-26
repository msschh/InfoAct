<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="modalActorFilm" class="modal">
	<div class="content" style="width: 30%;">
	
		<div class="header">
			<p align="center">Adaugare actori in filme</p>
		</div>
		
		<div class="body" style="padding-top: 30px; padding-bottom: 40px;">
			
			<c:if test="${screenCode == 'actor'}">
				<input type="hidden" class="a" name="idActor" value="${record.id}" />
				<table class="tblForm">
					<tr>
						<td>Film</td>
						<td>
							<select class="a" name="idFilm" style="width: 235px;">
		           				<option value=""> </option>
		           				<c:forEach var="film" items="${listFilme}">
		           					<option value="${film.id}">${film.nume}</option>
		           				</c:forEach>
		       				</select>				
						</td>
					</tr>
					<tr>
						<td>Personaj</td>
						<td>
							<input type="text" class="a" name="personaj" style="width: 235px;" />		
						</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${screenCode == 'film'}">
				<input type="hidden" class="a" name="idFilm" value="${record.id}" />
				<table class="tblForm">
					<tr>
						<td>Actor</td>
						<td>
							<select class="a" name="idActor" style="width: 185px;">
		           				<option value=""> </option>
		           				<c:forEach var="actor" items="${listActori}">
		           					<option value="${actor.id}">${actor.nume}</option>
		           				</c:forEach>
		       				</select>				
						</td>
					</tr>
					<tr>
						<td>Personaj</td>
						<td>
							<input type="text" class="a" name="personaj" style="width: 185px;" />		
						</td>
					</tr>
				</table>
			</c:if>
		</div>
			
		<div class="footer">
            <div align="right">
                <button type="button" id="btnOk" style="width: 130px;">
                    <img align="left" src="${pageContext.request.contextPath}/img/actions/save.png">
                    <span>&nbsp; Salveaza &nbsp;</span>
                </button>
                <button type="button" id="btnCancel" style="width: 130px;">
                    <img align="left" src="${pageContext.request.contextPath}/img/actions/close.png">
                    <span>&nbsp; Inchide &nbsp;</span>
                </button>
            </div>
		</div>
	</div>

</div>