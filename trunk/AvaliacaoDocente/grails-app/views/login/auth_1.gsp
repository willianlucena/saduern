<head>
  <title>SADUERN - Sistema de Avaliação Docente - UERN</title>
  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'LoginOk.css')}" />
</head>

<body>
  <form action='${postUrl}' method='POST' id='loginForm'>
    <fieldset>

      <label for='j_username'>Usuario</label>
      <input type='text' name='j_username' id='j_username' value='${request.remoteUser}' />
      <div class="clear"></div>

      <label for='j_password'>Senha</label>
      <input type='password' name='j_password' id='j_password' />
      <div class="clear"></div>

      <label for="remember_me" style="padding: 0;">Lembrar senha</label>
      <input type="checkbox" id="remember_me" style="position: relative; top: 3px; margin: 0; " name='_spring_security_remember_me'/>
      <div class="clear"></div>

      <br />

      <input type="submit" style="margin: -20px 0 0 287px;" class="button" name="commit" value="Entrar"/>
    </fieldset>
  </form>

</body>
