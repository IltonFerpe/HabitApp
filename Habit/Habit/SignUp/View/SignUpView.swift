//
//  SignUpView.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI

struct SignUpView: View {
  
  @State var fullName = ""
  @State var email = ""
  @State var password = ""
  @State var document = ""
  @State var phone = ""
  @State var birthday = ""
  @State var gender = Gender.male
  
  @ObservedObject var viewModel: SignUpViewModel
  
  var body: some View {
    ZStack {
      ScrollView(showsIndicators: false) {
        
        
        VStack(alignment: .center) {
          
          VStack(alignment: .leading, spacing: 8) {
            Text("Cadastro")
              .foregroundColor(.black)
              .font(Font.system(.title).bold())
              .padding(.bottom, 8)
            
            fullNameField
            
            emailField
            
            passwordField
            
            documentField
            
            phoneField
            
            birthdayField
            
            genderField
            
            saveButton
          }
          Spacer()
        }.padding(.horizontal, 8)
      }.padding(20)
      
      if case SignUpUiState.error(let value) = viewModel.uiState {
        Text("")
          .alert(isPresented: .constant(true)) {
            Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
              // faz algo quando some o alerta
            })
          }
      }
    }
    
  }
}

extension SignUpView {
  var fullNameField: some View {
    TextField("", text: $fullName)
      .border(Color.black)
  }
}

extension SignUpView {
  var emailField: some View {
    TextField("", text: $email)
      .border(Color.black)
  }
}

extension SignUpView {
  var passwordField: some View {
    SecureField("", text: $password)
      .border(Color.black)
  }
}

extension SignUpView {
  var documentField: some View {
    TextField("", text: $document)
      .border(Color.black)
  }
}

extension SignUpView {
  var phoneField: some View {
    TextField("", text: $phone)
      .border(Color.black)
  }
}

extension SignUpView {
  var birthdayField: some View {
    TextField("", text: $birthday)
      .border(Color.black)
  }
}

extension  SignUpView {
  var genderField: some View {
    Picker("Gender", selection: $gender) {
      ForEach(Gender.allCases, id: \.self) { value in
       Text(value.rawValue)
          .tag(value)
      }
    }.pickerStyle(SegmentedPickerStyle())
      .padding(.top, 16)
      .padding(.bottom, 32)
  }
}

extension SignUpView {
  var saveButton: some View {
    Button("Realize o seu cadastro") {
      viewModel.signUp()
    }
  }
}

#Preview {
  SignUpView(viewModel: SignUpViewModel())
}
