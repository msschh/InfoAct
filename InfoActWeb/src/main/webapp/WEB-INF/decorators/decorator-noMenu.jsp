<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/core/menu.js"></script>		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/core/navigation.js"></script>			
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/core/grid.js"></script>	
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/core/tabs.js"></script>
		
		<decorator:head/>	
	</head>

	<body>

		<div id="divContainer">

			<div id="divHeader"><jsp:include page="/WEB-INF/common/header.jsp"/></div>
			<div id="divBody"><decorator:body /></div>
			<div id="divFooter"><jsp:include page="/WEB-INF/common/footer.jsp"/></div>

		</div>
		
		<div id="divFootnote">
			<jsp:include page="/WEB-INF/common/footnote.jsp"/>
		</div>

	</body>

</html>