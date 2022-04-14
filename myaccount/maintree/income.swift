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
        
        
        //配列を初期化
        var allText:[String] = []
        //入力されたテキストを配列に代入する
        allText.append(incomereason.text!)
        allText.append(aumont.text!)
        
        //空文字チェック
        let results:[Int]  = function.checkNull(getallText: allText , getstate: 1)
        //エラーフラグが立っていなければ登録処理
        if function.resultsCheck(getresults: results) == 0 {
            if function.newPriceRegister(getresults: function.chengeInt8(getallText: allText)) == 0 {
            let alert = UIAlertController(title: "タイトル", message: "アラートのメッセージです。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
            }
            
            
            
        } else {
            //空の場合からの部分のテキストボックスを赤くする
            for value in results {
                switch(value){
                case 1: incomereason.backgroundColor = UIColor.red
                case 2: aumont.backgroundColor = UIColor.red
                default:break
                }
            }
            //変数を初期化して、エラーメッセージを表示
                        g_id = ""
                        g_pass = ""
            let alert = UIAlertController(title: "入力項目エラー", message: "入力項目が入力要件を満たしていません。金額は1文字から8文字の間で入力してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
//        //テキストボックスが空だったお場合の処理
//        if ((incomereason.text?.count) != nil){
//            reasonerror.isHidden = true
//            reasonerror.text = "収入事を入力してくれ！"
//        }
//        if ((aumonterror.text?.count) != nil){
//            aumonterror.isHidden = true
//            aumonterror.text = "金額を入力してくれ！"
//        }
//
//        //文字数の上限値を超えているかの確認を行う
//        if ((incomereason.text!.count)  <= 17){
//            reasonerror.isHidden = true
//            reasonerror.text = "すまない16文字しか入力できないのだ。"
//        }
//        if ((aumonterror.text!.count) <=  8 ){
//            aumonterror.isHidden = true
//            aumonterror.text = "1000万は使いすぎだ、考え直せ！"
//        }
        
        
        d_reason = incomereason.text!
        //string 型を　Int8型に変換して変数に代入
        let temp:String = aumont.text!
        d_aumont = Int8(temp)!
        
        //入力された捩る列、数字が正常であればデータをInsertするメソッド
        let reason_aumont = user()
        reason_aumont.staticreason = d_reason
        reason_aumont.incomeetc = d_aumont
        
        
        
        
    }

}
