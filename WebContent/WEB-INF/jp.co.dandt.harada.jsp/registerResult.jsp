<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String error_msg = (String) request.getAttribute("error_msg"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>会員登録結果</title>
<link href="common/css/base.css" rel="stylesheet" media="all">
</head>

<body>

	<!-- ヘッダー -->
	<header>
		<div class="inner clearfix">
			<h1 id="logo">
				<a href="#"><img
					src="common/img/スクリーンショット 2017-04-04 0.16.07.png" alt="ロゴ"></a>
			</h1>
		</div>
		<!-- /.inner -->
	</header>
	<div id="contents">
		<p><%= error_msg %></p>
		<p>
			<a href="RegisterResult">▶︎topへ戻る</a>
		</p>

	</div>
	<!-- /#contents -->

	<!-- フッター -->
	<footer id="footer">
		<hr class="footer_bottom_line">
		<div class="footer_bottom">
			<div class="inner">
				<ul class="clearfix">
					<li><a href="#" target="_blank">サイトについて</a>&nbsp;&nbsp;|</li>
					<li><a href="#" target="_blank">会社概要</a>&nbsp;&nbsp;|</li>
					<li><a href="#" target="_blank">個人情報保護方針</a>&nbsp;&nbsp;|</li>
					<li><a href="#" target="_blank">お問い合わせ</a>&nbsp;&nbsp;|</li>
					<li><a href="#" target="_blank">ヘルプ(FAQ)</a>&nbsp;&nbsp;|</li>
					<li><a href="#" target="_blank">プライバシーポリシー</a></li>
				</ul>
				<p class="copyright">
					<small>© 2013-2016 有限会社アゼリシステム</small>
				</p>
			</div>
			<!-- /.inner -->
		</div>
		<!-- /.footer_bottom -->
	</footer>
</body>
</html>