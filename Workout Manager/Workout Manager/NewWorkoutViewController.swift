//
//  NewWorkoutViewController.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/9/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//

import UIKit
import CoreData

class NewWorkoutViewController: UIViewController {

    @IBOutlet weak var activitiesTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addedActivitiesTextView: UITextView!
    
    var activities: [Activity]? = []
    var selectedActivities: [Activity]? = []
    
    @IBAction func saveWorkout(_ sender: UIBarButtonItem) {
        let workoutName = nameTextField.text ?? ""
        let workoutTime = 0.0
        let workoutCalories = 0.0
        let workoutDescription = descriptionTextField.text ?? ""
        
        let workout = Workout(name: workoutName, completionTime: workoutTime, totalCalories: workoutCalories, workoutDescription: workoutDescription)
        
        do {
            try workout?.managedObjectContext?.save()
            
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Could not save workout")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Activity> = Activity.fetchRequest()
        
        do {
            activities = try managedContext.fetch(fetchRequest)
            
            activitiesTableView.reloadData()
        } catch {
            print("Could not fetch activities")
        }
    }
    
}

extension NewWorkoutViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        
        if let activity = activities?[indexPath.row] {
            cell.textLabel?.text = activity.name
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //add selected row activity to list of activites for workout
    }
}
