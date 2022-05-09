//
//  NewfixedFee.swift
//  myaccount


import UIKit
import RealmSwift


class NewfixedFee: UIViewController {
    
    @IBOutlet weak var yachin: UITextField!
    @IBOutlet weak var denki: UITextField!
    @IBOutlet weak var suido: UITextField!
    @IBOutlet weak var gasu: UITextField!
    @IBOutlet weak var tushin: UITextField!
    @IBOutlet weak var hoken: UITextField!
    @IBOutlet weak var sonota: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func clicknext(_ sender: Any) {
        
        
        
        
        //配列を初期化
        var allText:[String] = []
        //入力されたテキストを配列に代入する
        allText.append(yachin.text!)
        allText.append(denki.text!)
        allText.append(suido.text!)
        allText.append(gasu.text!)
        allText.append(tushin.text!)
        allText.append(hoken.text!)
        allText.append(sonota.text!)
        
        for i in 1..<3 {
            //空文字チェック
            let results:[Int]  = function.checkNull(getallText: allText , getstate: i)
            //エラーフラグが立っていなければ登録処理
            if function.resultsCheck(getresults: results) == 0 {
                if i == 2 {
                    if function.newPriceRegister(getresults: function.chengeInt64(getallText: allText)) == 0 {
                        let alert = UIAlertController(title: "登録完了", message: "ユーザー情報の登録が完了しました。", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    //2回チェック
                    continue
                }
            } else {
                //空の場合からの部分のテキストボックスを赤くする
                for value in results {
                    switch(value){
                    case 1: yachin.backgroundColor = UIColor.red
                    case 2: denki.backgroundColor = UIColor.red
                    case 3: suido.backgroundColor = UIColor.red
                    case 4: gasu.backgroundColor = UIColor.red
                    case 5: tushin.backgroundColor = UIColor.red
                    case 6: hoken.backgroundColor = UIColor.red
                    case 7: sonota.backgroundColor = UIColor.red
                    default:break
                    }
                }
                //変数を初期化して、エラーメッセージを表示
                let alert = UIAlertController(title: "入力項目エラー", message: "入力項目が入力要件を満たしていません。金額は1文字から8文字の間で入力してください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
}
