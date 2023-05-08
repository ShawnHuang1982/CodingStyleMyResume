//
//  StatePatternHelper.swift
//  CodingStyleMyResumeTests
//
//  Created by huang on 2023/5/8.
//

import Foundation

class JobDescription {
    var requirements: [String: MatchStateType]
    var currentState: ExperienceState?
    var states: [ExperienceState]

    init(requirements: [String : MatchStateType], currentState: ExperienceState? = nil, states: [ExperienceState]) {
        self.requirements = requirements
        self.currentState = currentState
        self.states = states
    }
    
    func startVerify() {
        states.forEach { state in
            currentState = state
            perform()
        }
    }

    func perform() {
        currentState?.match(to: self)
    }
}

extension Dictionary where Self == [String: MatchStateType] {
    func matchingNumbers() -> Int {
        return self.filter { $0.value == .yes }.count
    }
}


protocol ExperienceState: AnyObject {
    func compare(result: inout [String: MatchStateType])
    func match(to context: JobDescription)
}

extension ExperienceState {
    func  match(to context: JobDescription) {
        compare(result: &context.requirements)
    }
}

enum MatchStateType {
    case unknown
    case yes
}

class CompanyExperience: ExperienceState {
    func compare(result: inout [String : MatchStateType]) {
        for keywords in result {
            for experience in experiencies {
                if experience.lowercased().contains(keywords.key.lowercased()) {
                    print("contain",keywords.key)
                    result[keywords.key] = .yes
                }
            }
        }
    }
    var experiencies: [String]
    init(experiencies: [String]) {
        self.experiencies = experiencies
    }
}
