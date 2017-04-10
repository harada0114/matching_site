/*****************************************************************************
 * 
 * JSPにアウトプットするメッセージクラス
 * 登録結果用メッセージメソッドを持つ
 * 
 *****************************************************************************/

package jp.co.dandt.harada.model;

public class TextMsg {

	// 登録結果メッセージ
	public String registerUserMsg (boolean bool_post_result) {

		String str_msg = "";

		if (bool_post_result) {
			str_msg = "登録が完了しました。";

		} else {
			str_msg = "登録に失敗しました。";
		}

		return str_msg;

	}

}
