<%@ page contentType="text/html;charset=utf-8"%>
<script type="text/javascript">
function removeEnrollment(value){
	var address = "/sugang/removeEnrollmentbySubject?removeSubjectId="+value;
	window.open(address, "newWin", "width=600, height=400");
}
function getSubjectList(value){
	var address = "/sugang/getSubjectList?addSubjectId="+value;
	window.open(address, "newWin", "width=600, height=400");
}
function getSubjectById(value){
	var address = "/sugang/findSubjectById?addSubjectId="+value;
	window.open(address, "newWin", "width=600, height=400");
}
function getSubjectByName(value){
	var address = "/sugang/findSubjectByName?addSubjectId="+value;
	window.open(address, "newWin", "width=600, height=400");
}
function getSubjectByCompletion(value){
	var address = "/sugang/findSubjectByCompletion?addSubjectId="+value;
	window.open(address, "newWin", "width=600, height=400");
}
function getSubjectByDay(value){
	var address = "/sugang/findSubjectByDay?addSubjectId="+value;
	window.open(address, "newWin", "width=600, height=400");
}
function Ev_onbeforeunload(){
	opener.location.reload();
	window.close();
} 
</script>