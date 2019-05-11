//
//  WorkoutDetailViewController.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/9/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//

import UIKit

class WorkoutDetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var descriptionTextField: UILabel!
    @IBOutlet weak var caloriesTextField: UILabel!
    @IBOutlet weak var timeTextField: UILabel!
    
    @IBOutlet weak var activitiesTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let calories = String(workout!.totalCalories)
        let time = String(workout!.completionTime)
        nameTextField.text = "Name: " + (workout?.name ?? "")
        descriptionTextField.text = "Description: " + (workout?.description ?? "")
        caloriesTextField.text = "Calories burned per workout: " + calories
        timeTextField.text = "Length: " + time
        
    }
    
    
    var workout: Workout?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ActivityDetailViewController,
            let selectedRow = self.activitiesTableView.indexPathForSelectedRow?.row else {
                return
        }
        destination.activity = workout?.activities?[selectedRow]
    }
    
    func deleteActivity(at indexPath: IndexPath){
        let activity = workout?.activities?[indexPath.row]
        guard let managedContext = activity?.managedObjectContext else {
            return
        }
        
        managedContext.delete(activity!)
        
        do {
            try managedContext.save()
            
            activitiesTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete activity")
            
            activitiesTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }

    
    
}

extension WorkoutDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout?.activities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        let activity = workout?.activities?[indexPath.row]
        cell.textLabel?.text = activity?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteActivity(at: indexPath)
        }
    }
}
