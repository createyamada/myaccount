//
//  NewfixedFee.swift
//  myaccount


import UIKit
import RealmSwift


class NewUserInfo: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var sex: UISegmentedControl!
    @IBOutlet weak var saving: UITextField!
    @IBOutlet weak var annualIncome: UITextField!
    @IBOutlet weak var monthlyIncome: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func clicknext(_ sender: Any) {
        let sexword:String = function.sexchange(getNumber: sex.selectedSegmentIndex)
        var checkCounter:Int = 0
        //配列を初期化
        var allText:[String] = []
        //入力されたテキストを配列に代入する
        allText.append(name.text!)
        allText.append(age.text!)
        allText.append(sexword)
        allText.append(saving.text!)
        allText.append(annualIncome.text!)
        allText.append(monthlyIncome.text!)
        
        //空文字チェック
        let results:[Int]  = function.checkNull(getallText: allText , getstate: 1)
        //エラーフラグが立っていなければ登録処理
        if function.resultsCheck(getresults: results) == 0 {
            if function.newUserRegister(getresults: allText) == 0 {
                //次画面のストーリーボードを指定
                let storyboard: UIStoryboard = self.storyboard!
                //遷移先のコントローラーを指定
                let nextView = storyboard.instantiateViewController(withIdentifier: "NewfixedFee") as! NewfixedFee
                //遷移を行う
                self.present(nextView, animated: true, completion: nil)
            }
            
            
            
        } else {
            //空の場合からの部分のテキストボックスを赤くする
            for value in results {
                switch(value){
                case 1: name.backgroundColor = UIColor.red
                case 2: age.backgroundColor = UIColor.red
                case 3: sex.backgroundColor = UIColor.red
                case 4: saving.backgroundColor = UIColor.red
                case 5: annualIncome.backgroundColor = UIColor.red
                case 6: monthlyIncome.backgroundColor = UIColor.red
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
