//
//  DelegatePatternHelper.swift
//  CodingStyleMyResumeTests
//
//  Created by huang on 2023/5/8.
//

import Foundation

protocol BossNeedsDelegate: AnyObject {
    var reportProgress: String? { get set }
    func solveProblem()
}

class Employer {
    weak var delegate: BossNeedsDelegate?
        
    func giveDetail() {
        delegate?.solveProblem()
    }
    
    init(delegate: BossNeedsDelegate? = nil) {
        self.delegate = delegate
    }
}



typealias Procedure = (String) -> String
infix operator >>>
func >>>(procedure1: @escaping Procedure, procedure2: @escaping Procedure) -> Procedure {
    return { input in procedure2(procedure1(input))}
}

protocol LearnFromStudyMasterDegree { }

extension LearnFromStudyMasterDegree {
    
    func formulateProblem() -> Procedure {
        return { s in s + "Let problemA reduce to problemB which some problem that I can fix." }
    }
    func problemSolvingWithDataVisulization() -> Procedure {
        return { s in s + " >>> data labeling with domain expert through data visualization" }
    }
    func problemSolvingWithMLTechnical() -> Procedure {
        return { s in  s + " >>> problem sovling by ML model" }
    }
}


class ShawnHuang: BossNeedsDelegate {
    var reportProgress: String?
    var tmp: Procedure = { _ in return "" }
    var problemSolvingSkill: [Procedure] = []

    func solveProblem() {
        problemSolvingSkill.forEach({ procedure in
            //currying
            tmp = tmp>>>procedure
        })
        reportProgress = tmp("")
    }
}
extension ShawnHuang: LearnFromStudyMasterDegree {}
