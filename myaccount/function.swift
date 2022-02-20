//
//  function.swift
//  myaccount
//
//  Created by updateyamada on 2021/11/28.
//

import Foundation
import RealmSwift

class function: NSObject {
    class func CheckNull(figure:String) -> Int {
        if figure.count == 0{
            return 0
        }else{
          
            return 1
        }

    }
}
