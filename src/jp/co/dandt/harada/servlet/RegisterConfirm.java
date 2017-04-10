/*****************************************************************************
 * 
 * 登録確認画面用サーブレット
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

import jp.co.dandt.harada.model.RegisterUserLogic;
import jp.co.dandt.harada.model.TextMsg;
import jp.co.dandt.harada.model.User;


@WebServlet("/RegisterConfirm")
public class RegisterConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String String = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 登録確認画面に遷移する
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/WEB-INF/jp.co.dandt.harada.jsp/registerConfirm.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// サーブレットの処理をするメソッド
		control(request, response);

	}

	// サーブレット内の処理
	void control(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// セッションスコープに保存された登録ユーザを取得
		HttpSession session = request.getSession();
		User registerUser = (User) session.getAttribute("registerUser");

		// DBに接続しユーザを登録するメソッド
		String str_result_msg = upUserData(registerUser);

		// 登録結果用のメッセージをリクエストスコープに保存
		request.setAttribute("error_msg", str_result_msg);

		// ユーザ情報はもう必要ないので、保存していたセッションスコープを削除
		session.removeAttribute("registerUser");

		// 登録結果画面に遷移
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/WEB-INF/jp.co.dandt.harada.jsp/registerResult.jsp");
		dispatcher.forward(request, response);	

	}
	
	// ユーザ情報を登録するメソッド 
	 String upUserData(User registerUser) {

		String str_result_msg = "";

		// DB登録処理の呼び出し、戻り値(bool型)で成功したか判断する。
		RegisterUserLogic logic = new RegisterUserLogic();
		boolean bool_post_result = logic.isRegisterUser(registerUser);

		// DB登録結果用のメッセージの呼び出し
		TextMsg str_msg = new TextMsg();
		return str_result_msg = str_msg.registerUserMsg(bool_post_result);

	}

}
