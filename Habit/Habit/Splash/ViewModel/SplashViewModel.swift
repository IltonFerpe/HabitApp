//
//  SplashViewMode.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI

class SplashViewModel: ObservableObject {
  
  @Published var uiState: SplashUiState = .loading
  
  
  func onAppear() {
    // faz algo assincrono e muda o estado da uiState
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      // aqui é chamado depois de 3 segundos
//      self.uiState = .error("Erro na resposta do servidor")
      self.uiState = .goToSignInScreen
    }
  }
  
}

extension SplashViewModel {
  func signInView() -> some View {
    return SplashViewRouter.makeSignInView()
  }
}
