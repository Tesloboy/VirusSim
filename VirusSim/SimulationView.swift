//
//  SimulationView.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI

// Представление для отображения симуляции
struct SimulationView: View {
    // Наблюдаемый объект для логики симуляции
    @ObservedObject var simulationLogic: SimulationLogic
    // Привязка к флагу отображения симуляции
    @Binding var showSimulation: Bool
    
    // Массив столбцов сетки
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 5) // 5 столбцов
    
    var body: some View {
        VStack {
            ScrollView {
                // Отображение симуляции в сетке
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(simulationLogic.people.indices, id: \.self) { index in
                        LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                            // Представление для каждого человека в сетке
                            PersonView(person: simulationLogic.people[index]) {
                                simulationLogic.infectPerson(at: index)
                            }
                        }
                        .frame(width: 50, height: 50) // Размеры ячейки для каждого человека
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


// Представление для отображения каждого человека в симуляции
struct PersonView: View {
    var person: Person
    var onTap: () -> Void
    
    var body: some View {
        Circle()
            .foregroundColor(person.healthStatus == .healthy ? .green : .red) // Окрашиваем зеленым если здоровый, красным если зараженный
            .frame(width: 35, height: 35) // Размеры круга
            .padding()
            .onTapGesture {
                // Обработчик нажатия на круг
                onTap()
            }
    }
}
