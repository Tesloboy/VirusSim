//
//  ContentView.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var simulationLogic = SimulationLogic()
    @State var parameters = Parameters(groupSize: 100, infectionFactor: 3, updatePeriod: 1.0)
    @State var showSimulation = false
    
    var body: some View {
        VStack {
            if showSimulation {
                SimulationView(simulationLogic: simulationLogic)
                    .padding()
            } else {
                InputParametersView(parameters: $parameters)
                    .padding()
            }
            
            if !showSimulation {
                Button(action: {
                    simulationLogic.initializePeople(count: parameters.groupSize)
                    startSimulation()
                    showSimulation = true
                }) {
                    Text("Start Simulation")
                }
                .padding()
            }
        }
    }
    
    func startSimulation() {
        let timer = Timer.scheduledTimer(withTimeInterval: parameters.updatePeriod, repeats: true) { _ in
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
