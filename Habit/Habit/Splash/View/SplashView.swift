//
//  SplashView.swift
//  Habit
//
//  Created by Ilton Ferpec on 03/11/23.
//

import SwiftUI

struct SplashView: View {
    
  @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
      Group {
        switch viewModel.uiState {
          case .loading:
            loadingView()
          case .goToSignInScreen:
          viewModel.signInView()
          case .goToHomeScreen:
              Text("Carregar tela principal")
          case .error(let msg):
              loadingView(error: msg)
          }
      }.onAppear(perform: viewModel.onAppear)
        
      }
    }


extension SplashView {
  func loadingView(error: String? = nil) -> some View {
    ZStack {
      Image("logo")
        .resizable()
        .scaledToFit()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(Color.white)
        .ignoresSafeArea()
      
      if let error = error {
        Text("")
          .alert(isPresented: .constant(true))  {
            Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("Ok")) {
              // faz algo quando some o alerta
            })
          }
      }
    }
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = SplashViewModel()
    SplashView(viewModel: viewModel)
  }
}
