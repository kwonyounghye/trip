<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnJoin").click(function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			var name = $("#name").val();
			var birthyear = $("#birthyear").val();
			var birthmonth = $("#birthmonth").val();
			var birthday = $("#birthday").val();
			var gender = $("#gender").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var address = $("#address").val();
			var address2 = $("#address2").val();
			var introduction = $("#introduction").val();
			if (id == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return;
			}
			if (pw == "") {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return;
			}
			if(pw != pw2){
				alert("비밀번호가 일치하지 않습니다.");
				$("#pw").focus();
				$("#pw2").focus();
				return;
			}
			if (name == "") {
				alert("이름을 입력하세요.");
				$("#name").focus();
				return;
			}
			if (birthyear == "") {
				alert("태어난 년도를 입력하세요.");
				$("#birthyear").focus();
				return;
			}
			if (birthmonth == "") {
				alert("태어난 월을 입력하세요.");
				$("#birthmonth").focus();
				return;
			}
			if (birthday == "") {
				alert("태어난 일을 입력하세요.");
				$("#birthday").focus();
				return;
			}
			if (gender == "") {
				alert("성별을 입력하세요.");
				$("#gender").focus();
				return;
			}
			if (phone == "") {
				alert("전화번호를 입력하세요.");
				$("#phone").focus();
				return;
			}
			if (email == "") {
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return;
			}
			if (address == "") {
				alert("주소를 입력하세요.");
				$("#address").focus();
				return;
			}
			if (address2 == "") {
				alert("주소를 입력하세요.");
				$("#address2").focus();
				return;
			}
			if (introduction == "") {
				alert("자기소개를 입력하세요.");
				$("#introduction").focus();
				return;
			}
			document.form2.action = "/member/insert.do";
			document.form2.submit();

		});
	});
	 function showPostcode(){
  		 new daum.Postcode({
     		 oncomplete : function(data){
        		 var fullAddr = "";
        		 var extraAddr = "";
         
        		 if(data.userSelectedType === "R"){ // '==='  자료형과 값 모두 검사   '==' 값만 검사
           			 fullAddr = data.roadAddress;
         		 } else{
            		fullAddr = data.jibunAddress;
        	 	 }	
         
         if(data.userSelecteType === "R"){
            if(data.bname !== ""){ // === 자료형과 값 모두 검사
               extraAddr += data.bname;
            }
            if(data.buildingName !== ""){
               extraAddr += (extraAddr !== "" ? ", "+ data.buildingName : data.buildingName);
            }
            fullAddr += (extraAddr !== "" ? " (" + extraAddr + ")" : "");   
         }
         document.getElementById("post_code").value = data.zonecode;
         document.getElementById("address").value=fullAddr;
         document.getElementById("address2").focus();
      }
   }).open(); 
}
	/*
	function showPostcode() {
		alert("dd");
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = "";
						var extraAddr = "";
						if (data.userSelectedType === "R") { // === 자료형과 값 모두 검사
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}
						if (data.userSelectedType === "R") {
							if (data.bname !== "") { // !== 자료형과 값 모두 검사
								extraAddr += data.bname;
							}
							if (data.buildingName !== "") {
								extraAddr += (extraAddr !== "" ? ", "
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== "" ? " (" + extraAddr
									+ ")" : "");
						}
						document.getElementById("post_code").value = data.zonecode;
						document.getElementById("address").value = fullAddr;
						document.getElementById("address2").focus();
					}
				}).open();
	}
	*/
</script>
<title>가자 GO</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>

<body class="homepage is-preload">
	<div id="page-wrapper">

		<%@ include file="../include/menu.jsp"%>
	
		<section id="main">
			<div class="container"">
				<h2>회원가입</h2>
				<form name="form2" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td><input id="id" name="id" style="width:30%; height:50px; border-radius:5px; border:solid 1px #dddddd"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="pw" name="pw" width="100px" style="width:30%; height:50px;"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" id="pw2" name="pw2" width="100px" style="width:30%; height:50px;"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input id="name" name="name" style="width:30%; height:50px; border-radius:5px; border:solid 1px #dddddd"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><select name="birthyear"  style="width:10%; float:left; margin-right:20px;">
									<option value="">년</option>
									<option value="1900">1900</option>
									<option value="1901">1901</option>
									<option value="1902">1902</option>
									<option value="1903">1903</option>
									<option value="1904">1904</option>
									<option value="1905">1905</option>
									<option value="1906">1906</option>
									<option value="1907">1907</option>
									<option value="1908">1908</option>
									<option value="1909">1909</option>
									<option value="1910">1910</option>
									<option value="1911">1911</option>
									<option value="1912">1912</option>
									<option value="1913">1913</option>
									<option value="1914">1914</option>
									<option value="1915">1915</option>
									<option value="1916">1916</option>
									<option value="1917">1917</option>
									<option value="1918">1918</option>
									<option value="1919">1919</option>
									<option value="1920">1920</option>
									<option value="1921">1921</option>
									<option value="1922">1922</option>
									<option value="1923">1923</option>
									<option value="1924">1924</option>
									<option value="1925">1925</option>
									<option value="1926">1926</option>
									<option value="1927">1927</option>
									<option value="1928">1928</option>
									<option value="1929">1929</option>
									<option value="1930">1930</option>
									<option value="1931">1931</option>
									<option value="1932">1932</option>
									<option value="1933">1933</option>
									<option value="1934">1934</option>
									<option value="1935">1935</option>
									<option value="1936">1936</option>
									<option value="1937">1937</option>
									<option value="1938">1938</option>
									<option value="1939">1939</option>
									<option value="1940">1940</option>
									<option value="1941">1941</option>
									<option value="1942">1942</option>
									<option value="1943">1943</option>
									<option value="1944">1944</option>
									<option value="1945">1945</option>
									<option value="1946">1946</option>
									<option value="1947">1947</option>
									<option value="1948">1948</option>
									<option value="1949">1949</option>
									<option value="1950">1950</option>
									<option value="1951">1951</option>
									<option value="1952">1952</option>
									<option value="1953">1953</option>
									<option value="1954">1954</option>
									<option value="1955">1955</option>
									<option value="1956">1956</option>
									<option value="1957">1957</option>
									<option value="1958">1958</option>
									<option value="1959">1959</option>
									<option value="1960">1960</option>
									<option value="1961">1961</option>
									<option value="1962">1962</option>
									<option value="1963">1963</option>
									<option value="1964">1964</option>
									<option value="1965">1965</option>
									<option value="1966">1966</option>
									<option value="1967">1967</option>
									<option value="1968">1968</option>
									<option value="1969">1969</option>
									<option value="1970">1970</option>
									<option value="1971">1971</option>
									<option value="1972">1972</option>
									<option value="1973">1973</option>
									<option value="1974">1974</option>
									<option value="1975">1975</option>
									<option value="1976">1976</option>
									<option value="1977">1977</option>
									<option value="1978">1978</option>
									<option value="1979">1979</option>
									<option value="1980">1980</option>
									<option value="1981">1981</option>
									<option value="1982">1982</option>
									<option value="1983">1983</option>
									<option value="1984">1984</option>
									<option value="1985">1985</option>
									<option value="1986">1986</option>
									<option value="1987">1987</option>
									<option value="1988">1988</option>
									<option value="1989">1989</option>
									<option value="1990">1990</option>
									<option value="1991">1991</option>
									<option value="1992">1992</option>
									<option value="1993">1993</option>
									<option value="1994">1994</option>
									<option value="1995">1995</option>
									<option value="1996">1996</option>
									<option value="1997">1997</option>
									<option value="1998">1998</option>
									<option value="1999">1999</option>
									<option value="2000">2000</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
							</select> <select name="birthmonth"  style="width:10%; float:left; margin-right:20px;">
									<option value="">월</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select> <select name="birthday" style="width:10%; float:left; margin-right:20px;">
									<option value="">일</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
							</select></td>
						</tr>
						<tr>
							<td>성별</td> 
							<td><select name="gender" style="width:15%; text-align:center">
									<option value="male" selected>남자</option>
									<option value="female">여자</option>
							</select></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input id="phone" name="phone" style="width:30%; height:50px; border-radius:5px; border:solid 1px #dddddd"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input id="email" name="email" style="width:30%; height:50px; border-radius:5px; border:solid 1px #dddddd"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								우편번호  <input name="zipcode" id="post_code" style="width:15%; height:50px; border-radius:5px; border:solid 1px #dddddd" readonly> 
								<input type="button" onclick="showPostcode()" value="우편번호 찾기" style="padding:0px; width:150px; heigh:30px; margin-left:10px; margin-right:30px;">
							
								<input name="address" id="address" size="60" style="width:30%; height:50px; border-radius:5px; border:solid 1px #dddddd" readonly>
								<div> 
									상세주소  <input name="address2" id="address2" style="width:63.5%; height:50px; border-radius:5px; border:solid 1px #dddddd; margin-top:5px;">
								</div>
							</td>
						</tr>
						<tr>
							<td>자기소개</td>
							<td><textarea rows="5" cols="60" name="introduction"
									id="introduction" placeholder="자기소개를 입력하세요."
									style="width: 700px"></textarea></td>
						</tr>
						<tr></tr>
						<tr>
							<td align="center">
								<button type="button" id="btnJoin">회원가입</button> 
								
							</td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>

	<%@ include file="../include/footer.jsp"%>