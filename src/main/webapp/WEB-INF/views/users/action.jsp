<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/changpassword.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
</head>
<body>
		
		
<div class="mainDiv mt-5">
  <div class="cardStyle">
    <form name="signupForm">
      
      <img src="" id="signupLogo"/>
      
      <h2 class="formTitle">
        Login to your account
      </h2>
      
    <div class="inputDiv">
      <label class="inputLabel" for="password">New Password</label>
      <input type="password" id="password" name="password" required>
    </div>
      
    <div class="inputDiv">
      <label class="inputLabel" for="confirmPassword">Confirm Password</label>
      <input type="password" id="confirmPassword" name="confirmPassword">
    </div>
    
    <div class="buttonWrapper">
      <button type="submit"  formaction="/action/change-password2" formmethod="post" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
        <span>Continue</span>
        <span id="loader"></span>
      </button>
    </div>
      
  </form>
  </div>
 
</div>
		   <script src="../../js/changepassword.js"></script>
</body>
</html>