//
//  InputParametersView.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI

// View для ввода параметров симуляции
struct InputParametersView: View {
    // Привязка к параметрам симуляции
    @Binding var parameters: Parameters
    // Замыкание для запуска симуляции
    var startSimulation: () -> Void
    
    var body: some View {
        VStack {
            // Поле ввода для размера группы
            Text("Group Size:")
            TextField("Enter group size", value: $parameters.groupSize, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Поле ввода для коэффициента заражения
            Text("Infection Factor:")
            TextField("Enter infection factor", value: $parameters.infectionFactor, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Поле ввода для периода обновления
            Text("Update Period:")
            TextField("Enter update period", value: $parameters.updatePeriod, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
    }
}
