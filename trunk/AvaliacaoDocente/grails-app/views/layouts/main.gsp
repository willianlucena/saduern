<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'application.css?1207248491')}"/>    
    <!--[if IE]>
    <style type="text/css">
      * html body{ width: expression( document.documentElement.clientWidth < 900 ? '900px' : '100%' ); }
      body {behavior: url(/stylesheets/csshover.htc?1207248491);}
    </style>
<![endif]-->

<!-- page specific tags -->
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="navegation" />
  </head>
  <body onload="select('${controllerName?.encodeAsHTML()}', '${actionName?.encodeAsHTML()}')">
    <div id="wrapper">
      <div id="wrapper2">
        <div id="top-menu" style="background-color:#2c4056;">
                      
            <a href="${createLinkTo(dir:'')}" class="home" style="color:white; padding-left:1em; padding-right:0.5em;">Página inicial</a>            
            <a href="${createLinkTo(dir:'home/contato')}" class="contato" style="color:white; padding-left:0.5em; padding-right:0.5em;">Contato</a>
            <a href="${createLinkTo(dir:'logout/index')}" class="login" style="color:white; padding-left:0.5em; padding-right:0.5em;">Sair</a>
        </div>
        <div id="header">
          <div id="quick-search">
            <g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">
              <span style="color:white; font-weight:bold;">Busca</span>:
              <g:textField accesskey="f" id="q" name="q" value="${params.q}" class="small" accesskey="4" size="20"/>
              <input type="submit" value="Search" />
            </g:form>
          </div>
          <div style="margin-top:0.7em;">
            <h7 style="border-bottom: 0px; color:white; font-family: Trebuchet MS,Georgia,Times New Roman,serif; font-size: 2.2em; font-weight: bold;">SADUERN - Sistema de Avaliação Docente UERN</h7>
            <div id="main-menu">
            <ul style="margin-top:1.1em;">
              <li><a href="${createLinkTo(dir:'avaliacao')}" class="avaliacao" style="color:white;" id="linkAvaliacao">Avaliacao</a></li>
              <li><a href="${createLinkTo(dir:'curso')}" class="curso" style="color:white;" id="linkCurso">Curso</a></li>
              <li><a href="${createLinkTo(dir:'departamento')}" class="departamento"style="color:white;" id="linkDepartamento">Departamento</a></li>
              <li><a href="${createLinkTo(dir:'disciplina')}" class="disciplina" style="color:white;" id="linkDisciplina">Disciplina</a></li>
              <li><a href="${createLinkTo(dir:'mapeamento')}" class="mapeamento" style="color:white;" id="linkMapeamento">Mapeamentos</a></li>
              <li><a href="${createLinkTo(dir:'permissao')}" class="permisao" style="color:white;" id="linkPermissao">Permissão</a></li>
              <li><a href="${createLinkTo(dir:'questao')}" class= "questao" style="color:white;" id="linkQestao">Questão</a></li>
              <li><a href="${createLinkTo(dir:'resposta')}" class= "resposta" style="color:white;" id="linkResposta">Resposta</a></li>
              <li><a title="Teste"href="${createLinkTo(dir:'usuario')}" class= "usuario" style="color:white;" id="linkUsuario">Usuário</a></li>
            </ul>
            </div>
            <!--<table border="0">
                <tr>
                  <td><div id="uernLogo" class="logo"><a href="http://uern.br/"><div align="center"><img src="${resource(dir:'images',file:'uern_brasao.png')}" alt="UERN" border="0" width=""/></div></a></div></td>
                  <td><h7 style="border-bottom: 0px; color:white; font-family: Trebuchet MS,Georgia,Times New Roman,serif; font-size: 2.2em; font-weight: bold;">SADUERN - Sistema de Avaliação Doscente UERN</h7></td>
                </tr>
              </table>-->
          </div>
          <!--<div id="main-menu">
            <ul style="margin-top:1.1em;">              
              <li><a href="${createLinkTo(dir:'avaliacao')}" class="avaliacao" action="list" style="color:white;" id="linkAvaliacao">Avaliacao</a></li>
              <li><a href="${createLinkTo(dir:'curador')}" class="curador" action="list" style="color:white;" id="linkCurador">Curso</a></li>
              <li><a href="${createLinkTo(dir:'museu')}" class="museu" action="list" style="color:white;" id="linkMuseu">Museus</a></li>
              <li><a href="${createLinkTo(dir:'obra')}" class="obra" action="list" style="color:white;" id="linkObra">Obras</a></li>
              <li><a href="${createLinkTo(dir:'mail/mail')}" class="mail" action="mail" style="color:white;" id="linkMail">Mail</a></li>
              <li><a href="${createLinkTo(dir:'logs/logs')}" class="logs" action="logs" style="color:white;" id="linkLogs">Logs</a></li>
              <li><a href="${createLinkTo(dir:'grafico/grafico')}" class= "grafico" action="grafico" style="color:white;" id="linkGrafico">Grafico</a></li>
            </ul>
          </div>-->
        </div>
        <h1>Bem vindo! <b><g:loggedInUserInfo field="userRealName"/></b></h1>
        <div id="content">
          <g:layoutBody />
        </div>   
       <div id="footer">
          <div class="bgl">
            <div class="bgr" align="center">
            Universidade do Estado do Rio Grande do Norte<br>
            Sistema de Avaliação Docente<br>
            Desenvolvido pelos Alunos:<br>
            Everton Fagner; Felipe Costa; Willian Lucena; Maxwell Paiva<br/>
            2010© - JerryGonsa
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>