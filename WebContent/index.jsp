<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ page import="jp.co.dandt.harada.model.Pref"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>マッチングサイト</title>
<link href="common/css/base.css" rel="stylesheet" media="all">
<link href="common/css/top.css" rel="stylesheet" media="all">
</head>

<body>

<!-- ヘッダー -->
<header>
  <div class="inner clearfix">
    <h1 id="logo"><a href="#"><img src="common/img/スクリーンショット 2017-04-04 0.16.07.png" alt="ロゴ"></a></h1>
    <ul id="header_link">
      <li><a href="#" target="_blank">▶︎企業様はこちら</a>&nbsp;&nbsp;|</li>
      <li><a href="#" target="_blank">▶︎学校様はこちら</a></li>
    </ul>
  </div>
  <!-- /.inner --> 
</header>

<!-- グロバナビ -->
<nav id="gnav">
  <ul class="inner">
    <li><a href="#">参加校紹介</a></li>
    <li><a href="#">検索</a></li>
    <li><a href="#">特集</a></li>
    <li><a href="#">イベント</a></li>
    <li><a href="#">就職支援</a></li>
    <li><a href="#">マイページ</a></li>
  </ul>
</nav>
<div id="top_contents">
  <div class="inner">
    <div id="mv"> <img src="common/img/0308.jpg"> </div>
    <!-- /#mv --> 
  </div>
  <!-- /.inner --> 
</div>
<!-- #.top_contents--> 

<!-- コンテンツ -->
<div id="contents" class="clearfix"> 
  
  <!-- メイン部分 -->
  <main>
    <section id="section_1">
      <h2>探す</h2>
      <hr class="section_line">
      <form id="search_free_word" action="#" method="post">
        <input type="text" name="free_word" placeholder="企業名や学校名を入力してください">
        <input type="submit" value="検索">
      </form>
      <form id="search_area" action="#" method="post">
        <select name="area">
          <option value="" selected>選択してください</option>
          
          <%
			for(String str_pref: Pref.PREF) {
			%>
							<option value="<%=str_pref%>"><%=str_pref%></option>
							<%
			}
			%>
          
        </select>
        <input type="submit" value="検索">
      </form>
    </section>
    <section id="section_2" >
      <h2>注目度が急上昇した企業</h2>
      <hr class="section_line">
      <div class="upward_company"> <img src="common/img/スクリーンショット 2017-03-06 23.27.57.png">
        <h3><a href="#">有限会社アゼリシステム</a></h3>
        <p>まずチェックしておきたい大手有力企業を業種別にご紹介。</p>
      </div>
      <div class="upward_company"> <img src="common/img/スクリーンショット 2017-03-06 23.29.52.png">
        <h3><a href="#">有限会社ディーアンドティー</a></h3>
        <p>企業選びで悩んでいる女子必見！女子学生に人気の企業ほか</p>
      </div>
    </section>
    <section id="section_3">
      <h2>トピックス</h2>
      <hr class="section_line">
      <ul class="link-list">
        <li><a href="#" target="_blank">グローバルなフィールドで果敢に挑戦！</a></li>
        <li><a href="#" target="_blank">NTT東日本の大好評イベント予約受付中！</a></li>
        <li><a href="#" target="_blank">世界で通用する人材へ◆3/19特別説明会</a></li>
        <li><a href="#" target="_blank">選考開催中◆大手優良企業はこちら！</a></li>
        <li><a href="#" target="_blank">＜野村證券＞採用イベント 予約受付開始！</a></li>
      </ul>
    </section>
    <section id="section_4">
      <h2>オススメの積極採用</h2>
      <hr class="section_line">
      <a href="#"><img src="common/img/スクリーンショット 2017-03-08 16.39.11.png"></a>
      <p>有力企業グループ特集からグループ企業を一覧でご確認いただけます！
        あまり知られていない子会社を発見したい方や安定性を重視する方にオススメです。</p>
    </section>
  </main>
  
  <!-- サイドバー -->
  <div id="side">
    <div class="login">
      <hr class="side_line">
      <h2>会員ログイン</h2>
      <form id="toppage_login" action="RegisterForm" method="get">
        <ul class="login-menu">
          <li>
            <input type="text" name="memberId" placeholder="会員ID [半角英数字]">
          </li>
          <li>
            <input type="password" name="password" placeholder="パスワード [半角英数字]">
          </li>
        </ul>
        <p>
          <input type="checkbox" name="autoLogin" value="on" id="autoLogin">
          <label for="autoLogin" class="label-check">ログイン状態を保持する</label>
        </p>
        <ul class="list-btn">
          <li>
            <input type="submit" value="ログイン">
          </li>
          <li>
            <input type="submit" value="会員登録">
          </li>
        </ul>
         </form>
      <p><a href="#">会員ＩＤまたはパスワードがご不明な方</a></p>
    </div>
    <!-- /.login --> 
  </div>
  <!-- /#side --> 
  
</div>
<!-- /#contents --> 

<!-- フッター -->
<footer id="footer">
  <hr class="footer_line">
  <div class="inner">
    <nav id="f_gnav">
      <ul class="clearfix">
        <li class="f_nav"><a href="/">HOME</a></li>
        <li class="f_nav"><a href="#">参加校紹介</a>
          <ul class="f_snav">
            <li><a href="#">コース紹介</a></li>
            <li><a href="#">カリキュラムの紹介</a></li>
            <li><a href="#">先輩の声</a></li>
          </ul>
        </li>
        <li class="f_nav"><a href="#">検索</a>
          <ul class="f_snav">
            <li><a href="#">キーワードで探す</a></li>
            <li><a href="#">エリアから探す</a></li>
          </ul>
        </li>
        <li class="f_nav"><a href="#">イベント</a>
          <ul class="f_snav">
            <li><a href="#">就活イベント一覧</a></li>
          </ul>
        </li>
        <li class="f_nav"><a href="#">特集</a>
          <ul class="f_snav">
            <li><a href="#">働き方を知る</a></li>
            <li><a href="#">業界特集</a></li>
            <li><a href="#">対象学生別特集</a></li>
          </ul>
        </li>
        <li class="f_nav"><a href="#">就活支援</a>
          <ul class="f_snav">
            <li><a href="#">就活準備</a></li>
            <li><a href="#">就活ノウハウ</a></li>
            <li><a href="#">就活力アップ</a></li>
          </ul>
        </li>
        <li class="f_nav"><a href="#">マイページ</a>
          <ul class="f_snav">
            <li><a href="#">新着通知</a></li>
            <li><a href="#">お気に入り</a></li>
            <li><a href="#">コミュニティ</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
  <!-- /.inner -->
  
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
