//
//  DecoratePatternHelper.swift
//  CodingStyleMyResumeTests
//
//  Created by huang on 2023/5/8.
//

import Foundation

enum SkillType {
    case swiftProgramming
    case awsPlatformIot
    case uiTest
    case unitTest
    case snapshotTest
    case usingProfilingTools
    case experienceInCICD
    case rxswift
    case iot
}

enum Degree {
    case bachelor(Field)
    case currentlyEnrolled(Field)
    case none
    enum Field {
        case electronic
        case computerScienece
    }
}

extension Degree: Equatable {
    static func == (lhs: Degree, rhs: Degree)->Bool {
        switch (lhs, rhs){
        case (.bachelor(let a), .bachelor(let b)): return a == b
        case (.currentlyEnrolled(let a), .currentlyEnrolled(let b)): return a == b
        case (.none, .none): return true
        default: return false
        }
    }
}

extension Employee {
    var after_service_years_age: Float { return serviceYears + age }
}

protocol Employee {
    var skills: [SkillType] { get }
    var description: [String] { get }
    var serviceYears: Float { get }
    var degree: [Degree] { get }
    var name: String { get }
    var age: Float { get }
}

protocol EmployeeDecorate: Employee {
    var employee: Employee { get }
}

extension EmployeeDecorate {
    var name: String { return employee.name }
    var age: Float { return employee.age }
    var skills: [SkillType] { return employee.skills }
    var description: [String] { return employee.description }
    var serviceYears: Float { return employee.serviceYears }
    var degree: [Degree] { return employee.degree }
}

struct Worker: Employee {
    var name: String
    var age: Float
    var skills: [SkillType]
    var description: [String]
    var serviceYears: Float
    var degree: [Degree]
}
