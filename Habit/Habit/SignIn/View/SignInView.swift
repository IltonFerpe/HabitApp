//
//  SignInView.swift
//  Habit
//
//  Created by Ilton Ferpec on 07/11/23.
//

import SwiftUI

struct SignInView: View {
  
  @ObservedObject var viewModel: SignInViewModel
  
  @State var email = ""
  @State var password = ""
  @State var navigationHidden = true
  
  @State var action: Int? = 0
  
  var body: some View {
    ZStack {
      if case SignInUiState.goToHomeScreen = viewModel.uiState {
        viewModel.homeView()
      } else {
        NavigationView {
          
          ScrollView(showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
              
              Spacer(minLength: 36)
              
              VStack(alignment: .center, spacing: 8) {
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .padding(.horizontal, 48)
                
                Text("Login")
                  .foregroundColor(.orange)
                  .font(Font.system(.title).bold())
                  .padding(.bottom, 8)
                
                emailField
                
                passwordField
                
                enterButton
                
                registerLink
                
                Text("Copyright @YYY")
                  .foregroundColor(Color.gray)
                  .font(Font.system(size: 16).bold())
                  .padding(.top, 16)
                
              }
            }
            
            if case SignInUiState.error(let value) = viewModel.uiState {
              Text("")
                .alert(isPresented: .constant(true)) {
                  Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
                    // faz algo quando some o alerta
                  })
                }
            }
            
          }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.white)
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(navigationHidden)
        }
        .onAppear {
          self.navigationHidden = true
        }
        .onDisappear {
          self.navigationHidden = false
        }
      }
    }
    
    
    
  }
}

extension SignInView {
  var emailField: some View {
    TextField("", text: $email)
      .border(Color.black)
  }
}

extension SignInView {
  var passwordField: some View {
    SecureField("", text: $password)
      .border(Color.black)
  }
}

extension SignInView {
  var enterButton: some View {
    Button("Entrar") {
      viewModel.login(email: email, password: password)
    }
  }
}

extension SignInView {
  var registerLink: some View {
    VStack {
      Text("Ainda não possui um login ativo?")
        .foregroundColor(.gray)
        .padding(.top, 48)
      
      ZStack {
        NavigationLink(
          destination: viewModel.signUpView(),
          tag: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/,
          selection: $action,
          label: { EmptyView()})
        
        Button("Realize seu Cadastro") {
          self.action = 1
        }
      }
    }
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = SignInViewModel()
    SignInView(viewModel: viewModel)
  }
}
