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
        
        
        showname.text = function.searchName(id :g_id ,pass :g_pass)
        print(showname.text!)
    }
    
    
    
    
    
}
