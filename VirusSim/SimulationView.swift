//
//  SimulationView.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI

struct SimulationView: View {
    @ObservedObject var simulationLogic: SimulationLogic
    @Binding var showSimulation: Bool // Привязка к флагу отображения симуляции
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 5) // 5 столбцов
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(simulationLogic.people.indices, id: \.self) { index in
                        LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                            PersonView(person: simulationLogic.people[index]) {
                                simulationLogic.infectPerson(at: index)
                            }
                        }
                        .frame(width: 50, height: 50)
                    }
                }
                .padding()
            }
            
            // Кнопка для возврата в меню
            Button(action: {
                showSimulation = false
            }) {
                Text("Back to Menu")
            }
            .padding()
        }
    }
}


struct PersonView: View {
    var person: Person
    var onTap: () -> Void
    
    var body: some View {
        Circle()
            .foregroundColor(person.healthStatus == .healthy ? .green : .red)
            .frame(width: 35, height: 35)
            .padding()
            .onTapGesture {
                // Вызываем замыкание при нажатии на круг
                onTap()
            }
    }
}

