//
//  InputParametersView.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI


struct InputParametersView: View {
    @Binding var parameters: Parameters
    var startSimulation: () -> Void
    
    var body: some View {
        VStack {
            Text("Group Size:")
            TextField("Enter group size", value: $parameters.groupSize, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Infection Factor:")
            TextField("Enter infection factor", value: $parameters.infectionFactor, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Update Period:")
            TextField("Enter update period", value: $parameters.updatePeriod, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
    }
}
