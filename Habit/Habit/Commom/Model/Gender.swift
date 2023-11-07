//
//  Gender.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
  case male = "Masculino"
  case female = "Feminino"
  
  var id: String {
    self.rawValue
  }
}
