/*****************************************************************************
 * 
 * 登録結果画面用サーブレット
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


@WebServlet("/RegisterResult")
public class RegisterResult extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// サイトのトップへ遷移
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
