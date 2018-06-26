<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${ss.add}">
	<form:form id="frmDetails" method="POST" modelAttribute="record" enctype="multipart/form-data" accept-charset="UTF-8">
		<input type="file" id="uploadFile" name="filecontent" onchange="atasament.onUpload();" style="display: none;">
		<input type="hidden" id="txtTipFisier" name="tipFisier">
	</form:form>
	
	<div style="margin-left: 35%; margin-bottom: 50px; margin-top: 30px;">
		<button type="button" onclick="atasament.upload();" style="margin-right: 20px;">
			<img title="Upload" src="${pageContext.request.contextPath}/img/actions/attach.png">
			<br>Încarcă imaginea
		</button>
		<button title="Salvare" type="submit" form="frmDetails" formaction="create">
			<img src="${pageContext.request.contextPath}/img/actions/search3.png">
			<br>Caută actorul
		</button>
	</div>
	
	
	<p style="color: #e42121; font-size: 18px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Imaginea introdusă trebuie să aibă unul dintre următoarele formate: <b>jpg</b>, <b>jpeg</b>, 
		<b>png</b>.
	</p>
	<p style="font-family: sans-serif; color: #306daa; font-size: 18px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Pentru recunoașterea actorilor din imagine algoritmul nostru a folosește un model format dintr-o 
		rețea convoluțională preantrenată și un clasificator SVM antrenat pe un total de aproximativ 10700
		imagini. Acesta este capabil să recunoască actorii aflați în baza de date cu o acuratețe de 99,70%
		dacă imaginea conține o singură persoană. În viitor ne dorim să creștem dimensiunea bazei de date și
		să dăm posibilitatea sistemului de a recunoaște mai mulți actori dintr-o imagine, cât și
		de a spune dacă o anumită persoană nu se află în baza de date.
	</p>
</c:if>

<c:if test="${ss.view}">
	<table style="border: none; table-layout: fixed; width: 100%; margin-top: 30px;">
		<tr>
			<td align="center" style="padding-bottom: 30px;">
				<p style="font-family: sans-serif; color: #306daa; font-size: 18px;">
					Imaginea introdusă:
				</p>
			</td>
			<td align="center" style="padding-bottom: 30px;">
				<p style="font-family: sans-serif; color: #306daa; font-size: 18px;">
					Actorul prezis:
				</p>
			</td>
		</tr>
		<tr>
			<td align="center">
				<img src="${pageContext.request.contextPath}/img-test/${urlImgInitiala}"
					style="max-width: 100%; max-height: 320px;">
			</td>
			<td align="center">
				<c:if test="${empty actorPrezis}">
					<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
						height="320" width="215">
				</c:if>
				<c:if test="${not empty actorPrezis}">
					<img src="${pageContext.request.contextPath}/img/atasamente/${actorPrezis.document.id}/${actorPrezis.poza.url}"
						height="320" width="215">
				</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${not empty actorPrezis}">
		<p style="color: #306daa; font-size: 28px; margin-left: 23%;">
			Actorul prezis este <a href="${pageContext.request.contextPath}/mvc/actor/view?id=${actorPrezis.id}"><b>${actorPrezis.nume}</b></a>.
		</p>
	</c:if>
	<c:if test="${empty actorPrezis}">
		<p style="color: #e42121; font-size: 18px; margin-left: 20%;">
			<b>În imaginea introdusă trebuie să apară o sigură persoană!</b>
		</p>
	</c:if>
</c:if>