<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css"
		href='<c:url value="./resources/css/styles.css"/>'>
	<title>Registro de Vendas</title>
</head>

<body>
	<nav class="menu-lateral">
		<ul>
			<li><a href="Produto">Produto</a></li>
			<li><a href="Cliente">Clientes</a></li>
			<li><a href="Estoque">Estoque</a></li>
			<li><a href="RegistroVendas">Registro De Vendas</a></li>
			<li><a href="Fornecedores">Fornecedores</a></li>
			<%--<li><a href="Relatorios">Relátorios</a></li>--%>
			<li><a href="GerenciarUsuarios">Gerenciar Usuários</a></li>
		</ul>
	</nav>

	<input type="text" id="input" name="inputPesquisa" value="Digite a pesquisa">
	<table>
		<thead>
			<tr>
				<th></th>
				<th>ID</th>
				<th>Descrição da Venda</th>
				<th>Data</th>
				<th>Valor</th>
			</tr>
		</thead>
		<tbody>
				<tr>
<%-- 					<c:if test="$"> --%>
<%-- 						<c:forEach var="c" items="$"> --%>
<!-- 							<tr> -->
<%-- 								<td><c:out value="$"></c:out></td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:if> --%>
				</tr>
		</tbody>
	</table>
	<input type="submit" id="botao" name="botaoVisualizar" value="Visualizar">
	<input type="submit" id="botao" name="botaoVoltar" value="Voltar">
</body>

</html>
