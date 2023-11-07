//
//  SignInViewModel.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI

class SignInViewModel: ObservableObject {
  
  
  @Published var uiState: SignInUiState = .none
  
  func login(email: String, password: String) {
    self.uiState = .loading
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.uiState = .goToHomeScreen
    }
  }
}

extension SignInViewModel {
  func homeView() -> some View {
    return SignInViewRouter.makeHomeView()
  }
}
