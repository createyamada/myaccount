//
//  income.swift
//  myaccount


import UIKit
import RealmSwift

var d_reason: String = ""
var d_aumont :Int64 = 0
class income: UIViewController {
    
    @IBOutlet weak var datepiker: UIDatePicker!
    @IBOutlet weak var reason: UITextField!
    @IBOutlet weak var aumont: UITextField!
    
    var selectdate:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //yyyy年mm月dd日→yyyy-mm-dd
        // フォーマット設定
        /// DateFomatterクラスのインスタンス生成
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'年'MM'月'dd'日"
        let initdate:Date? = dateFormatter.date(from: selectdate)
        //calenderから渡された日付を初期値として表示
        datepiker.date = initdate!
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
        
        
        
    }

        
    @IBAction func registerClick(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        let sDate = dateFormatter.string(from: datepiker.date)
        
        //配列を初期化
        var allText:[String] = []
        //入力されたテキストを配列に代入する
        allText.append(reason.text!)
        allText.append(aumont.text!)
        allText.append(sDate)
        allText.append("2")
        
        //空文字チェック
        let results:[Int]  = function.checkNull(getallText: allText , getstate: 1)
        //エラーフラグが立っていなければ登録処理
        //エラーフラグがあるかチェック
        if function.resultsCheck(getresults: results) == 0{
            if(function.newIncomeRegister(getresults: allText) == 0 ){
                let alert = UIAlertController(title: "完了", message: "収入データの登録が完了しました。", preferredStyle: .alert)
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                    // ボタンが押された時の処理を書く（クロージャ実装）
                    (action: UIAlertAction!) -> Void in
                    self.performSegue(withIdentifier: "g_main", sender: nil)
                    print("OK")
                })
                
                //アクションを追加
                alert.addAction(defaultAction)

                // Alertを表示
                present(alert, animated: true, completion: nil)
                
                //メイン画面に戻る
            }
            

            
            
        } else {
            //空の場合からの部分のテキストボックスを赤くする
            for value in results {
                switch(value){
                case 1: reason.backgroundColor = UIColor.red
                case 2: aumont.backgroundColor = UIColor.red
                default:break
                }
            }
            //変数を初期化して、エラーメッセージを表示
            let alert = UIAlertController(title: "入力項目エラー", message: "入力項目が入力要件を満たしていません。金額は1文字から8文字の間で入力してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        d_reason = reason.text!
        //string 型を　Int64型に変換して変数に代入
        let temp:String = aumont.text!
        
        //入力された捩る列、数字が正常であればデータをInsertするメソッド
        let reason_aumont = calender()
        reason_aumont.reason = d_reason
        reason_aumont.AmountOfMoney = d_aumont
        
        
    }
    
}
