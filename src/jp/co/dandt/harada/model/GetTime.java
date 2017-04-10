/*****************************************************************************
 * 
 * 時間を取得するクラス
 * 現在時刻を取得し、日付フォーマットした文字列を返すメソッドを持つ
 * 
 *****************************************************************************/


package jp.co.dandt.harada.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetTime {
	
	public String getNowTime() {

	// 現在日時取得
	Date nowDate = new Date();
	
	// Date→文字列フォーマットにする
	DateFormat timestampFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	String str = timestampFormat.format(nowDate);

	return str;
	
	}
}
