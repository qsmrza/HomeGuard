//
//  PodsHubView.swift
//  HomeGuard
//
//  Created by Qasim Raza on 11/15/25.
//


//  PodsHubView.swift
//  HomeGuard

import SwiftUI

struct PodsHubView: View {
    @EnvironmentObject var appData: AppData
    
    @State private var showingCreateSheet = false
    @State private var searchText = ""
    
    private var filteredPods: [Pod] {
        let trimmed = searchText.lowercased().trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return appData.pods }
        return appData.pods.filter {
            $0.name.lowercased().contains(trimmed) ||
            $0.location.lowercased().contains(trimmed)
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Community Pods")
                            .font(.title)
                            .bold()
                        Text("Create or join groups that help with rides, groceries, bills and more.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    
                    Button {
                        showingCreateSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                    }
                    .accessibilityLabel("Create Pod")
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search pods or locations", text: $searchText)
                        .textInputAutocapitalization(.never)
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 1, y: 1)
                .padding(.horizontal)
                
                if filteredPods.isEmpty {
                    Spacer()
                    VStack(spacing: 10) {
                        Image(systemName: "person.3.sequence.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        Text("No pods yet")
                            .font(.headline)
                        Text("Tap the + to start a pod for rides, groceries, bills, and emergencies.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 14) {
                            ForEach(filteredPods) { pod in
                                NavigationLink(destination: PodDetailView(pod: pod)) {
                                    PodCardView(pod: pod)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                    }
                }
            }
        }
        .navigationTitle("Pods")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingCreateSheet) {
            CreatePodView()
                .environmentObject(appData)
        }
    }
}

struct PodCardView: View {
    let pod: Pod
    
    private var activeModulesText: String {
        var parts: [String] = []
        if pod.carpoolEnabled { parts.append("Carpools") }
        if pod.groceriesEnabled { parts.append("Groceries") }
        if pod.billsEnabled { parts.append("Bills") }
        if pod.emergencyEnabled { parts.append("Emergency") }
        return parts.joined(separator: " • ")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(pod.name)
                    .font(.headline)
                Spacer()
                Text(pod.location)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Text(pod.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            if !activeModulesText.isEmpty {
                HStack(spacing: 6) {
                    Image(systemName: "square.grid.2x2.fill")
                        .font(.caption)
                        .foregroundColor(.black)
                    Text(activeModulesText)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 2, y: 1)
    }
}

#Preview {
    NavigationView {
        PodsHubView()
            .environmentObject(AppData())
    }
}
