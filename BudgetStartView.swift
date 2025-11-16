//
//  BudgetStartView.swift
//  HomeGuard
//
//  Created by Nadhif Mahmood on 10/30/25.
//

import SwiftUI

struct BudgetStartView: View {
    // Body
    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.92, green: 0.96, blue: 1.0)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 28) {
                    // Title
                    Text("Let's Find Your Budget")
                        .font(.title)
                        .bold()
                        .padding(.top, 40)

                    // Secure Link (Unresponsive)
                    VStack(spacing: 16) {
                        Text("Securely Link Financial Account")
                            .font(.title3)

                        Text("Link Account")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.black.opacity(0.6), lineWidth: 2)
                            .background(RoundedRectangle(cornerRadius: 18).fill(.white))
                    )
                    .padding(.horizontal, 24)

                    // Divider Text
                    Text("Or, Enter Info Manually")
                        .foregroundColor(.gray)

                    // Manual Entry Button
                    VStack(spacing: 16) {
                        NavigationLink(destination: ManualBudgetInputView()) {
                            Text("Enter Manually")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.black.opacity(0.6), lineWidth: 2)
                                )
                        }
                        .foregroundColor(.black)
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.black.opacity(0.6), lineWidth: 2)
                            .background(RoundedRectangle(cornerRadius: 18).fill(.white))
                    )
                    .padding(.horizontal, 24)

                    Spacer(minLength: 40)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView { BudgetStartView() }
}
