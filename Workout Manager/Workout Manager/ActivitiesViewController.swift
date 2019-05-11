//
//  ActivitiesViewController.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/9/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//

import UIKit
import CoreData

class ActivitiesViewController: UIViewController {

    @IBOutlet weak var activitiesTableView: UITableView!
    
    var activities: [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        self.activitiesTableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ActivityDetailViewController,
            let selectedRow = self.activitiesTableView.indexPathForSelectedRow?.row else {
                return
        }
        destination.activity = activities[selectedRow]
    }
    
    func deleteActivity(at indexPath: IndexPath){
        let activity = activities[indexPath.row]
        guard let managedContext = activity.managedObjectContext else {
            return
        }
        
        managedContext.delete(activity)
        
        do {
            try managedContext.save()
            
            activitiesTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete activity")
            
            activitiesTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    

}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        let activity = activities[indexPath.row]
        cell.textLabel?.text = activity.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteActivity(at: indexPath)
        }
    }
}
