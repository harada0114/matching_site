<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="jp.co.dandt.harada.model.User"%>

<% User registerUser = (User) session.getAttribute("registerUser"); %>
<% String post_cd1 = (String) request.getAttribute("post_cd1"); %>
<% String post_cd2 = (String) request.getAttribute("post_cd2"); %>
<% String tel1 = (String) request.getAttribute("tel1"); %>
<% String tel2 = (String) request.getAttribute("tel2"); %>
<% String tel3 = (String) request.getAttribute("tel3"); %>
<% String str_sex_text = (String) request.getAttribute("str_sex_text"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>確認</title>
<link href="common/css/base.css" rel="stylesheet" media="all">
<link href="common/css/regist.css" rel="stylesheet" media="all">
<script>
window.onunload = function() {};
history.forward();
</script>

</head>

<body>

<!-- ヘッダー -->
<header>
  <div class="inner clearfix">
    <h1 id="logo"><a href="#"><img src="common/img/スクリーンショット 2017-04-04 0.16.07.png" alt="ロゴ"></a></h1>
  </div>
  <!-- /.inner --> 
</header>
<div id="contents">
  <div class="box">
    <p>下記の内容で登録します</p>
  </div>
  <form id="user_data" action="RegisterConfirm" method="post">
    <table id="form_table">
      <tr class="">
        <th> <label for="mail_address">会員ID<span>（メールアドレス）</span></label>
        </th>
        <td><%= registerUser.getLogin_id() %>
          <% 
          String str_send_msg = "";
 
          if (registerUser.getMailsend_flg().equals("1")) {
        	  str_send_msg = "メールマガジンを受け取る";
          } else {
        	  str_send_msg = "メールマガジンを受け取らない";
          }
          %>
          <p><%= str_send_msg %></p>
          </td>
      </tr>
      <tr class="">
        <th> <label for="password">パスワード</label>
        </th>
        <td>非表示</td>
      </tr>
      <tr class="">
        <th> <label for="familyname">お名前</label>
        </th>
        <td><span>姓：</span><%= registerUser.getName1() %><br>
          <span>名：</span><%= registerUser.getName2() %>
          </td>
      </tr>
      <tr class="">
        <th> <label for="familynameKana">フリガナ</label>
        </th>
        <td><span>セイ：</span><%= registerUser.getKana1() %><br>
          <span>メイ：</span><%= registerUser.getKana2() %>
          </td>
      </tr>
      <tr class="">
        <th> <label for="birth_date_year">生年月日</label>
        </th>
        <td>
          <%= registerUser.getB_year() %>年
          <%= registerUser.getB_month() %>月
          <%= registerUser.getB_day() %>日 </td>
      </tr>
      <tr class="">
        <th> <label for="sex">性別</label>
        </th>
        <td><%= str_sex_text %></td>
      </tr>
      <tr class="">
        <th> <label for="zipcode3dgts">郵便番号</label>
        </th>
        <td class=""><%= post_cd1 %>-<%= post_cd2 %></td>
      </tr>
      <tr class="">
        <th> <label for="prefecture">都道府県</label>
        </th>
        <td><%= registerUser.getAddress1() %></td>
      </tr>
      <tr class="">
        <th> <label for="address_1">市区町村</label>
        </th>
        <td><%= registerUser.getAddress2() %></td>
      </tr>
      <tr class="">
        <th> <label for="address_2">番地</label>
        </th>
        <td><%= registerUser.getAddress3() %></td>
      </tr>
      <tr class="">
        <th><label for="address_3">ビル・マンション名</label>
        </th>
        <td><%= registerUser.getAddress4() %></td>
      </tr>
      <tr class="">
        <th> <label for="tel">電話番号</label>
        </th>
        <td class=""><%= tel1 %>-<%= tel2 %>-<%= tel3 %></td>
      </tr>
    </table>
    <div id="regist_button">
    	<input type="button" value="戻る" onClick="location.href='RegisterForm'"><!-- doGetになる -->
    	<input type="submit" value="登録"><!-- doPostになる -->
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
      <p class="copyright"><small>© 2013-2016 有限会社アゼリシステム</small></p>
    </div>
    <!-- /.inner --> 
  </div>
  <!-- /.footer_bottom --> 
</footer>
</body>
</html>