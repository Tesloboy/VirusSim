//
//  ContentView.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI

struct ContentView: View {
    // Свойство для хранения экземпляра класса логики симуляции
    @StateObject var simulationLogic = SimulationLogic()
    
    // Свойство для хранения параметров симуляции
    @State var parameters = Parameters(groupSize: 100, infectionFactor: 1, updatePeriod: 1.0)
    
    // Флаг, указывающий на отображение симуляции
    @State var showSimulation = false
    
    var body: some View {
        VStack {
            // Если симуляция запущена, отображаем представление симуляции
            if showSimulation {
                SimulationView(simulationLogic: simulationLogic, showSimulation: $showSimulation)
                    .padding()
            } else {
                // В противном случае отображаем представление ввода параметров
                InputParametersView(parameters: $parameters, startSimulation: startSimulation)
                    .padding()
            }
            
            // Если симуляция не запущена, показываем кнопку для запуска симуляции
            if !showSimulation {
                Button(action: {
                    // Инициализируем людей в симуляции
                    simulationLogic.initializePeople(count: parameters.groupSize)
                    // Запускаем симуляцию
                    startSimulation()
                    // Устанавливаем флаг отображения симуляции в true
                    showSimulation = true
                }) {
                    Text("Start Simulation")
                }
                .padding()
            }
        }
    }
    
    // Метод для запуска симуляции с заданным интервалом обновления
    func startSimulation() {
        let timer = Timer.scheduledTimer(withTimeInterval: parameters.updatePeriod, repeats: true) { _ in
            // Обновляем состояние симуляции с новыми параметрами
            simulationLogic.updateSimulation(groupSize: parameters.groupSize, infectionFactor: parameters.infectionFactor)
        }
        timer.fire()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
