//
//  ViewController.swift
//  DatabaseRealm
//
//  Created by 堀弘昌 on 2022/08/27.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let memo: Memo? = read()
        
        titleTextField.text = memo?.title
        contentTextField.text = memo?.content
    }

    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save(){
        let title: String = titleTextField.text!
        let content: String = contentTextField.text!
        
        let memo: Memo? = read()
        
        if memo != nil {
            try! realm.write{
                memo!.title = title
                memo!.content = content
            }
        }
        else {
            let newMemo = Memo()
            newMemo.title = title
            newMemo.content = content
            
            try! realm.write {
                realm.add(newMemo)
            }
        }
    }
    
}

