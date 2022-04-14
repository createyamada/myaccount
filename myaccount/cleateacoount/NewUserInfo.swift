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
            if function.newPriceRegister(getresults: function.chengeInt8(getallText: allText)) == 0 {
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
        //        //辞書型の配列をfor文で回してから文字出ないかチェック
        //        for value in checkarray {
        //            if value.count == 0 {
        //                //エラーフラグを立てる
        //                errorflag = 1
        //                var nullerror = 1
        //                //から文字のエラーである場合
        //                if nullerror == 1 {
        //                    //エラーフラグが立っているときにテキストボックススの背景色を変更する。
        //                    switch checkarray.startIndex {
        //                    //o
        //                    case 0: yachin.backgroundColor = UIColor.red
        //                    case 1: denki.backgroundColor = UIColor.red
        //                    case 2: suido.backgroundColor = UIColor.red
        //                    case 3: gasu.backgroundColor = UIColor.red
        //                    case 4: tushin.backgroundColor = UIColor.red
        //                    case 5 : hoken.backgroundColor = UIColor.red
        //                    case 6 :sonota.backgroundColor = UIColor.red
        //                    default: break
        //                    }
        //
        //                }
        //                //内容フラグ初期化
        //                nullerror = 0
        //                //8桁より多いい場合
        //            } else if value.count > 8 {
        //                errorflag = 1
        //                //桁数エラーの場合
        //                var overflag = 1
        //                if overflag == 1{
        //                    //エラーフラグが立っているときにテキストボックススの背景色を変更する。
        //                    switch checkarray.startIndex {
        //                    //o
        //                    case 0: yachin.backgroundColor = UIColor.red
        //                    case 1: denki.backgroundColor = UIColor.red
        //                    case 2: suido.backgroundColor = UIColor.red
        //                    case 3: gasu.backgroundColor = UIColor.red
        //                    case 4: tushin.backgroundColor = UIColor.red
        //                    case 5 : hoken.backgroundColor = UIColor.red
        //                    case 6 :sonota.backgroundColor = UIColor.red
        //                    default: break
        //                    }
        //                    //内容フラグ初期化
        //                    overflag = 0
        //                }
        //
        //
        //
        //
        //                    }
        //            if errorflag == 1 {
        //            } else {
        //                //配列内の型変換に利用する配列
        //                let change = checkarray.compactMap { Int8($0) }
        //
        //
        //
        //                let realm = try! Realm()
        //                //user型のオブジェクトを生成
        //                let c_moneyflow = moneyflow()
        //
        //                try! realm.write{
        //
        //                for value in change {
        //
        //                    switch value {
        //                    case 0: c_moneyflow.home = Int8(change[0])
        //                    case 1: c_moneyflow.elec = Int8(change[1])
        //                    case 2: c_moneyflow.water = Int8(change[2])
        //                    case 3: c_moneyflow.gas = Int8(change[3])
        //                    case 4: c_moneyflow.com = Int8(change[4])
        //                    case 5 : c_moneyflow.insure = Int8(change[5])
        //                    case 6 : c_moneyflow.subsc = Int8(change[6])
        //                    default: break
        //                    }
        //                    //データベースの登録
        //                    realm.add(c_moneyflow)
        //                }
        //                    let alert = UIAlertController(title: "タイトル", message: "アラートのメッセージです。", preferredStyle: .alert)
        //                        alert.addAction(UIAlertAction(title: "OK", style: .default))
        //                        self.present(alert, animated: true, completion: nil)
        //                }
        //
        //
        //
        //            }
        //
        //
        //
        //
        //        }
        //    }
    }
}
