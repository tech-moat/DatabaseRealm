//
//  Memo.swift
//  DatabaseRealm
//
//  Created by 堀弘昌 on 2022/08/27.
//

import Foundation
import RealmSwift

class Memo: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    
}
