//
//  Person.swift
//  VirusSim
//
//  Created by Viktor Teslenko on 27.03.2024.
//

import SwiftUI

// Перечисление для определения статуса здоровья человека
enum HealthStatus {
    case healthy // Здоров
    case infected // Заражён
}

// Структура, представляющая человека в симуляции
struct Person: Identifiable {
    var id = UUID() // Уникальный идентификатор человека
    var healthStatus: HealthStatus = .healthy // Статус здоровья человека, по умолчанию здоров
}
