//
//  ContentView.swift
//  Tarefito
//
//  Created by Francisco Miranda Soares on 22/10/24.
//

import SwiftUI

struct ListaDeTarefasView: View {
    @State private var backlog = Backlog()
    @State private var novoTitulo = ""

    var body: some View {
        VStack {
            // Campo para adicionar novas tarefas
            HStack {
                TextField("Nova tarefa", text: $novoTitulo)
                Button(action: {
                    backlog.adicionarTarefa(titulo: novoTitulo)
                    novoTitulo = ""  // Limpa o campo após adicionar
                }) {
                    Text("Adicionar")
                }
            }
            .padding()

            // Lista de tarefas
            List {
                ForEach(backlog.tarefas) { tarefa in
                    HStack {
                        Text(tarefa.titulo)
                        Spacer()
                        Button(action: {
                            backlog.marcarComoConcluida(id: tarefa.id)
                        }) {
                            Image(systemName: tarefa.estaConcluida ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let tarefa = backlog.tarefas[index]
                        backlog.removerTarefa(id: tarefa.id)
                    }
                }
            }
        }
        .navigationTitle("Tarefas")
    }
}

#Preview {
    ListaDeTarefasView()
}
