//
//  Activity+CoreDataProperties.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/10/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var activityDescription: String?
    @NSManaged public var completionTime: Double
    @NSManaged public var name: String?
    @NSManaged public var caloriesBurned: Double
    @NSManaged public var rawWorkout: NSSet?

}

// MARK: Generated accessors for rawWorkout
extension Activity {

    @objc(addRawWorkoutObject:)
    @NSManaged public func addToRawWorkout(_ value: Workout)

    @objc(removeRawWorkoutObject:)
    @NSManaged public func removeFromRawWorkout(_ value: Workout)

    @objc(addRawWorkout:)
    @NSManaged public func addToRawWorkout(_ values: NSSet)

    @objc(removeRawWorkout:)
    @NSManaged public func removeFromRawWorkout(_ values: NSSet)

}
