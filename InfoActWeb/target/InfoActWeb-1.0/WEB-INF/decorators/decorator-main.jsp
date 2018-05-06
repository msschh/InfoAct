<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>${screenTitle}</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/diverse/favicon.png" />
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/jquery-ui/jquery-ui.min.css">
	    
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/body.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/layout.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/menu.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/screen-layout.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/grid/grid.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/tabs.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/modal.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/core/jquery-1.11.3.min.js"></script>	
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/core/jquery-ui-1.12.1.min.js"></script>	
		
		<script>
			$( function() {
				$( ".datepicker" ).datepicker({dateFormat: 'dd.mm.yy'});
			} );
		</script>

    	<script src="${pageContext.request.contextPath}/js/core/app.js"></script>        
    	<script src="${pageContext.request.contextPath}/js/core/browser.js"></script>        
    	<script src="${pageContext.request.contextPath}/js/core/ModalScreen.js"></script>   
    	<script src="${pageContext.request.contextPath}/js/core/Autocomplete.js"></script>   
    	
		<script src="${pageContext.request.contextPath}/js/core/navigation.js"></script>			
		<script src="${pageContext.request.contextPath}/js/core/grid.js"></script>	
		<script src="${pageContext.request.contextPath}/js/core/tabs.js"></script>
		<script src="${pageContext.request.contextPath}/js/core/menu.js"></script>
		
		<decorator:head/>
	</head>

	<body>

		<div id="divContainer">

			<div id="divHeader"><jsp:include page="/WEB-INF/common/header.jsp"/></div>	
			
			<div id="divMenubar">
				<c:if test="${sessionScope.utilizator != null}">
					<jsp:include page="/WEB-INF/common/menubar.jsp"/>
				</c:if>
				<c:if test="${sessionScope.utilizator == null}">
					<jsp:include page="/WEB-INF/common/menubar.jsp"/>
				</c:if>
			</div>
			
			<div id="divBody"><decorator:body /></div>
			<div id="divFooter"><jsp:include page="/WEB-INF/common/footer.jsp"/></div>

		</div>
		
		<div id="divFootnote">
			<jsp:include page="/WEB-INF/common/footnote.jsp"/>
		</div>

	</body>

</html>