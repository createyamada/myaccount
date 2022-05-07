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
        //ロード時はエラ〜メッセージ欄Aを非表示にする
        errorText.isHidden = true
        
    }
    //ボタンクリックイベント
    //テキストボックス入力値を変数に代入して、realmから検索
    @IBAction func bottonthouch(_ sender: Any) {
         g_id = ""
         g_pass = ""
        //ボタン押下でテキストボックスとエラーメッセージ欄を初期化するにする
        errorText.isHidden = true
        id.backgroundColor = UIColor.white
        pass.backgroundColor = UIColor.white
        
        //テキストボックスの内容を配列に格納する。
        var allText:[String] = []
        allText.append(id.text!)
        allText.append(pass.text!)
        //空文字チェック
        let results:[Int]  = function.checkNull(getallText: allText , getstate: 1)
        //エラーフラグがあるかチェック
        if function.resultsCheck(getresults: results) == 0 {
            //エラーフラグが立っていないならば登録処理を行う
            if function.userinfosearch(getid:id.text! , getpass:pass.text!) == 0{
                //メイン画面に遷移
                //次画面のストーリーボードを指定
                let storyboard: UIStoryboard = self.storyboard!
                //遷移先のコントローラーを指定
                let nextView = storyboard.instantiateViewController(withIdentifier: "g_main") as! g_main
                //遷移を行う
                self.present(nextView, animated: true, completion: nil)
            } else {
                //変数を初期化して、エラーメッセージを表示
                g_id = ""
                g_pass = ""
                let alert = UIAlertController(title: "入力項目エラー", message: "入力項目が入力要件を満たしていません。内容を入力してください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
        } else {
            //空の場合からの部分のテキストボックスを赤くする
            for value in results {
                switch(value){
                case 1: id.backgroundColor = UIColor.red
                case 2: pass.backgroundColor = UIColor.red
                default:break
                }
            }
            //変数を初期化して、エラーメッセージを表示
            g_id = ""
            g_pass = ""
            let alert = UIAlertController(title: "入力項目エラー", message: "入力項目が入力要件を満たしていません。内容を入力してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    //        var loginFlag:Int
    //        loginFlag = 0
    //        //テキストボックスから受けた値を変数に代入
    //        g_id = id.text!
    //        g_pass = pass.text!
    //        //関数から結果を受ける
    //        loginFlag = userinfosearch(id: g_id, pass: g_pass)
    //        //結果での分岐
    //        if loginFlag == 1{
    //            //メイン画面に遷移
    //            //次画面のストーリーボードを指定
    //            let storyboard: UIStoryboard = self.storyboard!
    //            //遷移先のコントローラーを指定
    //            let nextView = storyboard.instantiateViewController(withIdentifier: "g_main") as! g_main
    //            //遷移を行う
    //            self.present(nextView, animated: true, completion: nil)
    //        }else{
    //            //変数を初期化して、エラーメッセージを表示
    //            g_id = ""
    //            g_pass = ""
    //            errorText.isHidden = false
    //            errorText.textColor = UIColor.red
    //            errorText.text = "さては偽物だな!!"
    //
    //        }
    //    }
    //
    
    //
    
}
