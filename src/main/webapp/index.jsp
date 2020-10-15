<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User,model.Mutter,java.util.List"%>
<%@ page import="model.SiteEV"%>
<%
// セッションスコープに保存されたユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
//アプリケーションスコープに保存されたつぶやきリストを取得
List<Mutter> mutterList =(List<Mutter>) application.getAttribute("mutterList");
//アプリケーションスコープに保存されたsiteEVインスタンスを取得
SiteEV siteEV = (SiteEV) application.getAttribute("siteEV");
//アプリケーションスコープに保存されたsiteEVリストを取得
List<SiteEV> siteEVList = (List<SiteEV>) application.getAttribute("siteEVList");
String errText = (String)request.getAttribute("errText");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mutter</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	rel="stylesheet">
<link href="./css/stylesheet.css" rel="stylesheet">
</head>
<body>
	<!-- ログイン処理が完了しているか確認 -->
	<!-- ログインが済んでいれば(in) -->
	<% if(loginUser!=null){ %>
	<!-- ヘッダー開始 -->
<jsp:include page="/header.jsp"/>
	<!-- ヘッダー終了 -->
	<!-- つぶやきリスト開始  -->
	<%if(mutterList!=null){%>
	<div class="container h-auto mt-5">
		<ul>
			<%int i=0; for(Mutter mutter : mutterList) {%>
			<li class="list-unstyled mt-2">
				<div class="d-flex align-items-center justify-content-center">
				<div class=""><i class="fas fa-user-circle fa-3x pt-4"></i></div>
				<div class="mutter w-50 h-auto mb-1 rounded">
					<p class="p-2 mb-0"><%= mutter.getText() %></p>
				</div></div>
				<div class="w-50 h-auto mx-auto pl-5"><span class="text-muted"><%= mutter.getUserName() %></span>

					<%if(siteEVList.get(i).getGoodList().contains(loginUser.getName())
							&&!siteEVList.get(i).getBadList().contains(loginUser.getName())){ %>
					<i class="fas fa-thumbs-up ml-1" style="color: royalblue;"></i>
					<%}else if(siteEVList.get(i).getBadList().contains(loginUser.getName())){ %>
					<i class="fas fa-thumbs-up ml-1" style="color: grey;"></i>
					<%}else{%>
					<a href="/SiteEVController?action=like&i=<%=i%>" style="text-decoration: none;">
					<i class="fas fa-thumbs-up ml-1" style="color: grey;"></i>
					</a>
					<%}
					if(siteEVList!=null){%>
					<%=siteEVList.get(i).getLike()%>
					<%}%>

					<%if(!siteEVList.get(i).getGoodList().contains(loginUser.getName())
							&&siteEVList.get(i).getBadList().contains(loginUser.getName())){ %>

					<i class="fas fa-thumbs-down ml-1" style="color: royalblue;"></i>

					<%}else if(siteEVList.get(i).getGoodList().contains(loginUser.getName())){ %>
					<i class="fas fa-thumbs-down ml-1" style="color: grey;"></i>

					<%}else{%>

					<a href="/SiteEVController?action=dislike&i=<%=i%>" style="text-decoration: none;">
					<i class="fas fa-thumbs-down ml-1" style="color: grey;"></i>
					</a>
					<%}
					if(siteEVList!=null){%>
					<%=siteEVList.get(i).getDislike()%>
					<%} %>
					<%if(mutter.getUserName().equals(loginUser.getName())){ %>
					<a href="/Delete?num=<%=i%>"><i class="fas fa-trash-alt ml-1"></i></a>
					<%} %>
					<%=mutter.getTime() %>
				</div>
			</li>
			<% i++; }%>
		</ul>
	</div>
	<%}
	//つぶやきリスト終了
	//ログイン未処理の場合(in)
	}else{%>
	<!-- ヘッダー2開始 -->
<jsp:include page="/header2.jsp"/>
	<!-- ヘッダー2終了 -->
	<!-- つぶやきリスト開始 -->
	<%if(mutterList!=null){%>
	<div class="container h-auto mt-5">
		<ul>
			<%int i=0; for(Mutter mutter : mutterList) {%>
			<li class="list-unstyled mt-2">
				<div class="d-flex align-items-center justify-content-center">
				<div class=""><i class="fas fa-user-circle fa-3x pt-4"></i></div>
				<div class="mutter w-50 h-auto mb-1 rounded">
					<p class="p-2 mb-0"><%= mutter.getText() %></p>
				</div></div>
				<div class="w-50 h-auto mx-auto pl-5"><span class="text-muted"><%= mutter.getUserName() %></span>
					<i class="fas fa-thumbs-up ml-1 style="color: grey;"></i>
					<%if(siteEVList!=null){%>
					<%=siteEVList.get(i).getLike()%>
					<%} %>
					<i class="fas fa-thumbs-down ml-1 style="color: grey;"></i>
					<%if(siteEVList!=null){%>
					<%=siteEVList.get(i).getDislike()%>
					<%} %>
					<%=mutter.getTime() %>
				</div>
			</li>
			<% i++; }%>
		</ul>
	</div>
	<%}
	}%>
	<!-- つぶやきリスト終了 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>