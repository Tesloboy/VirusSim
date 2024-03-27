//
//  SimulationLogic.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import Foundation

class SimulationLogic: ObservableObject {
    // Свойство, хранящее массив людей в симуляции
    @Published var people: [Person] = []
    
    // Метод для инициализации людей в симуляции
    func initializePeople(count: Int) {
        // Создаем массив людей с заданным количеством и заполняем его объектами Person
        people = Array(repeating: Person(), count: count)
    }
    
    // Метод для заражения человека в указанном индексе
    func infectPerson(at index: Int) {
        // Проверяем, что индекс находится в пределах массива людей
        guard index < people.count else { return }
        // Устанавливаем статус заражения для человека по указанному индексу
        people[index].healthStatus = .infected
    }
    
    // Метод для обновления состояния симуляции
    func updateSimulation(groupSize: Int, infectionFactor: Int) {
        var newPeople = people // Создаем копию массива людей
        
        // Проходим по каждому человеку в симуляции
        for (index, person) in people.enumerated() {
            // Проверяем, заражен ли текущий человек
            if person.healthStatus == .infected {
                // Определяем диапазон для поиска соседей, которых можно заразить
                let startIndex = max(0, index - infectionFactor)
                let endIndex = min(people.count - 1, index + infectionFactor)
                
                // Проходим по соседям текущего зараженного человека
                for neighborIndex in startIndex...endIndex {
                    // Проверяем, что сосед здоров
                    if people[neighborIndex].healthStatus == .healthy {
                        // Генерируем случайное число от 0 до 1
                        if Double.random(in: 0..<1) < 0.5 {
                            // Если число меньше 0.5, заражаем соседа
                            newPeople[neighborIndex].healthStatus = .infected
                        }
                    }
                }
            }
        }
        
        // Обновляем массив людей с новым состоянием
        people = newPeople
    }
}
