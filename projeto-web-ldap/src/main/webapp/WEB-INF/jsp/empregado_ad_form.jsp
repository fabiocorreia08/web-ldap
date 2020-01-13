<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>EFAD</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body class="d-flex flex-column h-100">
	<header>
     
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">EFAD</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
              <s:url value="/" var="indexURL"/>
			  <a class="nav-link" href="${indexURL }" role="button">Home <span class="sr-only">(atual)</span></a> 
            </li>
            <li class="nav-item">            
            	<s:url value="/empregadoErp/list/" var="listURL"/>
				<a class="nav-link" href="${listURL }" role="button">Empregados ERP</a>              
            </li>  
            <li class="nav-item">            
            	<s:url value="/person/list/" var="listURL"/>
				<a class="nav-link" href="${listURL }" role="button">Person</a>              
            </li>                        
          </ul> 
          
          <form class="form-inline mt-2 mt-md-0">
           		<s:url value="/logout" var="logoutURL"/>
				<a class="nav-link" href="${logoutURL }" role="button">Sair</a>  
          </form>        
        </div>
      </nav>
    </header>

	<main role="main" class="flex-shrink-0">
      <div class="container">
      	<br></br>
      	<br></br>
        <s:url value="/empregadoAd/save" var="saveURL"/>
		<h2>Empregado AD</h2>
		<form:form modelAttribute="empregadoAdForm" method="post" action="${saveURL }" cssClass="form">
			<form:hidden path="id" />
			<div class="form-group">
				<label>Matr�cula</label>
				<form:input path="matricula" type="text" class="form-control" id="matricula" placeholder="Matricula"/>
			</div>
			<div class="form-group">
				<label>Nome</label>
				<form:input path="nome" type="text" class="form-control" id="nome" placeholder="Nome"/>
			</div>
			<div class="form-group">
				<label>Descri��o</label>
				<form:input path="descricao" type="text" class="form-control" id="descricao" placeholder="Descri��o"/>
			</div>	
			<div class="form-group">
				<label>Status Conta</label>
				<form:input path="statusConta" type="text" class="form-control" id="statusConta" placeholder="Status Conta"/>
			</div>			
			
			<button type="submit" class="btn btn-primary">Save</button>
		</form:form>
      </div>
    </main>

</body>
</html>