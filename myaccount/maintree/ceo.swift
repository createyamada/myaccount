//
//  ceo.swift
//  myaccount


import UIKit
import RealmSwift

class ceo: UIViewController {
    
    @IBOutlet weak var showname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
    

        showname.text = searchName(id :g_id ,pass :g_pass)
        showname.text = "並木櫻"
        print(showname.text!)
    }
    
    func searchName(id:String ,pass:String) -> String {
        var name: String = ""
        
        let realm = try!Realm()
        
        let Items = realm.objects(user.self).filter("id == %@",g_id).filter("pass == %@",g_pass)
        for user in Items {
            name = user.name
        }
        
        
        return name
    }

        
    

}
