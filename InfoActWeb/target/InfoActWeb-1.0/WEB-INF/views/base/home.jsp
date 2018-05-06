<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<meta name="decorator" content="decorator-main">
	<style>
		#homeLeft {
			float: left; 
			width: 405px; 
			padding-top: 40px; 
			padding-left: 25px; 
			color: gray;			
		}
		
		#homeLeft p {
			font-style: italic;		
		}

		#homeLeft a {
			text-decoration: underline;		
			color: gray;
		}
		
		#homeLeft h1 {
			font-size: 13pt; 
			font-weight: bold; 
			color: #0070d0; 
			text-align: center; 
			margin-bottom: 7px; 
			font-style: normal;		
		}
		
		#homeLeft h2 {
			font-size: 12pt; 
			color: #0070d0; 
			text-align: center; 
			margin-top: 0;
			margin-bottom: 80px; 
			font-style: normal; 
			font-weight: normal;
		}
		
		#homeLeft h2 a {
			color: #0070d0;
		}
		
		#homeBottom {
			float: left; 
			margin-top: 10px; 
			color: #0070d0; 
			font-style: italic; 
			font-size: 12pt;
			padding-left: 5px;		
		}
		
		#homeBottom a {
			text-decoration: underline;		
		}		
	</style>
</head>

<body>
	<jsp:include page="/WEB-INF/common/title.jsp"/>
	
	<div style="float: left; margin-bottom: 10px;">
	</div>
	
	<div id="homeLeft" style="float: left; width: 405px; padding-top: 40px; padding-left: 25px; border: 0 solid; color: gray;">
	</div>
	
	<div id="homeBottom">
	</div>

</body>

</html>
