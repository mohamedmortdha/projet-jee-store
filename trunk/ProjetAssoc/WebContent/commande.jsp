<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Collection"%>
<%@ page import="model.*"%>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>ProjetAssoc</title>
<link href='http://fonts.googleapis.com/css?family=Abel'
	rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<%
	SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
	String dateFormatee = formatDateJour.format(new Date()); 
%>
	<div id="wrapper">
		<div id="header-wrapper" class="container">
			<div id="header" class="container">
				<div id="logo">
					<h1>
						<a href="#">ProjetAssoc </a>
					</h1>
				</div>
				<div id="menu">
					<ul>
						<li><a href="home">Accueil</a></li>
						<li><a href="articles">Articles</a></li>
						<li class="current_page_item"><a href="commande">Commande</a></li>
						<li><a href="panier">Panier (<%=((Panier)session.getAttribute("panier")).getNumberArticle() %>)</a></li>
						<li><a href="disconnect">${sessionScope.user} : LogOut</a></li>
					</ul>
				</div>
			</div>
			<div>
				<img src="images/img03.png" width="1000" height="40" alt="" />
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title">
						<a href="#">Vos commandes</a>
					</h2>
					<p class="meta">
						<span class="date"><%= dateFormatee %></span><span class="posted">Utilisateur <a href="#">${sessionScope.user}</a>
						</span>
					</p>
					<div style="clear: both;">&nbsp;</div>
					<div class="entry">
					<% // Affichage du message d'erreur s'il existe
	      if (request.getAttribute("erreur") != null) { %>
	<strong>Erreur : <%= (String) request.getAttribute("erreur")%></strong>
	<br>
	<%} else if(request.getAttribute("commandeOK") != null) { %>
	<strong>Erreur : <%= (String) request.getAttribute("erreur")%></strong>
	<br>
	<%} %>
	
	<%for(Commande c:(Collection<Commande>)request.getAttribute("list_commande")){ %>
	<table border="1">
		<tr>
			<th>ID COMMANDE</th>
			<th>DATE COMMANDE</th>
		</tr>
		<tr>
			<td><%=c.getIdentifiant() %></td>
 			<td><%= (c.getDate_commande() != null ? new SimpleDateFormat("dd/MM/yyyy").format(c.getDate_commande()):"") %></td> 
		</tr>
		<tr>
			<th>ARTICLE</th>
			<th>QUANTITE</th>
		</tr>
	<%for(LigneCommande l:(Collection<LigneCommande>)request.getAttribute("list_lignesCommande")){ if(l.getIdCommande() == c.getIdentifiant()){%>
		<tr>
			<td><%=l.getArticle().getNom() %></td>
			<td><%=l.getQuantite() %></td>
		</tr>
		<%}}%>

	</table>
	</br>
	<%} %>
					</div>
				</div>
				<div style="clear: both;">&nbsp;</div>
			</div>
			<!-- end #content -->
			<div id="sidebar"></div>
			<!-- end #sidebar -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<div class="container">
			<img src="images/img03.png" width="1000" height="40" alt="" />
		</div>
		<!-- end #page -->
	</div>
	<div id="footer-content"></div>
	<div id="footer">
		<p>Copyright (c) 2012 ProjetAssoc All rights reserved.</p>
	</div>
	<!-- end #footer -->
</body>
</html>