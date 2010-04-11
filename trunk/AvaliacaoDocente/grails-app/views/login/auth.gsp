<head>
<meta name='layout' content='main' />
<title>SADUERN - Sistema de Avaliação Docente - UERN</title>
<style type='text/css' media='screen'>

#login {
	margin:15px 0px; padding:0px;
	text-align:center;
}
#login .inner {
	width:400px;
	margin:0px auto;
	text-align:left;
	padding:10px;
	/*border:5px double #499ede;*/
	/*border-bottom:5px double #499ede;
	border-left:5px double #499ede;
	border-right:5px double #499ede;*/

	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	-o-border-radius: 100px;
	border-radius: 100px;

	-moz-box-shadow: 10px 10px 15px rgba(0,0,0,0.6);
	-webkit-box-shadow: 10px 10px 15px rgba(0,0,0,0.6);
	-o-box-shadow: 10px 10px 15px rgba(0,0,0,0.6);
	box-shadow: 10px 10px 15px rgba(0,0,0,0.6);

}
#login .inner .fheader {
	padding:4px;
	margin:3px 0px 3px 0;
	color:#2e3741;
	font-size:16px;
	font-weight: bolder;
	text-align: center;
}
#login .inner .cssform p {
	clear: left;
	margin: 0;
	padding: 5px 0 8px 0;
	padding-left: 105px;
	/*border-top: 1px dashed gray;*/
	margin-bottom: 10px;
	height: 1%;
}
#login .inner .cssform input[type='text'] {
	width: 120px;
}
#login .inner .cssform label {
	font-weight: bold;
	float: left;
	margin-left: -75px;
	width: 100px;
}
#login .inner .login_message {color:red;}

.label {
	width: 115px;
	text-align: right;
	float: left;
	margin: 0 10px 0 0;
	padding: 9px 0 0 0;
	font-size: 16px;
	color: black;
	font-weight: bolder;
}

.input {
	display: block;
	padding: 4px;
	margin: 0px 0px 30px 0px;
	font-size: 18px;
	color: #3a3a3a;
	font-family: Georgia, serif;
}
.input[type=checkbox]{
	width: 35px;
	margin: 0;
	display: inline-block;
}
.botao {
        background: url(images/button-bg.png) repeat-x top center;
	/*border: 1px solid #999;*/

	padding: 5px;
	color: black;
	font-weight: bold;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	-o-border-radius: 20px;
	border-radius: 20px;
	font-size: 13px;
	width: 70px;

	-moz-box-shadow: 5px 5px 7px rgba(0,0,0,0.6);
        -webkit-box-shadow: 5px 5px 7px rgba(0,0,0,0.6);
	-o-box-shadow: 5px 5px 7px rgba(0,0,0,0.6);
	box-shadow: 5px 5px 7px rgba(0,0,0,0.6);

}
.botao:hover {
	background: white;
	color: black;
}
</style>
</head>

<body>
	<div id='login'>
		<div class='inner'>
			<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
			</g:if>
			<div class='fheader'>Login...</div>
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform'>
				<p>
					<label for='j_username' class="label">Matrícula</label>
					<input type='text' style="width: 200px" class='input' name='j_username' id='j_username' value='${request.remoteUser}' />
				</p><br/>
				<p>
					<label for='j_password' class="label">Senha</label>
					<input type='password' style="width: 200px" class='input' name='j_password' id='j_password' />
				</p><br/>
				<p>
					<label for='remember_me' style="color: black">Lembrar senha</label>
					<input type='checkbox' class='input' name='_spring_security_remember_me' id='remember_me'
					<g:if test='${hasCookie}'>checked='checked'</g:if> />
				</p>
				<p>
					<input type="submit" style="margin: -10px 0 0 150px;" class="botao" value="Entrar"/>
				</p>
			</form>
		</div>
	</div>
	<br/><br/><br/>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
