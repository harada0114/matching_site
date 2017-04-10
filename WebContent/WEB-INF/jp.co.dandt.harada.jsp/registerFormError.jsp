<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="jp.co.dandt.harada.model.User,jp.co.dandt.harada.model.Pref,java.util.List"%>

<%
	User registerUser = (User) session.getAttribute("registerUser");
%>
<%
	List<String> erre_msg = (List<String>) request
			.getAttribute("erre_msg");
%>
<%
	String post_cd1 = (String) request.getAttribute("post_cd1");
%>
<%
	String post_cd2 = (String) request.getAttribute("post_cd2");
%>
<%
	String tel1 = (String) request.getAttribute("tel1");
%>
<%
	String tel2 = (String) request.getAttribute("tel2");
%>
<%
	String tel3 = (String) request.getAttribute("tel3");
%>
<% String str_sex_text = (String) request.getAttribute("str_sex_text"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>会員登録</title>
<link href="common/css/base.css" rel="stylesheet" media="all">
<link href="common/css/regist.css" rel="stylesheet" media="all">
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

		<%
			for (String str : erre_msg) {
		%>
		<p><%=str%></p>
		<%
			}
		%>

		<div class="box">
			<p>会員登録</p>
		</div>
		<form id="user_data" action="RegisterForm" method="post">
			<table id="form_table">
				<tr class="">
					<th><label for="mail_address"><strong class="required">必須</strong>会員ID<span>（メールアドレス）</span></label>
					</th>
					<td><input type="email" name="login_id" maxlength="100"
						size="50" value="<%=registerUser.getLogin_id()%>"
						id="mail_address"> <br>
						 <%
						if (Integer.parseInt(registerUser.getMailsend_flg()) == 1) {
						%> 
						<input type="checkbox" id="mail_flg"
						value="<%=registerUser.getMailsend_flg()%>" name="mailsend_flg"
						checked>
						 <%
						} else {
						%> 
						<input type="checkbox" id="mail_flg"
						value="1" name="mailsend_flg">
						<% 
						}
						%> 
						<label for="mail_flg">メールマガジンを受け取る</label></td>
				</tr>
				<tr class="">
					<th><label for="password"><strong class="required">必須</strong>パスワード</label>
					</th>
					<td><input type="password" name="pass" maxlength="8" size="15"
						value="<%=registerUser.getPass()%>" id="password"> <span>※8文字</span></td>
				</tr>
				<tr class="">
					<th><label for="password_check"><strong
							class="required">必須</strong>パスワード<span>（確認）</span></label></th>
					<td><input type="password" name="pass_check" maxlength="8"
						size="15" value="<%=registerUser.getPass_check()%>"
						id="password_check"> <span>※8文字</span></td>
				</tr>
				<tr class="">
					<th><label for="familyname"><strong class="required">必須</strong>お名前</label>
					</th>
					<td><span>姓</span> <input type="text" name="name1"
						maxlength="30" size="15" value="<%=registerUser.getName1()%>"
						id="familyname"> <span>名</span> <input type="text"
						name="name2" maxlength="30" size="15"
						value="<%=registerUser.getName2()%>" id="firstname"></td>
				</tr>
				<tr class="">
					<th><label for="familynameKana"><strong
							class="required">必須</strong>フリガナ</label></th>
					<td><span>セイ</span> <input type="text" name="kana1"
						maxlength="30" size="15" value="<%=registerUser.getKana1()%>"
						id="familynameKana"> <span>メイ</span> <input type="text"
						name="kana2" maxlength="30" size="15"
						value="<%=registerUser.getKana2()%>" id="firstnameKana"></td>
				</tr>
				<tr class="">
					<th><label for="birth_date_year"><strong
							class="required">必須</strong>生年月日</label></th>
					<td><select name="b_year" id="birth_date_year">
							<option value="">--</option>

							<%
								for (int i = 0; 1900 + i <= 2020; i++) {
									if (1900 + i == Integer.parseInt(registerUser.getB_year())) {
							%>
							<option value="<%=1900 + i%>" selected><%=1900 + i%></option>

							<%
								} else {
							%>
							<option value="<%=1900 + i%>"><%=1900 + i%></option>
							<%
								}
								}
							%>

					</select> 年 <SELECT name="b_month">
							<option value="">--</option>
							<%
								for (int i = 0; 1 + i <= 12; i++) {
									if (1 + i == Integer.parseInt(registerUser.getB_month())) {
							%>
							<option value="<%=1 + i%>" selected><%=1 + i%></option>

							<%
								} else {
							%>
							<option value="<%=1 + i%>"><%=1 + i%></option>
							<%
								}
								}
							%>
					</SELECT> 月 <SELECT name="b_day">
							<option value="">--</option>
							<%
								for (int i = 0; 1 + i <= 31; i++) {
									if (1 + i == Integer.parseInt(registerUser.getB_day())) {
							%>
							<option value="<%=1 + i%>" selected><%=1 + i%></option>

							<%
								} else {
							%>
							<option value="<%=1 + i%>"><%=1 + i%></option>
							<%
								}
								}
							%>
					</select> 日</td>
				</tr>
				<tr class="">
					<th><label for="sex">性別</label></th>
					<td>
						<%
		if (str_sex_text.equals("男性")) {
			%> <input type="radio" name="sex" value="1" id="sex" checked>
						男性 <%
		} else {
		%> <input type="radio" name="sex" value="1" id="sex"> 男性 <%
		}
		
		if (str_sex_text.equals("女性")) {
			%> <input type="radio" name="sex" value="2" id="sex" checked>
						女性 <%
		} else {
		%> <input type="radio" name="sex" value="2" id="sex"> 女性 <%
		}
		
		if (str_sex_text.equals("未回答")) {
			%> <input type="radio" name="sex" value="0" id="sex" checked>
						未回答 <%
		} else {
		%> <input type="radio" name="sex" value="0" id="sex"> 未回答 <%
		}
		%>
					</td>
				</tr>
				<tr class="">
					<th><label for="zipcode3dgts">郵便番号<span>（半角数字）</span><strong
							class="required">必須</strong></label></th>
					<td class=""><input type="text" name="post_cd1" maxlength="3"
						size="5" value="<%=post_cd1%>" id="zipcode3dgts"> <span>-</span>
						<input type="text" name="post_cd2" maxlength="4" size="6"
						value="<%=post_cd2%>" id="zipcode4dgts"></td>
				</tr>
				<tr class="">
					<th><label for="prefecture"><strong class="required">必須</strong>都道府県</label>
					</th>
					<td><select name="address1" id="prefecture">
							<option value="" selected>--</option>

							<%
							for(String str_pref: Pref.PREF){
								if (str_pref.equals(registerUser.getAddress1())) {
							%>
							<option value="<%=str_pref%>" selected><%=registerUser.getAddress1()%></option>
							<%
								} else {
							%>
							<option value="<%=str_pref%>"><%=str_pref%></option>
							<%
								}
							}
							%>

					</select></td>
				</tr>
				<tr class="">
					<th><label for="address_1"><strong class="required">必須</strong>市区町村</label>
					</th>
					<td><input type="text" name="address2" maxlength="100"
						size="50" value="<%=registerUser.getAddress2()%>" id="address_1"></td>
				</tr>
				<tr class="">
					<th><label for="address_2"><strong class="required">必須</strong>番地</label>
					</th>
					<td><input type="text" name="address3" maxlength="100"
						size="50" value="<%=registerUser.getAddress3()%>" id="address_2"></td>
				</tr>
				<tr class="">
					<th><label for="address_3">ビル・マンション名</label></th>
					<td><input type="text" name="address4" maxlength="100"
						size="50" value="<%=registerUser.getAddress4()%>" id="address_3"></td>
				</tr>
				<tr class="">
					<th><label for="tel">電話番号<span>（半角数字）</span><strong
							class="required">必須</strong></label></th>
					<td class=""><input type="tel" name="tel1" maxlength="4"
						size="5" value="<%=tel1%>" id="telArea" title="市外局番"> <span>-</span>
						<input type="tel" name="tel2" maxlength="4" size="5"
						value="<%=tel2%>" id="telLocal" title="市内局番"> <span>-</span>
						<input type="tel" name="tel3" maxlength="4" size="5"
						value="<%=tel3%>" id="telNumber" title="加入者番号"></td>
				</tr>
			</table>
			<div id="regist_button">
				<input type="submit" value="確認">
			</div>
		</form>
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
