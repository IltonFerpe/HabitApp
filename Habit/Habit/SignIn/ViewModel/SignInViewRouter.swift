//
//  SignInViewRouter.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI

enum SignInViewRouter {
  static func makeHomeView() -> some View {
    let viewModel = HomeViewModel()
    return HomeView(viewModel: viewModel)
  }
}
