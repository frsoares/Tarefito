//
//  Backlog.swift
//  Tarefito
//
//  Created by Francisco Miranda Soares on 22/10/24.
//

import SwiftUI

@Observable
class Backlog {
    var tarefas: [Tarefa] = []

    func adicionarTarefa(titulo: String) {
        let novaTarefa = Tarefa(titulo: titulo)
        tarefas.append(novaTarefa)
    }

    func marcarComoConcluida(id: UUID) {
        if let index = tarefas.firstIndex(where: { $0.id == id }) {
            tarefas[index].estaConcluida.toggle()
        }
    }

    func removerTarefa(id: UUID) {
        tarefas.removeAll { $0.id == id }
    }
}
