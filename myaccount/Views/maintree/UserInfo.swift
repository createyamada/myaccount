//
//  UserInfo.swift
//  myaccount
//
//  Created by updateyamada on 2022/05/07.
//

import UIKit
import RealmSwift

class UserInfo: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var sex: UISegmentedControl!
    @IBOutlet weak var saving: UITextField!
    @IBOutlet weak var annualIncome: UITextField!
    @IBOutlet weak var monthlyIncome: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
        
        let realm = try! Realm()
        let items =  realm.objects(User.self).filter("id == %@","")
        //配列の値をストリング型に変換する
        let m:String = String(items[0].name)
        let e:String = String(items[0].age)
        let w:String = String(items[0].sex)
        let g:String = String(items[0].saveingaumont)
        let c:String = String(items[0].incomeperM)
        let i:String = String(items[0].incomeperY)
        
        let sexNum:Int = function.sexchangeW(getWord: w)
        
        //テキストボックスに初期値を代入する
        name.text = m
        age.text = e
        sex.selectedSegmentIndex = sexNum
        saving.text = g
        annualIncome.text = c
        monthlyIncome.text = i
        
    }
    
    
    
}
