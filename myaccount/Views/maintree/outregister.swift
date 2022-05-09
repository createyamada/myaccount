//
//  outregister.swift
//  myaccount
//
//  Created by updateyamada on 2021/11/09.
//

import UIKit
import RealmSwift

class outregister: UIViewController {
    
    
    
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var value: UITextField!
    var selecttext:String!
    var selectedImg: UIImage!
    var r_selectdate:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = selecttext
        imageView.image = selectedImg
        //yyyy年mm月dd日→yyyy-mm-dd
        // フォーマット設定
        /// DateFomatterクラスのインスタンス生成
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'年'MM'月'dd'日"
        let initdate:Date? = dateFormatter.date(from: r_selectdate)
        //calenderから渡された日付を初期値として表示
        datepicker.date = initdate!
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
        
    }
    //登録ボタン押下時
    @IBAction func registerClick(_ sender: Any) {
        //テキストボックスの内容を配列に格納する。
        var allText:[String] = []
        allText.append(text.text!)
        //空文字チェック
        let results:[Int]  = function.checkNull(getallText: allText , getstate: 1)
        //エラーフラグがあるかチェック
        if function.resultsCheck(getresults: results) == 0{
            
        }
        
        
    }
}








