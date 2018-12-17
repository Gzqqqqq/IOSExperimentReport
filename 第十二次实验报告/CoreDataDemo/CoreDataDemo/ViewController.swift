//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Guozhouqian on 2018/12/15.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print(NSHomeDirectory())
    }
    
    @IBAction func add(_ sender: Any) {
        let person = Person(context:context)
        person.name = tfName.text!
        person.phone = tfPhone.text!
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言处理，查找某一个人
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)  //不进行断言处理，将返回所有的人
        if let p = persons?.first{
            p.phone =  tfPhone.text
        }
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言处理，查找某一个人
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)  //不进行断言处理，将返回所有的人
        if let p = persons?.first{
            context.delete(p)
        }
    }
    
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言处理，查找某一个人
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)  //不进行断言处理，将返回所有的人
        if let p = persons?.first{
            tfPhone.text! = p.phone!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

