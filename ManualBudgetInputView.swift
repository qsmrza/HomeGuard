//
//  ManualBudgetInputView.swift
//  HomeGuard
//
//  Created by Nadhif Mahmood on 10/30/25.
//

import SwiftUI

struct ManualBudgetInputView: View {
    // User Input Fields
    @State private var incomeText: String = ""
    @State private var aidText: String = ""
    @State private var costsText: String = ""

    // Navigation State
    @State private var navigate = false
    @State private var calculatedBudget: Int = 0

    var body: some View {
        ZStack {
            // Background color
            Color(red: 0.92, green: 0.96, blue: 1.0).ignoresSafeArea()

            VStack(spacing: 24) {
                // Title
                Text("Manual Input Form")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)

                // Input Fields
                VStack(alignment: .leading, spacing: 24) {
                    LabeledNumberField(label: "Monthly Income / Allowance", text: $incomeText)
                    LabeledNumberField(label: "Student Aid / Grants (per month)", text: $aidText)
                    LabeledNumberField(label: "Existing Monthly Costs (e.g., car, food)", text: $costsText)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)

                Spacer()

                // Calculate Button
                Button {
                    let income = Double(incomeText) ?? 0
                    let aid = Double(aidText) ?? 0
                    let costs = Double(costsText) ?? 0
                    let raw = max(0, (income + aid - costs) * 0.30) // 30% affordability rule
                    calculatedBudget = Int(raw.rounded())
                    navigate = true
                } label: {
                    Text("Calculate My Budget")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                }

                // Navigation to Result Screen
                NavigationLink(
                    destination: BudgetResultView(budgetPerMonth: calculatedBudget),
                    isActive: $navigate
                ) {
                    EmptyView()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//Helper for Reusable Number Field
private struct LabeledNumberField: View {
    let label: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .font(.title3)
                .bold()
            TextField("Enter amount", text: $text)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.4))
                )
        }
    }
}

#Preview {
    NavigationView { ManualBudgetInputView() }
}

