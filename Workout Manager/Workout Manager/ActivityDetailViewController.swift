//
//  ActivityDetailViewController.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/9/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let calories = String(activity!.caloriesBurned)
        let time = String(activity!.completionTime)
        
        nameLabel.text = "Name: " + (activity?.name ?? "")
        descriptionLabel.text = "Description: " + activity!.description
        timeLabel.text = "Time to complete: " + time + "minutes"
        
        caloriesLabel.text = "Calories burned: " + calories
    }
    
    var activity: Activity?
    

}
