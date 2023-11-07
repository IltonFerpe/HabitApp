//
//  SplashViewRouter.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI

enum SplashViewRouter {
  
  static func makeSignInView() -> some View {
    let viewModel = SignInViewModel()
    return SignInView(viewModel: viewModel)
  }
  
}
