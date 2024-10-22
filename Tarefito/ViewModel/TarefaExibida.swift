//
//  TarefaExibida.swift
//  Tarefito
//
//  Struct que representa os dados que a View vai exibir
//
//  Created by Francisco Miranda Soares on 22/10/24.
//

import SwiftUI

struct TarefaExibida: Identifiable {
    let id: UUID
    let titulo: String
    let estaConcluida: Bool
}
