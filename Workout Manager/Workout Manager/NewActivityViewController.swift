//
//  NewActivityViewController.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/9/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    
    @IBAction func saveActivity(_ sender: UIBarButtonItem) {
        let activityName = nameTextField.text ?? ""
        let activityTime = Double(timeTextField.text!) ?? 0.0
//        let activityCalories = Double(caloriesTextField.text!) ?? 0.0
//        let activityDescription = descriptionTextField.text ?? ""
        let activityCalories = 0.0
        let activityDescription = ""
        
        let activity = Activity(name: activityName, completionTime: activityTime, caloriesBurned: activityCalories, activityDescription: activityDescription)
        
        do {
            try activity?.managedObjectContext?.save()
            
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Could not save activity")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
