//
//  HomeView.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var viewModel: HomeViewModel
  
  var body: some View {
    Text("Ola home page")
  }
}


struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(viewModel: HomeViewModel())
  }
}
