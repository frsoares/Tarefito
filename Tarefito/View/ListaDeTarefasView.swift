//
//  ContentView.swift
//  Tarefito
//
//  Created by Francisco Miranda Soares on 22/10/24.
//

import SwiftUI

struct ListaDeTarefasView: View {
    @State private var viewModel = TarefaViewModel()
    @State private var novoTitulo = ""

    var body: some View {
        VStack {
            // Campo para adicionar novas tarefas
            HStack {
                TextField("Nova tarefa", text: $novoTitulo)
                Button(action: {
                    viewModel.adicionarTarefa(titulo: novoTitulo)
                    novoTitulo = ""  // Limpa o campo após adicionar
                }) {
                    Text("Adicionar")
                }
            }
            .padding()

            // Lista de tarefas com dados fornecidos pelo ViewModel
            List {
                ForEach(viewModel.tarefasExibidas) { tarefa in
                    HStack {
                        Text(tarefa.titulo)
                        Spacer()
                        Button(action: {
                            viewModel.marcarComoConcluida(id: tarefa.id)
                        }) {
                            Image(systemName: tarefa.estaConcluida ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let tarefa = viewModel.tarefasExibidas[index]
                        viewModel.removerTarefa(id: tarefa.id)
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
