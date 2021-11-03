//
//  HistoryPosts.swift
//  S5_TableViewController
//
//  Created by MAC06 on 2/11/21.
//

import Foundation
// Codable: Permite que mi clase no necesite un constrcutor porque entiende que esta clase es para el consumo de un API
class HistoryPosts: Codable {

    // ojo: Los nombre de los atributos de mi clase deben ser iguales a los del modelo de mi API
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
