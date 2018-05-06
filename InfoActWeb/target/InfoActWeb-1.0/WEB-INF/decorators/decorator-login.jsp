<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<html>
	<head>
		<title>${screenTitle}</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/diverse/favicon.png" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/core/body.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/core/login.css">		
	</head>

	<body>
		<div id="divContainer">
			
			<div id="divHeader">
				<div style="width: 100px; float: left; padding-left: 8px;">
					<img src="${pageContext.request.contextPath}/img/diverse/movie32.png">
				</div>
				<div style="float: left; border: solid 0px black; font-family: sans-serif; font-size: 20pt;">
					InfoAct
				</div>			
			</div>
			
			<div id="divImage">
				<img src="${pageContext.request.contextPath}/img/diverse/padlock.png" height="180">
			</div>
			
			<div id="divBody"><decorator:body /></div>
			
		</div>
		
		<div id="divFootnote"><jsp:include page="/WEB-INF/common/footnote.jsp"/></div>
	</body>

</html>