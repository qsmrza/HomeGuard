//  HomeDashboardView.swift
//  HomeGuard
//
//  Created by Mimi Makki on 10/29/25.
//

import SwiftUI

struct HomeDashboardView: View {
    @State private var username: String = "User"

    var body: some View {
        TabView {
            // MARK: - Home Tab
            NavigationView {
                ZStack {
                    Color(.systemGray6)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 30) {
                        // Screen Title
                        Text("Home Dashboard")
                            .font(.title)
                            .bold()
                            .padding(.top, 40)

                        // LOGO IMAGE
                        Image("HomeGuardLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 5)
                            .padding(.top, 10)

                        // Greeting
                        Text("Hi, \(username)!")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.bottom, 10)

                        // Buttons
                        VStack(spacing: 20) {
                            // Budget
                            NavigationLink(destination: BudgetStartView()) {
                                Text("Find Your Budget")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 40)
                            }
                            // Roommates
                            NavigationLink(destination: Text("Roommate Page Placeholder")) {
                                Text("Find a Roommate")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 40)
                            }
                            // Pods
                            NavigationLink(destination: PodsHubView()) {
                                Text("Create or Find a Pod")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 40)
                            }
                        }

                        Spacer()
                    }
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            // MARK: - Roommates Tab
            NavigationView {
                VStack {
                    Text("Roommates Hub Placeholder")
                        .font(.title2)
                        .padding()
                    Text("This will contain the roommate matching interface.")
                        .foregroundColor(.gray)
                }
                .navigationTitle("Roommates")
            }
            .tabItem {
                Label("Roommates", systemImage: "person.2")
            }

            // MARK: - Pods Tab
            NavigationView {
                PodsHubView()
            }
            .tabItem {
                Label("Pods", systemImage: "circles.hexagonpath.fill")
            }
        }
    }
}

#Preview {
    HomeDashboardView()
        .environmentObject(AppData())
}

