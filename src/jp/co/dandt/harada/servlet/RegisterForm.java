/*****************************************************************************
 * 
 * 登録フォーム画面用サーブレット
 * 
 * 
 *****************************************************************************///

package jp.co.dandt.harada.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.dandt.harada.model.GetTime;
import jp.co.dandt.harada.model.User;

@WebServlet("/RegisterForm")
public class RegisterForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 登録画面へ遷移
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/WEB-INF/jp.co.dandt.harada.jsp/registerForm.jsp");
		dispatcher.forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// サーブレットの処理をするメソッド
		control(request, response);

	}

	// サーブレット内の処理
	static void control(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//  登録するユーザ情報をUserクラスに保存するメソッド
		User registerUser = saveUserData(request, response);

		// 入力値をチェックし、エラー内容によって遷移先のパスを返すメソッド
		String forwardPath = checkInputValue(registerUser, request, response);

		// セッションスコープに登録するユーザを保存
		HttpSession session = request.getSession();
		session.setAttribute("registerUser", registerUser);

		// リクエストスコープに連結前の値を保存
		request.setAttribute("post_cd1", request.getParameter("post_cd1"));
		request.setAttribute("post_cd2", request.getParameter("post_cd2"));
		request.setAttribute("tel1", request.getParameter("tel1"));
		request.setAttribute("tel2", request.getParameter("tel2"));
		request.setAttribute("tel3", request.getParameter("tel3"));

		// 数値の性別からテキスト性別に変換
		registerUser.sexToText();
		//  変換した性別をリクエストスコープに保存
		request.setAttribute("str_sex_text", registerUser.getFormatSex());

		// エラーメッセージがあれば各エラー画面にフォワードさせる
		if (forwardPath.length() >= 1) {

			RequestDispatcher dispatcher =
					request.getRequestDispatcher(forwardPath);
			dispatcher.forward(request, response);
			return;
		}

		// 入力確認画面にフォワード
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/WEB-INF/jp.co.dandt.harada.jsp/registerConfirm.jsp");
		dispatcher.forward(request, response);
	}	


	// 登録するユーザ情報をUserクラスに保存するメソッド
	static User saveUserData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// JSPからのリクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		String str_login_id = request.getParameter("login_id");
		String str_pass = request.getParameter("pass");
		String str_pass_check = request.getParameter("pass_check");
		String str_name1 = request.getParameter("name1");
		String str_name2 = request.getParameter("name2");
		String str_kana1 = request.getParameter("kana1");
		String str_kana2 = request.getParameter("kana2");
		String str_b_year = request.getParameter("b_year");
		String str_b_month = request.getParameter("b_month");
		String str_b_day = request.getParameter("b_day");
		String str_sex = request.getParameter("sex");
		String str_post_cd1 = request.getParameter("post_cd1");
		String str_post_cd2 = request.getParameter("post_cd2");
		String str_address1 = request.getParameter("address1");
		String str_address2 = request.getParameter("address2");
		String str_address3 = request.getParameter("address3");
		String str_address4 = request.getParameter("address4");
		String str_tel1 = request.getParameter("tel1");
		String str_tel2 = request.getParameter("tel2");
		String str_tel3 = request.getParameter("tel3");
		String str_mailsend_flg = request.getParameter("mailsend_flg");

		// チェックボックスがOFF(null)の場合の処理
		if (str_mailsend_flg == null) {
			str_mailsend_flg = "0";
		}

		// ラジオボタンが未選択(null)の場合の処理
		if (str_sex == null) {
			str_sex = "0";
		}

		// 生年月日が未選択の場合
		if (str_b_year.length() == 0) {
			str_b_year = "0";
		}

		if (str_b_month.length() == 0) {
			str_b_month = "0";
		}

		if (str_b_day.length() == 0) {
			str_b_day = "0";
		}

		// 入力値フォームから遷移した時に日時を取得
		GetTime get_now_time = new GetTime();
		String str_entry_ymd = get_now_time.getNowTime(); // 登録日
		String str_modified_ymd = str_entry_ymd; 		// 更新日

		int int_del_flg = 0;				// 削除フラグ

		//  登録するユーザの情報を設定
		User registerUser = new User(str_login_id, str_pass, str_pass_check, str_name1, str_name2, str_kana1, str_kana2, 
				str_b_year, str_b_month, str_b_day, str_sex, str_post_cd1+str_post_cd2, 
				str_address1, str_address2, str_address3, str_address4,
				str_tel1+str_tel2+str_tel3, str_mailsend_flg, str_entry_ymd, str_modified_ymd, int_del_flg);

		return registerUser;

	}	

	// フォームに入力された値をチェックし、結果によってフォワード先を設定するメソッド
	static String checkInputValue(User registerUser, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String forwardPath = "";

		// 入力値チェックメソッドの呼び出し
		registerUser.inputValueCheck();

		// エラーがあればメッセージをリクエストスコープに保存し、遷移先のパスを設定する
		if (registerUser.getErreMsg().size() > 0) {
			// エラーがあれば以下
			if (registerUser.getSystemErrorMsg().length() == 0) {
				request.setAttribute("erre_msg", registerUser.getErreMsg());
				// 登録入力error画面にフォワード
				forwardPath = "/WEB-INF/jp.co.dandt.harada.jsp/registerFormError.jsp";
			} else {
				request.setAttribute("system_erre_msg", registerUser.getSystemErrorMsg());
				// 共通error画面にフォワード
				forwardPath = "/WEB-INF/jp.co.dandt.harada.jsp/commonError.jsp";
			}
		}
		return forwardPath;
	}
}
