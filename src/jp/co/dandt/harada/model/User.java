/*****************************************************************************
 * 
 * 登録情報を保存するクラス
 * 情報の入力値をチェックするメソッドを持つ
 * 
 *****************************************************************************/

package jp.co.dandt.harada.model;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User implements Serializable {

	private String login_id;	// ログインID(メールアドレス)
	private String pass;		// パスワード
	private String pass_check;		// 確認パスワード
	private String name1;		// 姓
	private String name2;		// 名
	private String kana1;		// セイ
	private String kana2;		// メイ
	private String b_year;			// 生年月日(年)
	private String b_month;		// 生年月日(月)
	private String b_day;			// 生年月日(日)
	private String sex;			// 性別(0:未回答、1:男性、2:女性)
	private String post_cd;		// 郵便番号
	private String address1;	// 都道府県
	private String address2;	// 市区町村
	private String address3;	// 番地
	private String address4;	// ビル・マンション名
	private String tel;			// 電話番号
	private String mailsend_flg;	// メール受取フラグ(0:非受取、1:受取)
	private String entry_ymd;	// 登録日
	private String modified_ymd;// 更新日
	private int del_flg;		// 削除フラグ(1:削除)

	// 正規表現の定数
	private final String PATTERN_A ="^[a-zA-Z]+$";
	private final String PATTERN_1 ="^[0-9]+$";
	private final String PATTERN_KANA ="^[ァ-ヶ]+$";
	private final String PATTERN_MAIL = "^[a-zA-Z0-9!#$%&'_`/=~\\*\\+\\-\\?\\^\\{\\|\\}]+(\\.[a-zA-Z0-9!#$%&'_`/=~\\*\\+\\-\\?\\^\\{\\|\\}]+)*+(.*)@[a-zA-Z0-9][a-zA-Z0-9\\-]*(\\.[a-zA-Z0-9\\-]+)+$";

	// 入力値エラーメッセージ
	private List<String> erre_msg = new ArrayList<String>();

	// システムエラーメッセージ(DBの接続によるエラー等)
	private String s_error_msg;

	private String str_format_sex;		// 文字列変換性別

	/////////////////////////////////////////

	public User() {}

	// newした時に必要な引数
	public User(String login_id, String pass, String pass_check, String name1, String name2, String kana1, String kana2, 
			String b_year, String b_month, String b_day, String sex, String post_cd, String address1, String address2,
			String address3, String address4, String tel, String mailsend_flg, String entry_ymd, String modified_ymd,
			int del_flg) {
		this.login_id = login_id;
		this.pass = pass;
		this.pass_check = pass_check;
		this.name1 = name1;
		this.name2 = name2;
		this.kana1 = kana1;
		this.kana2 = kana2;
		this.b_year = b_year;
		this.b_month = b_month;
		this.b_day = b_day;
		this.sex = sex;
		this.post_cd = post_cd;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.address4 = address4;
		this.tel = tel;
		this.mailsend_flg = mailsend_flg;
		this.entry_ymd = entry_ymd;
		this.modified_ymd = modified_ymd;
		this.del_flg = del_flg;
	}

	// セッタ、ゲッタ
	public String getLogin_id() { 
		return login_id; 
	}
	public void setLogin_id(String login_id) { 
		this.login_id = login_id; 
	}

	public String getPass() {
		return pass; 
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPass_check() { 
		return pass_check; 
	}
	public void setPass_check(String pass_check) {
		this.pass_check = pass_check; 
	}

	public String getName1() { 
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getName2() {
		return name2; 
	}
	public void setName2(String name2) {
		this.name2 = name2; 
	}

	public String getKana1() {
		return kana1; 
	}
	public void setKana1(String kana1) {
		this.kana1 = kana1; 
	}

	public String getKana2() {
		return kana2; 
	}
	public void setKana2(String kana2) {
		this.kana2 = kana2;
	}

	public String getB_year() {
		return b_year;
	}
	public void setB_year(String b_year) {
		this.b_year = b_year;
	}

	public String getB_month() {
		return b_month; 
	}
	public void setB_month(String b_month) {
		this.b_month = b_month;
	}

	public String getB_day() {
		return b_day;
	}
	public void setB_day(String b_day) {
		this.b_day = b_day;
	}

	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPost_cd() {
		return post_cd;
	}
	public void setPost_cd(String post_cd) {
		this.post_cd = post_cd;
	}

	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getAddress4() {
		return address4;
	}
	public void setAddress4(String address4) {
		this.address4 = address4;
	}

	public String getTel() {
		return tel; 
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMailsend_flg() {
		return mailsend_flg;
	}
	public void setMailsend_flg(String mailsend_flg) {
		this.mailsend_flg = mailsend_flg;
	}

	public String getEntry_ymd() {
		return entry_ymd;
	}
	public void setEntry_ymd(String entry_ymd) {
		this.entry_ymd = entry_ymd;
	}

	public String getModified_ymd() {
		return modified_ymd;
	}
	public void setModified_ymd(String modified_ymd) {
		this.modified_ymd = modified_ymd;
	}

	public int getDel_flg() {
		return del_flg; 
	}
	public void setDel_flg(int del_flg) {
		this.del_flg = del_flg;
	}


	// 入力値のチェックメソッド
	public void inputValueCheck() {

		s_error_msg = "";

		requiredItem();
		loginIdCheck();
		passCheck();
		kanaCheck();
		post_cdCheck();
		telCheck();
	}

	// 必須入力
	void requiredItem() {

		if (login_id.length() == 0) {
			erre_msg.add("ログインIDは必須項目です。");
		}

		if (pass.length() == 0) {
			erre_msg.add("パスワードは必須項目です。");
		}

		if (pass_check.length() == 0) {
			erre_msg.add("確認パスワードは必須項目です。");
		}

		if (name1.length() == 0) {
			erre_msg.add("お名前(姓)は必須項目です。");
		}

		if (name2.length() == 0) {
			erre_msg.add("お名前(名)は必須項目です。");
		}

		if (kana1.length() == 0) {
			erre_msg.add("フリガナ(セイ)は必須項目です。");
		}

		if (kana2.length() == 0) {
			erre_msg.add("フリガナ(メイ)は必須項目です。");
		}

		if (b_year.length() == 0) {
			erre_msg.add("生年月日(年)は必須項目です。");
		}

		if (b_month.length() == 0) {
			erre_msg.add("生年月日(月)は必須項目です。");
		}

		if (b_day.length() == 0) {
			erre_msg.add("生年月日(日)は必須項目です。");
		}

		if (post_cd.length() == 0) {
			erre_msg.add("郵便番号は必須項目です。");
		}

		if (address1.length() == 0) {
			erre_msg.add("都道府県は必須項目です。");
		}

		if (address2.length() == 0) {
			erre_msg.add("市区町村は必須項目です。");
		}

		if (address3.length() == 0) {
			erre_msg.add("番地は必須項目です。");
		}

		if (tel.length() == 0) {
			erre_msg.add("電話番号は必須項目です。");
		}
	}

	// ログインID(メールアドレス)のチェック
	void loginIdCheck() {

		// 正規表現
		if (!login_id.matches(PATTERN_MAIL)) {
			erre_msg.add("ログインIDが正しく入力されていません。");
		}

		// 同一のメールアドレスが存在するか
		RegisterUserLogic logic = new RegisterUserLogic();
		try {
			boolean bool_post_result = logic.isSameLoginId(login_id);

			if (bool_post_result) {
				erre_msg.add("ログインID「"+login_id+"」はすでに登録されています。");
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			s_error_msg = "システムエラーが発生しました。管理者に問い合わせてください。";
		} 
	}

	// パスワードのチェック
	void passCheck() {

		String str = "";
		boolean flg_a = false;
		boolean flg_1 = false;

		// 8文字必須
		if (!(pass.length() == 8)) {
			erre_msg.add("パスワードは8文字必要です。");
		}

		// 一文字でも英文字、数字が含まれるか
		for(int i = 0; i < pass.length(); i++){

			str = String.valueOf(pass.charAt(i));

			if (str.matches(PATTERN_A)) {
				flg_a = true;
			}

			if (str.matches(PATTERN_1)) {
				flg_1 = true;
			}

			if (flg_a && flg_1) {
				break;
			}
		}

		if (!flg_a) {
			erre_msg.add("パスワードには一文字以上の英文字が必要です。");
		}

		if (!flg_1) {
			erre_msg.add("パスワードには一文字以上の数字が必要です。");
		}

		// 確認パスワードと一致するか
		if (!(pass.equals(pass_check))) {
			erre_msg.add("パスワードが一致しません。再度、確認用パスワードを入力してください。");
		}
	}

	// 名前(フリガナ)のチェック
	void kanaCheck() {

		if (!kana1.matches(PATTERN_KANA)) {
			erre_msg.add("フリガナ(セイ)はカタカナで入力してください。");
		}

		if (!kana2.matches(PATTERN_KANA)) {
			erre_msg.add("フリガナ(メイ)はカタカナで入力してください。");
		}

	}

	// 郵便番号のチェック
	void post_cdCheck() {

		// 7文字必須
		if (!(post_cd.length() == 7)) {
			erre_msg.add("郵便番号は7文字必要です。");
		}

		// 数字のみ
		if (!post_cd.matches(PATTERN_1)) {
			erre_msg.add("郵便番号には数字のみ入力してください。");
		}
	}

	//　電話番号のチェック 
	void telCheck() {

		// 7文字必須
		if (!(tel.length() == 11)) {
			erre_msg.add("電話番号は11文字必要です。");
		}

		// 数字のみ
		if (!tel.matches(PATTERN_1)) {
			erre_msg.add("電話番号には数字のみ入力してください。");
		}
	}

	// 性別を数値で判断し文字列を設定(0:未回答、1:男性、2:女性)
	public void sexToText() {

		str_format_sex = "";

		switch (Integer.parseInt(sex)) {

		case 0:
			str_format_sex = "未回答";
			break;

		case 1:
			str_format_sex = "男性";
			break;

		case 2:
			str_format_sex = "女性";
			break;
		}
	}


	// エラーメッセージを取得
	public List<String> getErreMsg() {
		return new ArrayList<String>(erre_msg);
	}

	// システムエラーメッセージを取得
	public String getSystemErrorMsg() {
		return s_error_msg;
	}

	// 文字列に変換した性別を取得
	public String getFormatSex() {
		return str_format_sex;
	}
}
