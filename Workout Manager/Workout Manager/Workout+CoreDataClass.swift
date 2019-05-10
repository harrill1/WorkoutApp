//
//  Workout+CoreDataClass.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/10/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Workout)
public class Workout: NSManagedObject {
    
    var activities: [Activity]? {
        return self.rawActivity?.array as? [Activity]
    }
    convenience init?(name: String?, completionTime:  Double, totalCalories: Double, workoutDescription: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else {
                return nil
        }
        
        self.init(entity: Workout.entity(), insertInto: context)
        
        self.name = name
        self.completionTime = completionTime
        self.workoutDescription = workoutDescription
        self.totalCalories = totalCalories
    }
}
