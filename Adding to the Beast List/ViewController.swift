//
//  ViewController.swift
//  Adding to the Beast List
//
//  Created by Safa Falaqi on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var taskTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    
    }

    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if let text = taskTextField.text  , !text.isEmpty {
           tasks.append(text)
           taskTextField.text = ""
       }
        tableView.reloadData()
    }
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        // set text label to the model that is corresponding to the row in array
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
}
