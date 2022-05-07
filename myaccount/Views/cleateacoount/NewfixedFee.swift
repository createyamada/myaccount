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
            //                let change = checkarray.compactMap { Int64($0) }
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
            //                    case 0: c_moneyflow.home = Int64(change[0])
            //                    case 1: c_moneyflow.elec = Int64(change[1])
            //                    case 2: c_moneyflow.water = Int64(change[2])
            //                    case 3: c_moneyflow.gas = Int64(change[3])
            //                    case 4: c_moneyflow.com = Int64(change[4])
            //                    case 5 : c_moneyflow.insure = Int64(change[5])
            //                    case 6 : c_moneyflow.subsc = Int64(change[6])
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
}
