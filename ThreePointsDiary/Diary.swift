//
//  Diary.swift
//  ThreePointsDiary
//
//  Created by Yu on 2021/09/10.
//

import Foundation
import RealmSwift

class Diary: Object, Identifiable {
    
    //列を定義
    @objc dynamic var id = 0
    @objc dynamic var createdDate = Date()
    @objc dynamic var createdYmd = 0
    @objc dynamic var content01 = ""
    @objc dynamic var content02 = ""
    @objc dynamic var content03 = ""
    
    //全ての日記を返すメソッド
    static func all() -> Results<Diary> {
        let realm = try! Realm()
        return realm.objects(Diary.self).sorted(byKeyPath: "createdDate", ascending: false)
    }
    
    //0件の日記を返すメソッド
    static func noRecord() -> Results<Diary> {
        let realm = try! Realm()
        return realm.objects(Diary.self).filter("id == -1")
    }

}
