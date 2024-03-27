//
//  Person.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI

enum HealthStatus {
    case healthy
    case infected
}

struct Person: Identifiable {
    var id = UUID()
    var healthStatus: HealthStatus = .healthy
}
