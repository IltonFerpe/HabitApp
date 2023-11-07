//
//  SignUpViewModel.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
  
  var publisher: PassthroughSubject<Bool, Never>!
  
  @Published var uiState: SignUpUiState = .none
  
  func signUp() {
      self.uiState = .loading
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.uiState = .success
        self.publisher.send(true)
      }
    }
  
  }
  
extension SignUpViewModel {
  func homeView() -> some View {
    return SignUpViewRouter.makeHomeView()
  }
}
