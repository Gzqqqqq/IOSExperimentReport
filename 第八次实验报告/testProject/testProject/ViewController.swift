//
//  ViewController.swift
//  testProject
//
//  Created by Guozhouqian on 2018/11/1.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var stuArr = [Any]()
    
    
    @IBOutlet weak var nameTextFied: UITextField!
    @IBOutlet weak var stuTableView: UITableView!
    @IBOutlet weak var chooseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stuArr.append(Teacher(firstName: "TeacherOne", lastName: "", age: 35, gender: Gender.male, title: "teacher"))
        stuArr.append(Teacher(firstName: "TeacherTwo", lastName: "", age: 45, gender: Gender.female, title: "headTeacher"))
        stuArr.append(Teacher(firstName: "TeacherThree", lastName: "", age: 34, gender: Gender.male, title: "professor"))
        stuArr.append(Teacher(firstName: "TeacherFour", lastName: "", age: 33, gender: Gender.female, title: "teacher"))
        stuArr.append(Teacher(firstName: "TeacherFive", lastName: "", age: 37, gender: Gender.male, title: "professor"))
        stuArr.append(Student(firstName: "studentOne", lastName: "", age: 18, gender: Gender.female, stuNo: "001"))
        stuArr.append(Student(firstName: "studentTwo", lastName: "", age: 20, gender: Gender.male, stuNo: "002"))
        stuArr.append(Student(firstName: "studentThree", lastName: "", age: 17, gender: Gender.female, stuNo: "003"))
        stuArr.append(Student(firstName: "studentFour", lastName: "", age: 28, gender: Gender.male, stuNo: "004"))
        stuArr.append(Student(firstName: "studentFive", lastName: "", age: 21, gender: Gender.female, stuNo: "005"))
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if nameTextFied.text != "" {
            /*stuArr.append(Student(name: name, age: 19, gender:"F", grade: 80))*/
            let name = nameTextFied.text
            stuArr.append(Student(name: name!))
            stuTableView.reloadData()
        }
        nameTextFied.resignFirstResponder()/*失去焦点*/
    }
    
    @IBAction func editClicked(_ sender: Any) {
        if let row = stuTableView.indexPathForSelectedRow?.row {
            if let name = nameTextFied.text{
                (stuArr[row] as! Person).firstName = name
                stuTableView.reloadData()
            }
        }
        nameTextFied.resignFirstResponder()
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        stuTableView.isEditing = !stuTableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*let cell:UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell")!*/
        
        if let stu = stuArr[indexPath.row] as? Student{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
            cell.name.text = "name:\(stu.firstName)"
            cell.stuNum.text = "stuNo:\(stu.stuNo)"
            cell.sex.text = "Sex:\(stu.gender)"
            cell.name.sizeToFit()
            cell.sex.sizeToFit()
            cell.stuNum.sizeToFit()
            cell.img.image = UIImage(named: "img1")
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
            let tea = stuArr[indexPath.row] as! Teacher
            cell.name.text = "name:\(tea.firstName)"
            cell.title.text = "title:\(tea.title)"
            cell.sex.text = "Sex:\(tea.gender)"
            cell.name.sizeToFit()
            cell.title.sizeToFit()
            cell.sex.sizeToFit()
            cell.img.image = UIImage(named: "img2")
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "\((stuArr[indexPath.row] as! Person).description)"
        /*You choose:*/
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stuArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = stuArr.remove(at: sourceIndexPath.row)
        stuArr.insert(source, at: destinationIndexPath.row)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

