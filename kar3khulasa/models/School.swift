//
//  School.swift
//  kar3khulasa
//
//  Created by Osama shallal on 17/07/2024.
//

import Foundation

struct School : Identifiable {
    var id = UUID()
    var region : String
    var section :String
    var boys : Int
    var girls : Int
    var sumOfSchools : Int
    var boysStudent : Int
    var girlsStudent : Int
    var sumOfStudent : Int
    var boysTeachers : Int
    var girlsTeachers : Int
    var sumOfTeachers : Int
    var numnerOfBuildings :Int
    var numberOfClasses : Int
}
