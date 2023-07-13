//
//  TaskDeatilsController.swift
//  ToDoIOS
//
//  Created by Mizanur Remon on 13/7/23.
//

import UIKit

class TaskDeatilsController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    var itemPosition : Int!
    var itemValue : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UserDefaults.standard.dictionaryRepresentation())
        
        labelText.text = itemValue
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func deleteTask(){
      
        UserDefaults().setValue(nil, forKey: "item_\(itemPosition!)")
    
        
        navigationController?.popViewController(animated: true)
    }

}
