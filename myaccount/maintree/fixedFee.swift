//
//  fixedFee.swift
//  myaccount

import UIKit
import RealmSwift
//テキストボックスを一元化した構造体
struct AllText {
    var i_MonthlyRent :Int
    var i_ElectricityPrices :Int
    var i_WaterCharges :Int
    var i_GasCharges :Int
    var i_TelecommunicationCosts :Int
    var i_InsurancePremiums :Int
    var i_EtcSubscription :Int
}


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
        var ErrorFrag :Int = 0
        //テキストボックスの値をアンラップ
        let m = MonthlyRent.text!
        let e = ElectricityPrices.text!
        let w = WaterCharges.text!
        let g = GasCharges.text!
        let t = TelecommunicationCosts.text!
        let i = InsurancePremiums.text!
        let et = EtcSubscription.text!
        //変数をinteger型に変換
        let v_MonthlyRent = Int(m)
        let v_ElectricityPrices = Int(e)
        let v_WaterCharges = Int(w)
        let v_GasCharges = Int(g)
        let v_TelecommunicationCosts = Int(t)
        let v_InsurancePremiums = Int(i)
        let v_EtcSubscription = Int(et)
        
        //テキストを構造体に格納


        
        //家賃の文字数カウント
        if Checkcount(value: v_MonthlyRent!) {
            //trueであれば何もしない登録するメソッドを呼び出す
        }else{
            //エラーのあるテキストボックス背景色を赤色にする
            //エラーのフラグを立てる
            ErrorFrag = 1
        }
        //電気代の文字数カウント
        if Checkcount(value: v_ElectricityPrices!) {
            //trueであれば何もしない登録するメソッドを呼び出す
        }else{
            //エラーのあるテキストボックス背景色を赤色にする
            //エラーのフラグを立てる
            ErrorFrag = 1
        }
        //水道代の文字数カウント
        if Checkcount(value: v_WaterCharges!) {
            //trueであれば何もしない登録するメソッドを呼び出す
        }else{
            //エラーのあるテキストボックス背景色を赤色にする
            //エラーのフラグを立てる
            ErrorFrag = 1
        }
        //ガス代の文字数カウント
        if Checkcount(value: v_GasCharges!) {
            //trueであれば何もしない登録するメソッドを呼び出す
        }else{
            //エラーのあるテキストボックス背景色を赤色にする
            //エラーのフラグを立てる
            ErrorFrag = 1
        }
        //通信費の文字数カウント
        if Checkcount(value: v_TelecommunicationCosts!) {
            //trueであれば何もしない登録するメソッドを呼び出す
        }else{
            //エラーのあるテキストボックス背景色を赤色にする
            //エラーのフラグを立てる
            ErrorFrag = 1
        }
        //保険料の文字数カウント
        if Checkcount(value: v_InsurancePremiums!) {
            //trueであれば何もしない登録するメソッドを呼び出す
        }else{
            //エラーのあるテキストボックス背景色を赤色にする
            //エラーのフラグを立てる
            ErrorFrag = 1
        }
        //その他サブスクライブの文字数カウント
        if Checkcount(value: v_EtcSubscription!) {
            //trueであれば何もしない登録するメソッドを呼び出す
            AllText(
                    i_MonthlyRent: v_MonthlyRent!,
                    i_ElectricityPrices: v_ElectricityPrices!,
                    i_WaterCharges: v_WaterCharges!,
                    i_GasCharges: v_GasCharges!,
                    i_TelecommunicationCosts: v_TelecommunicationCosts!,
                    i_InsurancePremiums: v_InsurancePremiums!,
                    i_EtcSubscription: v_EtcSubscription!
                    )
        }else{
            //エラーのあるテキストボックス背景色を赤色にする
            //エラーのフラグを立てる
            ErrorFrag = 1
        }
        
          //フラグが立っていればエラーメッセージを表示する
            if ErrorFrag > 0 {
            //アラートコントローラーのインスタンスを生成
                let alert = UIAlertController(title:"エラー発生!!",message:"10000万以上は使いすぎです見直してください", preferredStyle: .alert )
            //ボタン等のアクションを追加
            alert.addAction(UIAlertAction(title:"OK",style: .default,handler:nil))
            //アラートの表示
            return self.present(alert, animated: true, completion: nil)
            }
    }
    
    
    //文字数が8桁以下であればtrueを返しそれ以外はfalseを返すメソッド
    func Checkcount(value:Int) -> Bool{
        return value <= 99999999
        }

    }
    

