//
//  ViewController.swift
//  TaskManager_Oskar_Riewe_Perła
//
//  Created by Oskar Riewe-Perla on 05/08/2019.
//  Copyright © 2019 Oskar Riewe-Perla. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var newTaskTitle: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addNewTaskButton(_ sender: Any) {
        if newTaskTitle.text != nil{
            if newTaskTitle.text != ""{
                var new = Task(Title: newTaskTitle.text!, Description: "Description", isDone: false)
                ViewController.elements.append(new)
                newTaskTitle.text = ""
                self.tableView.reloadData()
            }
        }
    }

    var refresh = UIRefreshControl.self
    static var elements: [Task] = []

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(ViewController.elements[indexPath.row].Title)"
        if ViewController.elements[indexPath.row].Done{
            cell.backgroundColor = UIColor(hue: 0.4389, saturation: 1, brightness: 0.74, alpha: 1.0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        TaskViewController.task = ViewController.elements[indexPath.row]
        TaskViewController.index = indexPath.row
        performSegue(withIdentifier: "toTaskDetails", sender: Any?.self)

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            ViewController.elements.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.reloadData()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        newTaskTitle.text = ""
    }


}

