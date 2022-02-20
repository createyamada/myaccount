//
//  out.swift
//  myaccountTests
//
//  Created by updateyamada on 2021/07/30.
//

import UIKit

class tenmput: UICollectionViewController {
    
   
    
    
    let contents1 = ["飲食費","交通費","雑貨","日用品","趣味","医療費","衣類"]
    
    var giveforWhet: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

    
    //データの個数を返すメソッド
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return contents1.count
    }
    //データの名称を返すメソッド
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //セルのラベルを格納


        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
}
