//
//  ViewController.swift
//  Sqlite
//
//  Created by Guozhouqian on 2018/12/15.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let db = SQLiteDB.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///将工程中的data数据库打开并放在document目录下，将只读变成可写
        let result = db.open(dbPath: "", copyFile: true)
        print("result:\(result)")
        let rel = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("result:\(rel)")
        print(NSHomeDirectory())
    }


    @IBAction func add(_ sender: Any) {
        let rel = db.execute(sql: "insert into person(name,phone) values('\(tfName.text!)','\(tfPhone.text!)')")
        print("result:\(rel)")
    }
    
    @IBAction func update(_ sender: Any) {
        let rel = db.execute(sql: "update person set phone = '\(tfPhone.text!)' where name = '\(tfName.text!)'")
        print("result:\(rel)")
    }
    @IBAction func del(_ sender: Any) {
        let rel = db.execute(sql: "delete from person where name = '\(tfName.text!)'")
        print("result:\(rel)")
        
    }
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(tfName.text!)'")
        if let person = persons.first, let phone = person["phone"] as? String{
            tfPhone.text = phone
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

