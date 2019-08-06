//
//  TaskViewController.swift
//  TaskManager_Oskar_Riewe_Perła
//
//  Created by Oskar Riewe-Perla on 05/08/2019.
//  Copyright © 2019 Oskar Riewe-Perla. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITextFieldDelegate {

    static var task = Task(Title: "", Description: "", isDone: false)
    static var index = 0
    
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var isDone: UISwitch!
    
    @IBOutlet weak var taskDescription: UITextView!
    @IBAction func saveTask(_ sender: Any){
        let new = Task(Title: taskTitle.text!, Description: taskDescription.text, isDone: isDone.isOn)
        ViewController.elements[TaskViewController.index] = new
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitle.text = TaskViewController.task.Title
        taskDescription.text = TaskViewController.task.Description
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
