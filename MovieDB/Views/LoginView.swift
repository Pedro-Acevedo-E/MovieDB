//
//  LoginView.swift
//  MovieDB
//
//  Created by Pedro Acevedo on 03/03/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @State var isLoading = false
    
    var body: some View {
        if isLoading {
            ProgressView()
        } else {
            VStack (spacing: 10) {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 188, height: 200)
                
                TextField ("Username", text: $loginViewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                SecureField ("Password", text: $loginViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                
                ZStack {
                    Color.blue
                        .opacity(50)
                        .frame(width: 300, height: 50)
                        .cornerRadius(15)
                    Text("Login")
                        .bold()
                        .font(.title2)
                }
                .onTapGesture {
                    if isLoading == false {
                        self.isLoading = true
                        Task {
                            await loginViewModel.login()
                            self.isLoading = false
                        }
                    }
                }
                Text(loginViewModel.statusMessage)
                    .foregroundColor(.red)
                Spacer()
            }
        }
    }
}

