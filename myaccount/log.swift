//
//  log.swift
//  myaccount


import UIKit
import RealmSwift

class log: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ロード時はエラ〜メッセージ欄を非表示にする
        errorText.isHidden = true

    }
    //ボタンクリックイベント
    //テキストボックス入力値を変数に代入して、realmから検索
    @IBAction func bottonthouch(_ sender: Any) {
        
        var loginFlag:Int
        loginFlag = 0
        //テキストボックスから受けた値を変数に代入
        g_id = id.text!
        g_pass = pass.text!
        //関数から結果を受ける
        loginFlag = userinfosearch(id: g_id, pass: g_pass)
        //結果での分岐
        if loginFlag == 1{
            //メイン画面に遷移
            //次画面のストーリーボードを指定
            let storyboard: UIStoryboard = self.storyboard!
            //遷移先のコントローラーを指定
            let nextView = storyboard.instantiateViewController(withIdentifier: "g_main") as! g_main
            //遷移を行う
            self.present(nextView, animated: true, completion: nil)
        }else{
            //変数を初期化して、エラーメッセージを表示
            g_id = ""
            g_pass = ""
            errorText.isHidden = false
            errorText.textColor = UIColor.red
            errorText.text = "さては偽物だな!!"
            
        }
    }

    //引数で受けたあたいのユーザIDとパスワードの組み合わせをrealmで検索して、int型で結果を返す関数
    func userinfosearch(id:String,pass:String) ->Int {

        //realmの条件検索によっていIDとパスワードが一致するものがあるか検索
        let realm = try! Realm()
        let items =  realm.objects(user.self).filter("id == %@",g_id).filter("pass == %@",g_pass)
        if items.count >= 1 {
            //IDとパスワードが同じものがあればTRUEを返す
            return  1
        } else {
            //１つもなければFALSEを返す
            return  0
        }
        
    }
    

}
