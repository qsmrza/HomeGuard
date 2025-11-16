//
//  BudgetResultView.swift
//  HomeGuard
//
//  Created by Nadhif Mahmood on 10/30/25.
//

import SwiftUI

struct BudgetResultView: View {
    // Passed Data
    let budgetPerMonth: Int

    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.92, green: 0.96, blue: 1.0)
                .ignoresSafeArea()

            VStack(spacing: 28) {
                // Title
                Text("Your Housing Budget")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)

                // Displayed Budget
                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Text("$\(budgetPerMonth)")
                        .font(.system(size: 56, weight: .bold))
                        .foregroundColor(.black)
                    Text("/ month")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .padding(.top, 10)

                // Semi Gauge Visualization
                SemiGauge()
                    .frame(width: 280, height: 140)
                    .padding(.top, 10)

                Text("~30% affordable")
                    .foregroundColor(.gray)

                Spacer()

                // Navigation to Housing Options
                NavigationLink(destination: HousingOptionsView(budgetCap: budgetPerMonth)) {
                    Text("See Housing Options In Your Budget")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Semi-Gauge Shape
private struct SemiGauge: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.5)
                .rotation(Angle(degrees: 180))
                .stroke(Color.gray.opacity(0.25), lineWidth: 28)
            Text("Recommended\nRent")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    NavigationView { BudgetResultView(budgetPerMonth: 450) }
}

