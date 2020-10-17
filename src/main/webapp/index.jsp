<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User,model.Mutter,java.util.List"%>
<%@ page import="model.SiteEV"%>
<%
	// セッションスコープに保存されたユーザー情報を取得
	User loginUser = (User) session.getAttribute("loginUser");
	//アプリケーションスコープに保存されたつぶやきリストを取得
	List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
	//アプリケーションスコープに保存されたsiteEVインスタンスを取得
	SiteEV siteEV = (SiteEV) application.getAttribute("siteEV");
	//アプリケーションスコープに保存されたsiteEVリストを取得
	List<SiteEV> siteEVList = (List<SiteEV>) application.getAttribute("siteEVList");
	//ログイン時失敗時のエラーメッセージをリクエストスコープで取得
	String errText = (String) request.getAttribute("errText");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mutter</title>
<!-- bootstrapのcssへのlink -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<!-- fontawsomeCDNへのlink -->
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	rel="stylesheet">
<!-- stylesheet.cssへのlink -->
<link href="./css/stylesheet.css" rel="stylesheet">
</head>
<body>
	<!-- ログイン処理が完了しているか確認 -->
	<!-- セッションスコープが空でなければ(in) -->
	<%
		if (loginUser != null) {
	%>

	<!-- ヘッダー開始 -->
	<jsp:include page="/header.jsp" />
	<!-- ヘッダー終了 -->

	<!-- つぶやきリスト開始  -->
	<!-- つぶやきリストが空でなければ(in) -->
	<%
		if (mutterList != null) {
	%>
	<div class="container h-auto mt-5">
		<ul>

			<!-- リスト番号取得のため変数iを拡張for文の外で初期化  -->
			<%
				int i = 0;
			%>

			<!-- 拡張for文でリストからつぶやきを順番に取り出す  -->
			<%
				for (Mutter mutter : mutterList) {
			%>

			<!-- listスタート -->
			<li class="list-unstyled mt-2">
				<!-- つぶやき上部のcontainer開始、flexboxでwrapperのレイアウトを調整 -->
				<div class="d-flex align-items-center justify-content-center">

					<!-- 顔画像wrapper開始 -->
					<div class="">
						<i class="fas fa-user-circle fa-3x pt-4"></i>
					</div>
					<!-- 顔画像wrapper終了 -->

					<!-- テキストwrapper -->
					<div class="mutter w-50 h-auto mb-1 rounded">
						<p class="p-2 mb-0"><%=mutter.getText()%></p>
					</div>
					<!-- テキストwrapper終了 -->

				</div> <!-- つぶやき上部のコンテナ終了 --> <!-- つぶやき下部のコンテナ開始 --> <!-- リストから名前を取得して表示する -->
				<div class="w-50 h-auto mx-auto pl-5">
					<span class="text-muted"><%=mutter.getUserName()%></span>

					<!-- Goodアイコン部分開始 -->
					<!-- loginUserがこのつぶやきに既にGoodを押して、かつ、Badを押していない場合(in)-->
					<%
						if (siteEVList.get(i).getGoodList().contains(loginUser.getName())
											&& !siteEVList.get(i).getBadList().contains(loginUser.getName())) {
					%>

					<!-- Goodアイコンに色を付けて、aタグを外す -->
					<i class="fas fa-thumbs-up ml-1" style="color: royalblue;"></i>

					<!-- loginUserがこのつぶやきに既にBadを押していた場合(in) -->
					<%
						} else if (siteEVList.get(i).getBadList().contains(loginUser.getName())) {
					%>

					<!--  Goodアイコンの色を外して、aタグを外す-->
					<i class="fas fa-thumbs-up ml-1" style="color: grey;"></i>

					<!-- loginUserがこのつぶやきにGoodもBadも押していない場合(in) -->
					<%
						} else {
					%>

					<!-- Goodアイコンの色を外して、aタグを付ける -->
					<!-- Goodが押された場合は、SiteEVControllerにaction=likeと,リスト番号iをgetで送る -->
					<a href="/registerapp/SiteEVController?action=like&i=<%=i%>"
						style="text-decoration: none;"> <i
						class="fas fa-thumbs-up ml-1" style="color: grey;"></i>
					</a>
					<%
						}
									//Goodアイコン部分終了
									//Good数部分開始
									//いいねリストsiteEVListが空でない場合(in)
									if (siteEVList != null) {
					%>

					<!-- リスト番号iを利用してこのつぶやきに対応するいいね数を取得表示 -->
					<%=siteEVList.get(i).getLike()%>
					<%
						}
					%>
					<!-- Good数部分終了 -->

					<!-- Badアイコン部分開始 -->
					<!-- loginUserがこのつぶやきに既にBadを押して、かつ、Goodを押していない場合(in)-->
					<%
						if (!siteEVList.get(i).getGoodList().contains(loginUser.getName())
											&& siteEVList.get(i).getBadList().contains(loginUser.getName())) {
					%>

					<!-- Badアイコンに色を付けて、aタグを外す -->
					<i class="fas fa-thumbs-down ml-1" style="color: royalblue;"></i>

					<!-- loginUserがこのつぶやきに既にGoodを押していた場合(in) -->
					<%
						} else if (siteEVList.get(i).getGoodList().contains(loginUser.getName())) {
					%>

					<!--  Badアイコンの色を外して、aタグを外す-->
					<i class="fas fa-thumbs-down ml-1" style="color: grey;"></i>

					<!-- loginUserがこのつぶやきにGoodもBadも押していない場合(in) -->
					<%
						} else {
					%>

					<!-- Badアイコンの色を外して、aタグを付ける -->
					<!-- Badが押された場合は、SiteEVControllerにaction=dislikeと,リスト番号iをgetで送る -->
					<a href="/registerapp/SiteEVController?action=dislike&i=<%=i%>"
						style="text-decoration: none;"> <i
						class="fas fa-thumbs-down ml-1" style="color: grey;"></i>
					</a>
					<%
						}
									//Badアイコン部分終了
									if (siteEVList != null) {
					%>
					<%=siteEVList.get(i).getDislike()%>
					<%
						}
					%>
					<%
						if (mutter.getUserName().equals(loginUser.getName())) {
					%>
					<a href="/Delete?num=<%=i%>"><i
						class="fas fa-trash-alt ml-1"></i></a>
					<%
						}
					%>
					<%=mutter.getTime()%>

				</div> <!-- つぶやき下部のコンテナ終了 -->
			</li>
			<!-- list終了 -->
			<%
				i++;
						}
			%>
		</ul>
	</div>
	<%
		}
			//つぶやきリスト終了
			//ログイン未処理の場合(in)
		} else {
	%>
	<!-- ヘッダー2開始 -->
	<jsp:include page="/header2.jsp" />
	<!-- ヘッダー2終了 -->
	<!-- つぶやきリスト開始 -->
	<%
		if (mutterList != null) {
	%>
	<div class="container h-auto mt-5">
		<ul>
			<%
				int i = 0;
						for (Mutter mutter : mutterList) {
			%>
			<li class="list-unstyled mt-2">
				<div class="d-flex align-items-center justify-content-center">
					<div class="">
						<i class="fas fa-user-circle fa-3x pt-4"></i>
					</div>
					<div class="mutter w-50 h-auto mb-1 rounded">
						<p class="p-2 mb-0"><%=mutter.getText()%></p>
					</div>
				</div>
				<div class="w-50 h-auto mx-auto pl-5">
					<span class="text-muted"><%=mutter.getUserName()%></span> <i
						class="fas fa-thumbs-up ml-1 style=" color:grey;"></i>
					<%
						if (siteEVList != null) {
					%>
					<%=siteEVList.get(i).getLike()%>
					<%
						}
					%>
					<i class="fas fa-thumbs-down ml-1 style=" color:grey;"></i>
					<%
						if (siteEVList != null) {
					%>
					<%=siteEVList.get(i).getDislike()%>
					<%
						}
					%>
					<%=mutter.getTime()%>
				</div>
			</li>
			<%
				i++;
						}
			%>
		</ul>
	</div>
	<%
		}
		}
	%>
	<!-- つぶやきリスト終了 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
</body>
</html>