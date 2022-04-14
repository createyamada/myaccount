//
//  SavingsDeviationValue.swift
//  myaccount


import UIKit
import RealmSwift

//収入平均貯金額
//この変数の量同意にかなんねーなか
//10代
let eighteen:Int = 300
let nineteen:Int = 300
//20代
let twenty:Int = 300
let twentyone:Int = 300
let twentytwo:Int = 300
let twentythree:Int = 300
let twentyfour:Int = 300
let twentyfive:Int = 300
let twentysix:Int = 300
let twentyseven:Int = 300
let twentyeight:Int = 300
let twentynine:Int = 300
//30代
let thirty:Int = 300
let thirtyone:Int = 300
let thirtytwo:Int = 300
let thirtythree:Int = 300
let thirtyfour:Int = 300
let thirtyfive:Int = 300
let thirtysix:Int = 300
let thirtyseven:Int = 300
let thirtyeight:Int = 300
let thirtynine:Int = 300
//40代
let forty:Int = 300
let fortyone:Int = 300
let fortytwo:Int = 300
let fortythree:Int = 300
let fortyfour:Int = 300
let fortyfive:Int = 300
let fortysix:Int = 300
let fortyseven:Int = 300
let fortyeight:Int = 300
let fortynine:Int = 300
//50代
let fifty:Int = 300
let fiftyone:Int = 300
let fiftytwo:Int = 300
let fiftythree:Int = 300
let fiftyfour:Int = 300
let fiftyfive:Int = 300
let fiftysix:Int = 300
let fiftyseven:Int = 300
let fiftyeight:Int = 300
let fiftynine:Int = 300
//60代
let sixty:Int = 300
let sixtyone:Int = 300
let sixtytwo:Int = 300
let sixtythree:Int = 300
let sixtyfour:Int = 300
let sixtyfive:Int = 300
let sixtysix:Int = 300
let sixtyseven:Int = 300
let sixtyeight:Int = 300
let sixtynine:Int = 300
//70代
let seventy:Int = 300




class SavingsDeviationValue: UIViewController {
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showDeviation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
    
        showName.text = function.searchName(id :g_id,pass :g_pass)
    }
    
   
    

}
