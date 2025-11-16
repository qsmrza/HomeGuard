//
//  CreatePodView.swift
//  HomeGuard
//
//  Created by Qasim Raza on 11/15/25.
//


//  CreatePodView.swift
//  HomeGuard

import SwiftUI

struct CreatePodView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appData: AppData
    
    @State private var name = ""
    @State private var description = ""
    @State private var location = ""
    
    @State private var enableCarpools = true
    @State private var enableGroceries = false
    @State private var enableBills = false
    @State private var enableEmergency = true
    
    @State private var showValidation = false
    
    private var isFormValid: Bool {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedLocation = location.trimmingCharacters(in: .whitespacesAndNewlines)
        let hasModule = enableCarpools || enableGroceries || enableBills || enableEmergency
        
        return trimmedName.count >= 3 &&
               !trimmedLocation.isEmpty &&
               description.count <= 160 &&
               hasModule
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pod Info")) {
                    TextField("Pod name (e.g. Campus Carpool Pod)", text: $name)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Short description (optional)", text: $description, axis: .vertical)
                        .lineLimit(2...4)
                    
                    TextField("Location / area (e.g. On-Campus, North Side)", text: $location)
                        .textInputAutocapitalization(.words)
                    
                    if showValidation && !isFormValid {
                        VStack(alignment: .leading, spacing: 4) {
                            if name.trimmingCharacters(in: .whitespacesAndNewlines).count < 3 {
                                Text("• Pod name should be at least 3 characters.")
                            }
                            if location.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                Text("• Please add a location or area.")
                            }
                            if description.count > 160 {
                                Text("• Description must be under 160 characters.")
                            }
                            if !(enableCarpools || enableGroceries || enableBills || enableEmergency) {
                                Text("• Select at least one module.")
                            }
                        }
                        .font(.caption)
                        .foregroundColor(.red)
                    }
                }
                
                Section(header: Text("Modules")) {
                    Toggle("Carpools & rides", isOn: $enableCarpools)
                    Toggle("Shared groceries", isOn: $enableGroceries)
                    Toggle("Bill reminders / rent split", isOn: $enableBills)
                    Toggle("Emergency contacts", isOn: $enableEmergency)
                }
            }
            .navigationTitle("Create Pod")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        if isFormValid {
                            let newPod = Pod(
                                name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                                description: description.trimmingCharacters(in: .whitespacesAndNewlines),
                                location: location.trimmingCharacters(in: .whitespacesAndNewlines),
                                carpoolEnabled: enableCarpools,
                                groceriesEnabled: enableGroceries,
                                billsEnabled: enableBills,
                                emergencyEnabled: enableEmergency
                            )
                            appData.pods.insert(newPod, at: 0)
                            dismiss()
                        } else {
                            withAnimation {
                                showValidation = true
                            }
                        }
                    }
                    .disabled(!isFormValid)
                }
            }
        }
    }
}

#Preview {
    CreatePodView()
        .environmentObject(AppData())
}
