<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css"
		href='<c:url value="./resources/css/styles.css"/>'>
	<title>Produto</title>
</head>

<body>
	<nav class="menu-lateral">
		<ul>
			<li><a href="Produto">Produto</a></li>
			<li><a href="Cliente">Clientes</a></li>
			<li><a href="Estoque">Estoque</a></li>
			<li><a href="RegistroVendas">Registro De Vendas</a></li>
			<li><a href="Fornecedores">Fornecedores</a></li>
			<%--<li><a href="Relatorios">Rel�torios</a></li>--%>
			<li><a href="GerenciarUsuarios">Gerenciar Usu�rios</a></li>
		</ul>
	</nav>
	<div class="formulario">
	<form action="Produto" method="post" class="form">
			<div class="posicionarCheck">
				<div class="bordaTabelaAdicionar">
					<input type="checkbox">
					<input type="text" class="tabelaAdicionar" id="nomeProduto" name="nomeProduto" placeholder="Nome do Produto"> 
					<input type="text" class="tabelaAdicionar" id="categoria" name="categoria" placeholder="Categoria">
					<input type="text" class="tabelaAdicionar" id="modelos" name="modelos" placeholder="Modelos">
					<input type="text" class="tabelaAdicionar" id="ncmsh" name="ncmsh" placeholder="NCM/SH">
					<input type="text" class="tabelaAdicionar" id="preco"  name="preco" placeholder="Pre�o de venda">
					<input type="number" class="tabelaAdicionar" id="quantidade" name="quantidade">
				</div>
			</div>
			<div class="botoes">
				<input type="submit" id="botao" name="botaoAdicionar" value="Adicionar">
				<a href="Home">Voltar</a>
			</div>
		</form>
	</div>
</body>

</html>
