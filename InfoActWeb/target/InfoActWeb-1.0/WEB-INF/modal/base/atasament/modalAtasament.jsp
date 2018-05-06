<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="modalAtasament" class="modal">

    <div class="content" style="width: 550px;">
        
        <div class="header">
            <p align="center">Adaugă atasament nou</p>
        </div>
        
        <div class="body">

            <form:form id="frmAtasament" method="POST" modelAttribute="atasament" enctype="multipart/form-data">
                <form:hidden path="document.id" value="${record.document.id}" />
                <form:hidden path="tipFisier" id="txtTipFisier" />
                <input type="hidden" name="screenCode" value="${screenCode}">
                <input type="hidden" name="parentRecordId" value="${record.id}">
				<table class="tblForm" style="margin: 50px 0 40px 40px;">
					<tr>
						<td>Titlu</td>
						<td>
							<input type="text" id="txtTitlu" disabled style="width: 350px;">                        
						</td>
					</tr>
				</table>
				<input type="file" id="uploadFile" name="filecontent" onchange="atasament.onUpload();" style="display: none;">
            </form:form>
        </div>
        
        <div class="footer">
            <div align="right">
				<button type="button" style="width: 140px;" onclick="$('#uploadFile').click();">
					<img align="left" src="${pageContext.request.contextPath}/img/actions/dir.png">
					<span>&nbsp; Incarca&nbsp;fisier &nbsp;</span>
				</button>
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