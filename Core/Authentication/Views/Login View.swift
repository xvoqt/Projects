//
//  Login View.swift
//  Threads
//
//  Created by Mel Andrade-Muñoz on 11/6/23.
//

import SwiftUI

struct Login_View: View {

    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                Image("threads-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(ThreadsTextFieldModifier())
                        .autocapitalization(.none)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task { try await viewModel.login() }
                } label: {
                    Text("Login")
                        .modifier(ThreadsTextButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    Registration_View()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Login_View()
    }
}
