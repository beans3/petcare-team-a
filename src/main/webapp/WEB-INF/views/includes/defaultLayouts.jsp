<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<tiles:insertAttribute name="head" />
	</head>
    <body>
    	<div class="page_loader"></div>
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="nav" />
		<tiles:insertAttribute name="content" />
		<tiles:insertAttribute name="footer" />

		<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/js/bootstrap-submenu.js"></script>
		<script type="text/javascript" src="/resources/js/rangeslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.mb.YTPlayer.js"></script>
		<script type="text/javascript" src="/resources/js/wow.min.js"></script>
		<script type="text/javascript" src="/resources/js/bootstrap-select.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.scrollUp.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script type="text/javascript" src="/resources/js/leaflet.js"></script>
		<script type="text/javascript" src="/resources/js/leaflet-providers.js"></script>
		<script type="text/javascript" src="/resources/js/leaflet.markercluster.js"></script>
		<script type="text/javascript" src="/resources/js/dropzone.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.filterizr.js"></script>
		<script type="text/javascript" src="/resources/js/maps.js"></script>
		<script type="text/javascript" src="/resources/js/app.js"></script>   		

		<!-- jquery -->
		<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
	</body>
</html>