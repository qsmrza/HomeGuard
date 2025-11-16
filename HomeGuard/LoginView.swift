//  LoginView.swift
//
//  Created by Qasim Raza on 10/29/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appData: AppData
    
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var showError = false
    
    private var isFormValid: Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedEmail.contains("@") && trimmedPassword.count >= 4
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.92, green: 0.96, blue: 1.0)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text("Welcome to HomeGuard")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 40)
                    
                    VStack(spacing: 16) {
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.horizontal)
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                    
                    if showError {
                        Text("Please enter a valid email and password (min 4 characters).")
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button(action: {
                        if isFormValid {
                            isLoggedIn = true
                        } else {
                            withAnimation {
                                showError = true
                            }
                        }
                    }) {
                        Text("Login with Email")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid ? Color.blue : Color.gray.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .disabled(!isFormValid)
                    
                    Spacer()
                }
            }
            .background(
                NavigationLink(
                    "",
                    destination: HomeDashboardView(),
                    isActive: $isLoggedIn
                )
                .hidden()
            )
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AppData())
}

