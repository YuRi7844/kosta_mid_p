<%@ page contentType="text/html;charset=utf-8"%>
<script type="text/javascript">
	function removeEnrollment(value) {
		left1 = (screen.availWidth - 500) / 2;
		top1 = (screen.availHeight - 200) / 2;
		var address = "/sugang/removeEnrollmentbySubject?removeSubjectId="+ value; //doGet()방식으로 요청
		window.open(address, "newWin", 'width=500 ,height=200 ,top=' + top1 + ',left=' + left1 + ',resizable=no');
	}
	function getSubjectList(value) {
		left1 = (screen.availWidth - 500) / 2;
		top1 = (screen.availHeight - 200) / 2;
		var address = "/sugang/getSubjectList?addSubjectId=" + value;
		window.open(address, "newWin", 'width=500 ,height=200 ,top=' + top1 + ',left=' + left1 + ',resizable=no');
	}
	function getSubjectById(value) {
		left1 = (screen.availWidth - 500) / 2;
		top1 = (screen.availHeight - 200) / 2;
		var address = "/sugang/findSubjectById?addSubjectId=" + value;
		window.open(address, "newWin", 'width=500 ,height=200 ,top=' + top1 + ',left=' + left1 + ',resizable=no');
	}
	function getSubjectByName(value) {
		left1 = (screen.availWidth - 500) / 2;
		top1 = (screen.availHeight - 200) / 2;
		var address = "/sugang/findSubjectByName?addSubjectId=" + value;
		window.open(address, "newWin", 'width=500 ,height=200 ,top=' + top1 + ',left=' + left1 + ',resizable=no');
	}
	function getSubjectByCompletion(value) {
		left1 = (screen.availWidth - 500) / 2;
		top1 = (screen.availHeight - 200) / 2;
		var address = "/sugang/findSubjectByCompletion?addSubjectId=" + value;
		window.open(address, "newWin", 'width=500 ,height=200 ,top=' + top1 + ',left=' + left1 + ',resizable=no');
	}
	function getSubjectByDay(value) {
		left1 = (screen.availWidth - 500) / 2;
		top1 = (screen.availHeight - 200) / 2;
		var address = "/sugang/findSubjectByDay?addSubjectId=" + value;
		window.open(address, "newWin", 'width=500 ,height=200 ,top=' + top1 + ',left=' + left1 + ',resizable=no');
	}
	function Ev_onbeforeunload() {
		opener.location.reload();
		window.close();
	}
</script>