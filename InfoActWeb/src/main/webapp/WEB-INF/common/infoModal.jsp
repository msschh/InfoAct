<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="infoModal" class="modal">
    
    <div class="content" style="width: 400px;">
        <div class="header">
            <p align="center">Mesaj</p>
        </div>
        <div class="body">

		<br>
		
		<div style="margin: 10px 30px 10px 30px;">
			<p align="center" style="color: #0070d0; font-weight: bold;" id="textContent"></p>
		</div>
			
        </div>
        <div class="footer">
            <div align="right">
                <button type="button" id="close" style="width: 130px;">
                    <img align="left" src="${pageContext.request.contextPath}/img/actions/close.png">
                    <span>&nbsp; Inchide &nbsp;</span>
                </button>
            </div>
		</div>
    </div>
</div>