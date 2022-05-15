//
//  cleate.swift
//  myaccount


import UIKit
import RealmSwift

class cleate: UIViewController {
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var id: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerNext(_ sender: Any) {
        
        //入力テキストを格納する配列
        var allText:[String] = []
        allText.append(id.text!)
        allText.append(pass.text!)
        //空文字チェック
        let results:[Int] = function.checkNull(getallText: allText, getstate: 1)
        if function.resultsCheck(getresults: results) == 0{
            if(function.userinfosearch(getid: id.text!, getpass: pass.text!) == 1){
            if function.newIDRegister(getid: id.text!, getpass: pass.text!) == 0{
                //グローバル変数に値を代入
                g_id = id.text!
                g_pass = pass.text!
                //次画面のストーリーボードを指定

                let storyboard: UIStoryboard = self.storyboard!
                //遷移先のコントローラーを指定
                let nextView = storyboard.instantiateViewController(withIdentifier: "NewUserInfo") as! NewUserInfo
                //遷移を行う
                self.present(nextView, animated: true, completion: nil)
            }
            } else {
                //重複時の処理
                //変数を初期化して、エラーメッセージを表示
                g_id = ""
                g_pass = ""
                id.backgroundColor = UIColor.red
                pass.backgroundColor = UIColor.red
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
            let alert = UIAlertController(title: "入力項目エラー", message: "既に登録のある組み合わせです、修正してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
