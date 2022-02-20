//
//  parsonal.swift
//  myaccount


import Foundation
import RealmSwift


//ユーザ情報クラス
class user: Object {
    //ユーザID
    @objc dynamic var id:String = "";
    //パスワード
    @objc dynamic var pass:String = "";
    //アプリ内のニックネーム
    @objc dynamic var name:String = "";
    //年齢
    @objc dynamic var age:String = "";
    //性別
    @objc dynamic var sex:Int8 = 0;
}

//財務情報(インカム)クラス
class moneyincome: Object {
    //貯金額
    @objc dynamic var saveingaumont:Int8 = 0;
    //月収額
    @objc dynamic var incomeperM:Int8 = 0;
    //その他収入
    @objc dynamic var incomeetc:Int8 = 0;
    //収入事由
    @objc dynamic var reason:String = "";

    
}

//財務情報(フロー)クラス
class moneyflow: Object {
    //家賃
    @objc dynamic var home:Int8 = 0;
    //電気
    @objc dynamic var elec:Int8 = 0;
    //水道代
    @objc dynamic var water:Int8 = 0;
    //ガス
    @objc dynamic var gas:Int8 = 0;
    //通信料(ケータイ代等)
    @objc dynamic var com:Int8 = 0;
    //保険料
    @objc dynamic var insure:Int8 = 0;
    //サブスク
    @objc dynamic var subsc:Int8 = 0;
}
//臨時　　カレンダークラス
class calender: Object {
    @objc dynamic var title = ""
    @objc dynamic var reason = ""
    @objc dynamic var memo = ""
    //yyyy.mm.dd
    @objc dynamic var date = ""
    @objc dynamic var value = 0
}

