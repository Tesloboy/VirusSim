//
//  SimulationLogic.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import Foundation


class SimulationLogic: ObservableObject {
    @Published var people: [Person] = []
    
    func initializePeople(count: Int) {
        people = Array(repeating: Person(), count: count)
    }
    
    func infectPerson(at index: Int) {
        guard index < people.count else { return }
        people[index].healthStatus = .infected
    }
    
    func updateSimulation(groupSize: Int, infectionFactor: Int) {
        var newPeople = people
        
        for (index, person) in people.enumerated() {
            if person.healthStatus == .infected {
                // Get neighbors to infect
                let startIndex = max(0, index - infectionFactor)
                let endIndex = min(people.count - 1, index + infectionFactor)
                _ = Array(people[startIndex...endIndex])
                
                for neighborIndex in startIndex...endIndex {
                    if people[neighborIndex].healthStatus == .healthy {
                        if Double.random(in: 0..<1) < 0.5 {
                            newPeople[neighborIndex].healthStatus = .infected
                        }
                    }
                }
            }
        }
        
        // Update the state after iterating through all people
        people = newPeople
    }
}
