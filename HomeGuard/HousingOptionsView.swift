//
//  HousingOptionsView.swift
//  HomeGuard
//
//  Created by Nadhif Mahmood on 10/30/25.
//

import SwiftUI

struct HousingOptionsView: View {
    // Data Model
    struct HousingOption: Identifiable {
        let id = UUID()
        let price: Int
        let title: String
        let details: String
    }

    // Budget Cap (only used for title text)
    let budgetCap: Int

    // Budget options
    private let hardcodedOptions: [HousingOption] = [
        .init(price: 1150, title: "$1150 / month", details: "2 bed | 2 bath"),
        .init(price: 1150, title: "$1150 / month", details: "2 bed | 2 bath")
    ]

    var body: some View {
        ZStack {
            // Background tint like your other screens
            Color(red: 0.92, green: 0.96, blue: 1.0).ignoresSafeArea()

            VStack(spacing: 0) {
                // MARK: - Title
                Text("Housing (\(budgetCap) & Under)")
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical, 16)

                // Map placeholder with Filters pill at top-right
                ZStack(alignment: .topTrailing) {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.gray.opacity(0.25),
                                    Color.gray.opacity(0.15),
                                    Color.gray.opacity(0.1)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 250)

                    // Filters pill (unresponsive)
                    Button(action: {}) {
                        Label("Filters", systemImage: "slider.horizontal.3")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .cornerRadius(14)
                            .shadow(radius: 4, y: 2)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 12)
                }

                // Listings (ALWAYS the two hard-coded cards)
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(hardcodedOptions) { item in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.title)
                                    .font(.title3)
                                    .bold()
                                Text(item.details)
                                    .foregroundColor(.gray)
                            }
                            .padding(18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.black.opacity(0.75), lineWidth: 2)
                            )
                            .cornerRadius(18)
                            .padding(.horizontal, 20)
                        }

                    }
                    .padding(.top, 20)
                    .padding(.bottom, 24)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView { HousingOptionsView(budgetCap: 450) }
}

