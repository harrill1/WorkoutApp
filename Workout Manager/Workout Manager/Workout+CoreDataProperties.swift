//
//  Workout+CoreDataProperties.swift
//  Workout Manager
//
//  Created by Hayden Harrill on 5/10/19.
//  Copyright © 2019 Hayden Harrill. All rights reserved.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var completionTime: Double
    @NSManaged public var name: String?
    @NSManaged public var workoutDescription: String?
    @NSManaged public var totalCalories: Double
    @NSManaged public var rawActivity: NSOrderedSet?

}

// MARK: Generated accessors for rawActivity
extension Workout {

    @objc(insertObject:inRawActivityAtIndex:)
    @NSManaged public func insertIntoRawActivity(_ value: Activity, at idx: Int)

    @objc(removeObjectFromRawActivityAtIndex:)
    @NSManaged public func removeFromRawActivity(at idx: Int)

    @objc(insertRawActivity:atIndexes:)
    @NSManaged public func insertIntoRawActivity(_ values: [Activity], at indexes: NSIndexSet)

    @objc(removeRawActivityAtIndexes:)
    @NSManaged public func removeFromRawActivity(at indexes: NSIndexSet)

    @objc(replaceObjectInRawActivityAtIndex:withObject:)
    @NSManaged public func replaceRawActivity(at idx: Int, with value: Activity)

    @objc(replaceRawActivityAtIndexes:withRawActivity:)
    @NSManaged public func replaceRawActivity(at indexes: NSIndexSet, with values: [Activity])

    @objc(addRawActivityObject:)
    @NSManaged public func addToRawActivity(_ value: Activity)

    @objc(removeRawActivityObject:)
    @NSManaged public func removeFromRawActivity(_ value: Activity)

    @objc(addRawActivity:)
    @NSManaged public func addToRawActivity(_ values: NSOrderedSet)

    @objc(removeRawActivity:)
    @NSManaged public func removeFromRawActivity(_ values: NSOrderedSet)

}
