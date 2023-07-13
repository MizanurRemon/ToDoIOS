//
//  TaskEntryController.swift
//  ToDoIOS
//
//  Created by Mizanur Remon on 13/7/23.
//

import UIKit

class TaskEntryController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    
   var update:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //saveTask(item: titleTextField.text!)
        
        addButtonAction((Any).self)
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addButtonAction(_ sender: Any) {
        if !titleTextField.text!.isEmpty {
            //navigationController?.popViewController(animated: true)
            saveTask(task: titleTextField.text!)
        }else{
            print("empty field")
        }
        
    }
    
    func saveTask(task: String?){
        guard let task = task else{
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(task, forKey: "item_\(newCount)")
        
        //print(task)
       // update?()
        //
        
        let alert = UIAlertController(title: "Congratulations", message: "Task has been added", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "done", style: .default, handler: {[weak self] (_) in
            
            
            self?.navigationController?.popViewController(animated: true)
            
        }))
        
        present(alert, animated: true)
        
    }
}
