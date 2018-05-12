<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="/WEB-INF/common/err.jsp"/>

<div id="tabHeader">
    <button type="button" id="th-general" onclick="openTab(this, 'tab-general')">Date generale</button>
    <button type="button" id="th-drepturi" onclick="openTab(this, 'tab-drepturi')">Drepturi</button>
    <button type="button" id="th-memo" onclick="openTab(this, 'tab-memo')">Observații</button>
</div>

<div>

	<div id="tab-general" class="tab">
	    <table class="tblForm">
	        <tr>
	            <td>Cod</td>
	            <td>
	                <c:if test="${ss.view}"><input type="text" value="${record.cod}" disabled></c:if>
	                <c:if test="${ss.editable}"><form:input path="cod" cssErrorClass="err"/></c:if>
	            </td>
	        </tr>
	
	        <tr>
	            <td>Nume</td>
	            <td>
		            <c:if test="${ss.view}">
		                <input type="text" value="${record.nume}" disabled>
		            </c:if>
		            <c:if test="${ss.editable}">
						<form:input path="nume" cssErrorClass="err"/>
		            </c:if></td>
	        </tr>
	
	    </table>
	</div>

	<div id="tab-drepturi" class="tab">
		<div id="divDrepturi">
			<p>Admin</p>
			<ul style="list-style: none;">
			    <li>
			        <span>Utilizator</span>
			        <div class="drepturiHidden">
						<ul>
							<c:forEach var="dreptCurent" items="${listDreptCurent}">
								<c:if test="${dreptCurent.drept.entitate == 'utilizator'}">
									<li>
										<c:if test="${ss.view}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" checked disabled>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" disabled>
								            </c:if>
							            </c:if>
							            <c:if test="${ss.add}">
							            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
							            </c:if>
										<c:if test="${ss.edit}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}" checked>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
								            </c:if>
							            </c:if>
						            	<label>${dreptCurent.drept.descriere} (${dreptCurent.drept.cod})</label>
						          	</li>
								</c:if>
	                  	 	</c:forEach>
			        	</ul>
			        </div>
			    </li>
			    <li>
			        <span>Rol</span>
			        <div class="drepturiHidden">
						<ul>
							<c:forEach var="dreptCurent" items="${listDreptCurent}">
								<c:if test="${dreptCurent.drept.entitate == 'rol'}">
									<li>
										<c:if test="${ss.view}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" checked disabled>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" disabled>
								            </c:if>
							            </c:if>
							            <c:if test="${ss.add}">
							            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
							            </c:if>
										<c:if test="${ss.edit}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}" checked>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
								            </c:if>
							            </c:if>
						            	<label>${dreptCurent.drept.descriere} (${dreptCurent.drept.cod})</label>
						          	</li>
								</c:if>
	                  	 	</c:forEach>
			        	</ul>
			        </div>
			    </li>
			</ul>
			
			<p>Base</p>
			<ul style="list-style: none;">
			    <li>
			        <span>Atasament</span>
			        <div class="drepturiHidden">
						<ul>
							<c:forEach var="dreptCurent" items="${listDreptCurent}">
								<c:if test="${dreptCurent.drept.entitate == 'atasament'}">
									<li>
										<c:if test="${ss.view}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" checked disabled>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" disabled>
								            </c:if>
							            </c:if>
							            <c:if test="${ss.add}">
							            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
							            </c:if>
										<c:if test="${ss.edit}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}" checked>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
								            </c:if>
							            </c:if>
						            	<label>${dreptCurent.drept.descriere} (${dreptCurent.drept.cod})</label>
						          	</li>
								</c:if>
	                  	 	</c:forEach>
			        	</ul>
			        </div>
			    </li>
			</ul>
			
			<p>Industrie film</p>
			<ul style="list-style: none;">
			    <li>
			        <span>Film</span>
			        <div class="drepturiHidden">
						<ul>
							<c:forEach var="dreptCurent" items="${listDreptCurent}">
								<c:if test="${dreptCurent.drept.entitate == 'film'}">
									<li>
										<c:if test="${ss.view}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" checked disabled>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" disabled>
								            </c:if>
							            </c:if>
							            <c:if test="${ss.add}">
							            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
							            </c:if>
										<c:if test="${ss.edit}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}" checked>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
								            </c:if>
							            </c:if>
						            	<label>${dreptCurent.drept.descriere} (${dreptCurent.drept.cod})</label>
						          	</li>
								</c:if>
	                  	 	</c:forEach>
			        	</ul>
			        </div>
			    </li>
			    <li>
			        <span>Actor</span>
			        <div class="drepturiHidden">
						<ul>
							<c:forEach var="dreptCurent" items="${listDreptCurent}">
								<c:if test="${dreptCurent.drept.entitate == 'actor'}">
									<li>
										<c:if test="${ss.view}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" checked disabled>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" disabled>
								            </c:if>
							            </c:if>
							            <c:if test="${ss.add}">
							            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
							            </c:if>
										<c:if test="${ss.edit}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}" checked>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
								            </c:if>
							            </c:if>
						            	<label>${dreptCurent.drept.descriere} (${dreptCurent.drept.cod})</label>
						          	</li>
								</c:if>
	                  	 	</c:forEach>
			        	</ul>
			        </div>
			    </li>
			    <li>
			        <span>Recenzie</span>
			        <div class="drepturiHidden">
						<ul>
							<c:forEach var="dreptCurent" items="${listDreptCurent}">
								<c:if test="${dreptCurent.drept.entitate == 'recenzie'}">
									<li>
										<c:if test="${ss.view}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" checked disabled>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" value="${dreptCurent.drept.descriere}" disabled>
								            </c:if>
							            </c:if>
							            <c:if test="${ss.add}">
							            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
							            </c:if>
										<c:if test="${ss.edit}">
											<c:if test="${dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}" checked>
								            </c:if>
											<c:if test="${! dreptCurent.allowed}">
								            	<input type="checkbox" name="drepturiAlese" value="${dreptCurent.drept.id}">
								            </c:if>
							            </c:if>
						            	<label>${dreptCurent.drept.descriere} (${dreptCurent.drept.cod})</label>
						          	</li>
								</c:if>
	                  	 	</c:forEach>
			        	</ul>
			        </div>
			    </li>
			</ul>
		</div>
	</div>


	<div id="tab-memo" class="tab">
		<c:if test="${ss.editable}">
		    <form:textarea path="memo" style="width: 100%; height: 300px;"/>
		</c:if>
		<c:if test="${ss.view}">
		    <textarea disabled style="width: 100%; height: 300px; resize: none;">${record.memo}</textarea>
		</c:if>
	</div>
</div>