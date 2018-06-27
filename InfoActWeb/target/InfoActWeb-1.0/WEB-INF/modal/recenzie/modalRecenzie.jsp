<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="modalRecenzie" class="modal">

    <div class="content" style="width: 450px;">
    
        <div class="header">
            <p align="center">Recenzie</p>
        </div>
        
        <div class="body" style="text-align: center;">
        
			<input type="hidden" class="a" name="film.id" value="${record.id}">
			<input type="hidden" class="a" name="user.id" value="${sessionScope.utilizator.id}">
            
            <br>
			<table class="tblForm">
				<tr>
					<td>Nota</td>
					<td>
						<input type="text" class="a" name="nota"> &nbsp;/&nbsp;10			
					</td>
				</tr>
				<tr>
					<td>Continut</td>
					<td></td>
				</tr>
			</table>
			<textarea class="a" name="text" style="width: 410px; height: 150px; margin-top:5px;"></textarea>
            
        </div>
        
        <div class="footer">
            <div align="right">
                <button type="button" id="btnOk" style="width: 120px;">
                    <img align="left" src="${pageContext.request.contextPath}/img/actions/save.png">
                    <span>&nbsp; Salveaza &nbsp;</span>
                </button>
                <button type="button" id="btnCancel" style="width: 120px;">
                    <img align="left" src="${pageContext.request.contextPath}/img/actions/close.png">
                    <span>&nbsp; Inchide &nbsp;</span>
                </button>
            </div>
		</div>
    </div>
</div>