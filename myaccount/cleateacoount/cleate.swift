//
//  cleate.swift
//  myaccount


import UIKit
import RealmSwift

class cleate: UIViewController {
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var id: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerNext(_ sender: Any) {
        let t = id.text!
        let p = pass.text!
        let r_id = String(t)
        let r_pass = String(p)
        
        let realm = try! Realm()
        //user型のオブジェクトを生成
        let c_user = user()
        //登録処理
        try! realm.write{
            
            c_user.id = r_id
            c_user.pass = r_pass
            realm.add(c_user)
        }
        //次画面のストーリーボードを指定
        let storyboard: UIStoryboard = self.storyboard!
        //遷移先のコントローラーを指定
        let nextView = storyboard.instantiateViewController(withIdentifier: "NewfixedFee") as! NewfixedFee
        //遷移を行う
        self.present(nextView, animated: true, completion: nil)
    }
    
    
    
    
    
    
}
