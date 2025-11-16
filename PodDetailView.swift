//
//  PodDetailView.swift
//  HomeGuard
//
//  Created by Qasim Raza on 11/15/25.
//


//  PodDetailView.swift
//  HomeGuard

import SwiftUI

struct PodDetailView: View {
    let pod: Pod
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text(pod.name)
                            .font(.largeTitle.bold())
                        Text(pod.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        if !pod.description.isEmpty {
                            Text(pod.description)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    // Modules grid
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Pod Modules")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.flexible()),
                                            GridItem(.flexible())],
                                  spacing: 12) {
                            if pod.carpoolEnabled {
                                ModuleCard(
                                    title: "Carpools",
                                    subtitle: "Request or offer rides",
                                    systemImage: "car.fill"
                                )
                            }
                            if pod.groceriesEnabled {
                                ModuleCard(
                                    title: "Groceries",
                                    subtitle: "Shared lists & costs",
                                    systemImage: "cart.fill"
                                )
                            }
                            if pod.billsEnabled {
                                ModuleCard(
                                    title: "Bills",
                                    subtitle: "Rent & utilities reminders",
                                    systemImage: "creditcard.fill"
                                )
                            }
                            if pod.emergencyEnabled {
                                ModuleCard(
                                    title: "Emergency",
                                    subtitle: "Contacts & resources",
                                    systemImage: "exclamationmark.triangle.fill"
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Demo "today in this pod" section (static for now)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Today in this pod")
                            .font(.headline)
                        
                        DemoRequestRow(
                            icon: "car.fill",
                            title: "Need ride to campus at 8:15 AM",
                            detail: "From North Apartments → Main Campus"
                        )
                        DemoRequestRow(
                            icon: "cart.fill",
                            title: "Costco run tonight",
                            detail: "Split snacks & drinks"
                        )
                        DemoRequestRow(
                            icon: "person.2.fill",
                            title: "Study session for CS exam",
                            detail: "Library 3rd floor at 7 PM"
                        )
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
            }
        }
        .navigationTitle("Pod Dashboard")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ModuleCard: View {
    let title: String
    let subtitle: String
    let systemImage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: systemImage)
                .font(.title2)
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 110, alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 2, y: 1)
    }
}

struct DemoRequestRow: View {
    let icon: String
    let title: String
    let detail: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .padding(8)
                .background(Color(.systemGray5))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline.bold())
                Text(detail)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 1, y: 1)
    }
}

#Preview {
    NavigationView {
        PodDetailView(
            pod: Pod(
                name: "Campus Crew",
                description: "Shared rides, groceries, bills & study hangs.",
                location: "On-Campus",
                carpoolEnabled: true,
                groceriesEnabled: true,
                billsEnabled: true,
                emergencyEnabled: true
            )
        )
    }
}
