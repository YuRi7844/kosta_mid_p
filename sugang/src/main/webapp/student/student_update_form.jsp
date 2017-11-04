<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<style>
#student_add_form{
	width: max-content;
    height: max-content;
    margin: 0 auto;
    margin-bottom: 200px;
}
#form{
	border: 1px solid aliceblue;
    width: max-content;
    height: max-content;
    padding: 40px;
    border-radius: 8px;
    background-color: aliceblue;
}
.form_item{
	text-align: left;
    font-size: 20px;
    width: 400px;
    height: 36px;
}
.form_list{
	float: right;
    width: 200px;
    border-radius: 10px;
    margin-right: 20px;
    height: 28px;
}
#add_button{
	margin: 0;
    height: 36px;
    width: 404px;
    padding: 0px;
    font-size: 18px;
    
}
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
<meta charset="UTF-8">
<title>학생 등록</title>
<script type="text/javascript">

	function formCheck(){
		var grade = document.getElementById("grade").value;
		var credit = document.getElementById("credit").value;
		var password = document.getElementById("password").value;
		if(password == 'admin'){
			alert("사용하실수 없는 비밀번호 입니다.")
			return false;
		}else if(grade > 0 && grade<=4){
			if(credit > 0 && credit <= 30){
				return true;
			}else{
				alert("학점란에는 1에서 30사의의 값을 입력해 주세요.");
				return false;
			}
		}else{
			alert("학년란에는 1과 4사이의 값을 입력해 주세요");
			return false;
		}
	}
	
	
</script>
</head>
<body>
	<%
		int studentId= Integer.parseInt(request.getParameter("studentId"));
		
	%>
	<span style="color:red;font-size: 25px;width: max-content;margin: 0 auto;"><h1> ${sessionScope.errorMessage}</h1></span>
	<section id="student_add_form">
		<form name="addForm" id="form" action="/sugang/updateStudent" method="POST" onsubmit="return formCheck(this);">
			<p class="form_item">
				학번<input readonly class="form_list" type="number" name="studentId" value="<%=studentId %>" >
			</p>
			<p class="form_item">
				이름<input required class="form_list" type="text" name="studentName" autofocus>

			</p>
			<p class="form_item">
				전공<input required class="form_list" type="text" name="major">
			</p>
			<p class="form_item">
				비밀번호변경<input required class="form_list" type="password" name="studentPw" id="password">
			</p>
			<p class="form_item">
				학년<input required class="form_list" type="number" name="grade" id="grade">
			</p>
			<p class="form_item" style="margin-bottom: 50px;">
				최대학점<input required class="form_list" type="number" name="maxCredit" id="credit">
			</p>
			<button id="add_button" type="submit">학생정보수정</button>
		</form>
	</section>


</body>
</html>