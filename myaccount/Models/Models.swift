//
//  parsonal.swift
//  myaccount


import Foundation
import RealmSwift


//ユーザ情報クラス
class User: Object {
    //ユーザID
    @objc dynamic var id:String = "";
    //パスワード
    @objc dynamic var pass:String = "";
    //アプリ内のニックネーム
    @objc dynamic var name:String = "";
    //年齢
    @objc dynamic var age:String = "";
    //性別
    @objc dynamic var sex:String = "";
    //貯金額
    @objc dynamic var saveingaumont:String = "";
    //月収額
    @objc dynamic var incomeperM:String = "";
    //年収
    @objc dynamic var incomeperY:String = "";
    //年収
    @objc dynamic var staticreason:String = "";
    //年収
    @objc dynamic var incomeetc:Int64
    = 0;
    
    //テーブルリレーション設定
    
    // moneyflowモデルと1対1の関係
    @objc dynamic var MONEYFLOWS: moneyflow?
    
    let CALENDERS = List<calender>()
    //主キーの設定（必要な場合）
    override static func primaryKey() -> String? {
        return "id" // 主キーの名称
        
    }
}
//財務情報(フロー)クラス
class moneyflow: Object {
    //ユーザID
    @objc dynamic var id:String = "";
    //家賃
    @objc dynamic var home:Int64 = 0;
    //電気
    @objc dynamic var elec:Int64 = 0;
    //水道代
    @objc dynamic var water:Int64 = 0;
    //ガス
    @objc dynamic var gas:Int64 = 0;
    //通信料(ケータイ代等)
    @objc dynamic var com:Int64 = 0;
    //保険料
    @objc dynamic var insure:Int64 = 0;
    //サブスク
    @objc dynamic var subsc:Int64 = 0;
    
    let users = LinkingObjects(fromType: User.self, property: "MONEYFLOWS")
}

//臨時　　カレンダークラス
class calender: Object {
    //ユーザID
    @objc dynamic var id:String = ""
    //事由
    @objc dynamic var reason:String = ""
    //フラグ
    @objc dynamic var flag:String = ""
    //yyyy.mm.dd（年月日）
    @objc dynamic var date:String = ""
    //支出
    @objc dynamic var AmountOfMoney:Int64 = 0
    
    let users = LinkingObjects(fromType: User.self, property: "CALENDERS")
}







