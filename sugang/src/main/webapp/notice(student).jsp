<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<style>

#notice-content{
	margin: 0 auto;
    width: 60%;
    height: auto;
    left: 300px;
}

</style>
<meta charset="UTF-8">
<title>수강신청 메인</title>
</head>
<body>
<jsp:include page="/WEB-INF/submenu(student).jsp"></jsp:include>
	
	<div id="notice-content">
		<p style="text-align: center; font-weight: bold; font-size:30px;">※공지사항※</p>
		<hr>
		<p style="marfin-top: 2em; float: left; text-align: left; font-size:20px;">
◆  신편입생은 학번부여를 하였으므로, 학교 홈페이지에서 학번 조회를 하시고, 학번으로 로그인하시기 바랍니다.<br>
◆  수강신청확인서, 시간표조회출력, 강의계획서 조회메뉴는 리포트출력의 구조적인 처리 지연문제로 조회가 가중되는 경우 시스템장애가 발생하는 주원인이 되고 있어, 부득이 출력기능을 제공하지 않으니 이점 양해바랍니다.<br>
◆  복학생은 통합정보시스템에서 복학신청을 하셔야 수강신청대상자가 되며, 로그인 및 수강신청이 가능합니다.<br>
◆  전학년 수강정정 : 2017.9.1.(금) 09:00 ~ 9.8.(금) 20:00 (토/일 제외)<br> 
<br>
★ 수강신청 저장 시 멀티로그인 여부를 체크하여, 먼저 로그인한 페이지의 경우 수강저장 시 로그아웃 처리됩니다. 수강신청시스템과 모바일 수강신청을 동시에 사용하실 수 없으니, 유의하시기 바랍니다.<br>
★ 수강신청 시 매크로 사용을 금지하여 주시기 바랍니다. 매크로 사용자는 학사지원과 학과로 통보조치 하겠습니다.
		</p>
	</div>
	
	
</body>
</html>