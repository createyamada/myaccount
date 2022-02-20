//
//  income.swift
//  myaccount


import UIKit

var d_reason: String = ""
var d_aumont :Int8 = 0
class income: UIViewController {
    
    @IBOutlet weak var incomereason: UITextField!
    @IBOutlet weak var aumont: UITextField!
    @IBOutlet weak var reasonerror: UILabel!
    @IBOutlet weak var aumonterror: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
    
        

    }
    @IBAction func registerclick(_ sender: Any) {
        //テキストボックスが空だったお場合の処理
        if ((incomereason.text?.count) != nil){
            reasonerror.isHidden = true
            reasonerror.text = "収入事を入力してくれ！"
        }
        if ((aumonterror.text?.count) != nil){
            aumonterror.isHidden = true
            aumonterror.text = "金額を入力してくれ！"
        }
        
        //文字数の上限値を超えているかの確認を行う
        if ((incomereason.text!.count)  <= 17){
            reasonerror.isHidden = true
            reasonerror.text = "すまない16文字しか入力できないのだ。"
        }
        if ((aumonterror.text!.count) <=  8 ){
            aumonterror.isHidden = true
            aumonterror.text = "1000万は使いすぎだ、考え直せ！"
        }
        
        
        d_reason = incomereason.text!
        //string 型を　Int8型に変換して変数に代入
        let temp:String = aumont.text!
        d_aumont = Int8(temp)!
        
        //入力された捩る列、数字が正常であればデータをInsertするメソッド
        let reason_aumont = moneyincome()
        reason_aumont.reason = d_reason
        reason_aumont.incomeetc = d_aumont
        
        
        
        
    }

}
