//
//  SplashView.swift
//  Habit
//
//  Created by Ilton Ferpec on 03/11/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var state: SplashUiState = .loading
    var body: some View {
        switch state {
        case .loading:
          loadingView()
        case .goToSignInScreen:
            Text("Carregar tela de login")
        case .goToHomeScreen:
            Text("Carregar tela principal")
        case .error(let msg):
            Text("Mostrar erro: \(msg)")
        }
    }
}

extension SplashView {
  func loadingView() -> some View {
    ZStack {
      Image("logo")
        .resizable()
        .scaledToFit()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background(Color.white)
        .ignoresSafeArea()
    }
  }
}

#Preview {
    SplashView()
}
