//
//  ViewController.swift
//  ToDoIOS
//
//  Created by Mizanur Remon on 13/7/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var taskList = [String]()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        print(UserDefaults.standard.dictionaryRepresentation())
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateTask()
    }
    
    func updateTask(){
        taskList.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        for item in 0...count{
            if let task = UserDefaults().value(forKey: "item_\(item+1)") as? String{
                taskList.append(task)
            }
        }
        
        tableView.reloadData()
//        print(taskList.count)
    }

    @IBAction func barItemButtonAction(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "taskEntryViewController") as! TaskEntryController
        
        
        controller.update = {
            
            DispatchQueue.main.async {
                self.updateTask()
            }
        }
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellID", for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(taskList[indexPath.row])
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "taskDeatilsControllerID") as! TaskDeatilsController
        
        
        controller.itemPosition = indexPath.row + 1
        controller.itemValue = taskList[indexPath.row]
        
        self.navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
}

