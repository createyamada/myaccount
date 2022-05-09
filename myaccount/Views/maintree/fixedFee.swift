//
//  fixedFee.swift
//  myaccount

import UIKit
import RealmSwift



class fixedFee: UIViewController {
    
    @IBOutlet weak var MonthlyRent: UITextField!
    @IBOutlet weak var ElectricityPrices: UITextField!
    @IBOutlet weak var WaterCharges: UITextField!
    @IBOutlet weak var GasCharges: UITextField!
    @IBOutlet weak var TelecommunicationCosts: UITextField!
    @IBOutlet weak var InsurancePremiums: UITextField!
    @IBOutlet weak var EtcSubscription: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
        
        let realm = try! Realm()
        let items =  realm.objects(moneyflow.self)
        //配列の値をストリング型に変換する
        let m:String = String(items[0].home)
        let e:String = String(items[0].elec)
        let w:String = String(items[0].water)
        let g:String = String(items[0].gas)
        let c:String = String(items[0].com)
        let i:String = String(items[0].insure)
        let s:String = String(items[0].subsc)
        //テキストボックスに初期値を代入する
        MonthlyRent.text = m
        ElectricityPrices.text = e
        WaterCharges.text = w
        GasCharges.text = g
        TelecommunicationCosts.text = c
        InsurancePremiums.text = i
        EtcSubscription.text = s
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    @IBAction func UpdateClick(_ sender: Any) {
        //テキストボックスの内容を配列に格納する。
        var allText:[String] = []
        allText.append(MonthlyRent.text!)
        allText.append(ElectricityPrices.text!)
        allText.append(WaterCharges.text!)
        allText.append(GasCharges.text!)
        allText.append(TelecommunicationCosts.text!)
        allText.append(InsurancePremiums.text!)
        allText.append(EtcSubscription.text!)
        //空文字チェック
        let results:[Int]  = function.checkNull(getallText: allText , getstate: 1)
        if function.resultsCheck(getresults: results) == 0 {
            if function.PriceUpdate(getresults: function.chengeInt64(getallText: allText)) == 0 {
                let alert = UIAlertController(title: "タイトル", message: "アラートのメッセージです。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
        } else {
            //空の場合からの部分のテキストボックスを赤くする
            for value in results {
                switch(value){
                case 1: MonthlyRent.backgroundColor = UIColor.red
                case 2: ElectricityPrices.backgroundColor = UIColor.red
                case 3: WaterCharges.backgroundColor = UIColor.red
                case 4: GasCharges.backgroundColor = UIColor.red
                case 5: TelecommunicationCosts.backgroundColor = UIColor.red
                case 6: InsurancePremiums.backgroundColor = UIColor.red
                case 7: EtcSubscription.backgroundColor = UIColor.red
                    
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


