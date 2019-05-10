//
//  WorkoutsViewController.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/9/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//

import UIKit
import CoreData

class WorkoutsViewController: UIViewController {

    @IBOutlet weak var workoutsTableView: UITableView!
    
    var workouts: [Workout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        do {
            workouts = try managedContext.fetch(fetchRequest)
            
            workoutsTableView.reloadData()
        } catch {
            print("Could not fetch workouts")
        }
        self.workoutsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? WorkoutDetailViewController,
            let selectedRow = self.workoutsTableView.indexPathForSelectedRow?.row else {
                return
        }
        destination.workout = workouts[selectedRow]
    }

    
    func deleteWorkout(at indexPath: IndexPath){
        let workout = workouts[indexPath.row]
        guard let managedContext = workout.managedObjectContext else {
            return
        }
        
        managedContext.delete(workout)
        
        do {
            try managedContext.save()
            
            workoutsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete workout")
            
            workoutsTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }

}

extension WorkoutsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workoutsTableView.dequeueReusableCell(withIdentifier: "workoutCell", for: indexPath)
        let workout = workouts[indexPath.row]
        cell.textLabel?.text = workout.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteWorkout(at: indexPath)
        }
    }
}
