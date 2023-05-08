//
//  CodingStyleResumeVerifyExperienceTests.swift
//  CodingStyleMyResumeTests
//
//  Created by huang on 2023/5/8.
//

import XCTest
@testable import CodingStyleMyResume

final class CodingStyleMyResumeTests: XCTestCase {

    var shawn: Employee = Worker(name: "shawn huang", age: 35, skills: [.swiftProgramming], description: ["trained from bootcamp"], serviceYears: 0, degree: [.bachelor(.electronic)])
    
    override func setUpWithError() throws {
        shawn = ExperienceInCompanyA(employee: shawn)
        shawn = ExperienceInCompanyB(employee: shawn)
        shawn = ExperienceInCompanyC(employee: shawn)
        shawn = ExperienceInCompanyD(employee: shawn)
        shawn = ExperienceInCompanyE(employee: shawn)
        shawn = ExperienceInCompanyF(employee: shawn)
        print("description = \(shawn.description)")
        print("serviceYears = \(shawn.serviceYears)")
    }
    //資歷檢查 > 3.0 years
    func testAtLeast3YearsOfiOSDevelopment() {
        XCTAssertTrue(shawn.serviceYears > 3.0)
    }

    //學歷檢查 CS相關
    func testDesgreeIsRelatedComputerScience() {
        let relatedField:[Degree] = [.currentlyEnrolled(.computerScienece), .bachelor(.electronic)]
        XCTAssertTrue(relatedField.allSatisfy(shawn.degree.contains))
    }
    
    //Specific Skills
    func testExperienceMatchingKeyword() {
        
        let jd = JobDescription(requirements: [
            "CICD": .unknown,
            "jenkins": .unknown,
            "fastlane": .unknown,
            "profiling": .unknown], states: [])

        let experienceA = CompanyExperience(experiencies: ["pushlish code run UI Test in Jenkins"])
        let experienceB = CompanyExperience(experiencies: ["experience in fastlane "])
        let experienceC = CompanyExperience(experiencies: ["CICD", "profiling"])
        
        jd.states = [experienceA, experienceB, experienceC]
        jd.startVerify()
        XCTAssertEqual(jd.requirements.matchingNumbers(), 4)
    }
    
    //Describe my problem solving example
    func testDescription() {
        let delegate = ShawnHuang()
        let employer = Employer(delegate: delegate)

        //present by currying
        delegate.problemSolvingSkill = [
            delegate.formulateProblem(),
            delegate.problemSolvingWithDataVisulization(),
            delegate.problemSolvingWithMLTechnical()]

        employer.giveDetail()
        
        let expect = "Let problemA reduce to problemB which some problem that I can fix. >>> data labeling with domain expert through data visualization >>> problem sovling by ML model"
        
        XCTAssertEqual(delegate.reportProgress, expect)
    }

}

struct ExperienceInCompanyA: EmployeeDecorate {
    var employee: Employee
    var skills: [SkillType] {
        var s = employee.skills
        s.append(.swiftProgramming)
        s.append(.uiTest)
        return s
    }
    var description: [String] {
        var s = employee.description
        s.append("Assitant Testing - UI Test / Jenkins CI / Developing an iOS App")
        return s
    }
    var serviceYears: Float {
        return employee.serviceYears + 0.25
    }
}

struct ExperienceInCompanyB: EmployeeDecorate {
    var employee: Employee
    var skills: [SkillType] {
        var s = employee.skills
        s.append(.swiftProgramming)
        return s
    }
    var description: [String] {
        var s = employee.description
        s.append("Developing iOS apps both independently and with a team")
        return s
    }
    var serviceYears: Float {
        return employee.serviceYears + 0.75
    }
}

struct ExperienceInCompanyC: EmployeeDecorate {
    var employee: Employee
    var skills: [SkillType] {
        var s = employee.skills
        s.append(.swiftProgramming)
        s.append(.awsPlatformIot)
        s.append(.unitTest)
        return s
    }
    var description: [String] {
        var s = employee.description
        s.append("☑ Developing an iOS App independently / Publish To AppStore/ AWS / Maintaining IoT Project")
        s.append("☑ Flutter POC")
        return s
    }
    var serviceYears: Float {
        return employee.serviceYears + 0.91
    }
}

struct ExperienceInCompanyD: EmployeeDecorate {
    var employee: Employee
    var skills: [SkillType] {
        var s = employee.skills
        s.append(.swiftProgramming)
        return s
    }
    var description: [String] {
        var s = employee.description
        s.append("Maintaining iOS Apps / Refactor Legacy Code / Developing a POC App")
        return s
    }
    var serviceYears: Float {
        return employee.serviceYears + 0.75
    }
}

struct ExperienceInCompanyE: EmployeeDecorate {
    var employee: Employee
    var skills: [SkillType] {
        var s = employee.skills
        s.append(.swiftProgramming)
        s.append(.rxswift)
        s.append(.experienceInCICD)
        s.append(.snapshotTest)
        s.append(.unitTest)
        return s
    }
    var description: [String] {
        var s = employee.description
        s.append("Developing an iOS app in a big Team")
        s.append("Follow by CICD Process/ Automation Testing / Unit Test / Snapshot Test")
        return s
    }
    var serviceYears: Float {
        return employee.serviceYears + 1.41
    }
    var degree: [Degree] {
        var s = employee.degree
        s.append(.currentlyEnrolled(.computerScienece))
        return s
    }
}

struct ExperienceInCompanyF: EmployeeDecorate {
    var employee: Employee
    var skills: [SkillType] {
        var s = employee.skills
        s.append(.swiftProgramming)
        s.append(.iot)
        return s
    }
    var description: [String] {
        var s = employee.description
        s.append("IoT Programming - error handling")
        s.append("I refactored and maintained an iOS SDK, iOS App following the S.O.L.I.D. principles")
        return s
    }
    var serviceYears: Float {
        return employee.serviceYears + 1.7
    }
}
