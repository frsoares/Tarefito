//
//  Tarefa.swift
//  Tarefito
//
//  Created by Francisco Miranda Soares on 22/10/24.
//

import SwiftUI

struct Tarefa: Identifiable {
    let id = UUID()
    var titulo: String
    var estaConcluida: Bool = false
}
