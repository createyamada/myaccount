//
//  function.swift
//  myaccount
//
//  Created by updateyamada on 2021/11/28.
//

import Foundation
import RealmSwift



class function: NSObject {
    
    //ログイン情報からnameを取得する
    //@ param id idに入力した値
    //@ param pass passに入力した値
    //戻り値　結果(name)
    class func searchName(id:String ,pass:String) -> String {
        var name: String = ""
        
        let realm = try!Realm()
        
        let Items = realm.objects(user.self).filter("id == %@",g_id).filter("pass == %@",g_pass)
        for user in Items {
            name = user.name
        }
        
        
        return name
    }

    
    //ログイン情報が正しいか判定するメソッド(ログイン画面)
    //@ param id idに入力した値
    //@ param pass passに入力した値
    //戻り値　結果(存在すれば０、しなければ１)
    class func userinfosearch(getid:String,getpass:String) -> Int {
        
        //realmの条件検索によっていIDとパスワードが一致するものがあるか検索
        let realm = try! Realm()
        let items =  realm.objects(user.self).filter("id == %@",g_id).filter("pass == %@",g_pass)
        if items.count >= 1 {
            //IDとパスワードが同じものがあればTRUEを返す
            return  0
        } else {
            //１つもなければFALSEを返す
            return  1
        }
        
    }
    
    
    //入力した費用情報を保存するメソッド（ログイン画面）
    //@ param id idに入力した値
    //@ param pass passに入力した値
    //戻り値　結果(存在すれば０、しなければ１)
    class func newPriceRegister(getresults:Array<Int8>) -> Int {
        let realm = try! Realm()
        //user型のオブジェクトを生成
        let c_moneyflow = user()
        
        for value in getresults {
            switch value {
            case 0: c_moneyflow.home = getresults[0]
            case 1: c_moneyflow.elec = getresults[1]
            case 2: c_moneyflow.water = getresults[2]
            case 3: c_moneyflow.gas = getresults[3]
            case 4: c_moneyflow.com = getresults[4]
            case 5 : c_moneyflow.insure = getresults[5]
            case 6 : c_moneyflow.subsc = getresults[6]
            default: break
            }
        }
        do{
            try! realm.write {
                //データベースの登録
                realm.add(c_moneyflow)
            }
        }catch {
            return 1
        }
        return 0
    }
    
    //入力した費用情報を更新するメソッド（ログイン画面）
    //@ param id idに入力した値
    //@ param pass passに入力した値
    //戻り値　結果(存在すれば０、しなければ１)
    class func PriceUpdate(getresults:Array<Int8>) -> Int {
        let realm = try! Realm()
        let targets = realm.objects(user.self).filter("id == %@",g_id)
        do{
          try realm.write{
              var counter:Int = 0
              for value in getresults{
                          switch value {
                          case 0: targets[0].home = getresults[0]
                          case 1: targets[1].elec = getresults[1]
                          case 2: targets[2].water = getresults[2]
                          case 3: targets[3].gas = getresults[3]
                          case 4: targets[4].com = getresults[4]
                          case 5 : targets[5].insure = getresults[5]
                          case 6 : targets[6].subsc = getresults[6]
                          default: break
                          }
//                  case 0:value.home = 0
//                  case 1:value.home = 0
//                  case 2:value.home = 0
//                  case 3:value.home = 0
//                  case 4:value.home = 0
//                  case 5:value.home = 0
//                  case 6:value.home = 0
//                  default:break
//                  }
//                  counter += 1
                  }
          }
        }catch {
          print("Error \(error)")
        }
        return 0
    }
    
    
    //入力情報を登録するメソッド（新規作成ID画面）
    //@ param id idに入力した値
    //@ param pass passに入力した値
    //戻り値　結果(存在すれば０、しなければ１)
    class func newIDRegister(getid:String,getpass:String) -> Int {
        let realm = try! Realm()
        //user型のオブジェクトを生成
        let c_user = user()
        //登録処理
        do{
            try realm.write{
                c_user.id = getid
                c_user.pass = getpass
                realm.add(c_user)
            }
        }catch {
            return 1
        }
        return 0
        
    }
    
    //入力情報を登録するメソッド（支出登録画面）
    //@ param id idに入力した値
    //@ param pass passに入力した値
    //戻り値　結果(存在すれば０、しなければ１)
    class func newOutRegister(getitle:String,getactivereson:String , getmamo:String ,getdate:String) -> Int {
        let realm = try! Realm()
        let eventModel = user()
        //登録処理
        do{
            try! realm.write{
                eventModel.title = getitle
                eventModel.activereason = getactivereson
                eventModel.memo = getmamo
                eventModel.date =  getdate
                realm.add(eventModel)
            }
        }catch{
            return 1
        }
        return 0
    }
    
    
    //配列の中にエラーフラグが立っているかを確認するメソッド
    //@ param id idに入力した値
    //戻り値　結果(あれば０、なければ１)
    class func resultsCheck(getresults:Array<Int>) -> Int {
        
        for value in getresults {
            if value == 0{
                continue
            } else {
                //０以外の値(エラーフラグがあれば1を返す)
                return 1
            }
        }
        return 0
    }
    
    
    
    
    //テキストボックスの値を持った配列をからかどうか判定するメソッド
    //@ param allText 画面内のテキストボックスの値を持った配列
    //@ param case どの検査か
    //戻り値　結果を格納した配列（どの値が空だったのかの情報を持っている）
    
    class func checkNull(getallText:Array<String> ,  getstate:Int) -> Array<Int>  {
        var results:[Int] = []
        var counter:Int = 1
        for value in getallText {
            switch(getstate){
            case 1:
                //配列の内容がからならエラーフラグ（内容に紐づいた値を入れる）
                if value.count == 0 || value == "" {
                    results.append(counter)
                }
            case 2:
                //配列の内容が、指定文字数以上ならエラーフラグ（内容に紐づいた値を入れる）
                if value.count <= 8 {
                    results.append(counter)
                }
                
                //カウンターをインクリメント
                counter = counter + 1
            default:
                break
            }
        }
        return results
    }
    
    
    //配列内のInt型の変数を全てInt8型に変換する
    //@ param allText 画面内のテキストボックスの値を持った配列
    //戻り値　Int8型に変換した配列
    class func chengeInt8(getallText:Array<String>) -> Array<Int8>  {
        var one:[Int] = []
        var two:[Int8] = []
        for value in getallText{
            one.append(Int(value)!)
        }
        for value in one{
            two.append(Int8(value))
        }
        return two
    }
    
    //受け取った数値にて性別を文字に変換する
    //@ param getNumber 画面にて入力された性別の情報をもつInt変数
    //戻り値　String型の変数(0＝男性、1＝女性、2＝その他)
    class func sexchange(getNumber:Int) -> String  {
        switch(getNumber){
        case 0: return "男性"
        case 1: return "女性"
        case 2: return "その他"
        default:break
        }
        return "errror"
    }
    
}

