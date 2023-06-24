<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="mainDiv mt-5">
	<div class="cardStyle">
		<form name="signupForm">

			<img src="" id="signupLogo" />

			<h2 class="formTitle">Login to your account</h2>

			<div class="inputDiv">
				<label class="inputLabel" for="password">New Password</label> <input
					type="password" id="password" name="password" required>
			</div>

			<div class="inputDiv">
				<label class="inputLabel" for="confirmPassword">Confirm
					Password</label> <input type="password" id="confirmPassword"
					name="confirmPassword">
			</div>

			<div class="buttonWrapper">
				<button type="submit" formaction="/action/change-password"
					formmethod="post" id="submitButton" onclick="validateSignupForm()"
					class="submitButton pure-button pure-button-primary">
					<span>Continue</span> <span id="loader"></span>
				</button>
			</div>

		</form>
	</div>

</div>

