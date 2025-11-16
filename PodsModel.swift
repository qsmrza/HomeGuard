//
//  Pod.swift
//  HomeGuard
//
//  Created by Qasim Raza on 11/15/25.
//


//  PodsModel.swift
//  HomeGuard

import SwiftUI

struct Pod: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var description: String
    var location: String

    var carpoolEnabled: Bool
    var groceriesEnabled: Bool
    var billsEnabled: Bool
    var emergencyEnabled: Bool
}

final class AppData: ObservableObject {
    // In-memory pods for demo
    @Published var pods: [Pod] = [
        Pod(
            name: "Campus Crew",
            description: "Shared rides, groceries, bills & study hangs.",
            location: "On-Campus",
            carpoolEnabled: true,
            groceriesEnabled: true,
            billsEnabled: true,
            emergencyEnabled: true
        ),
        Pod(
            name: "Off-Campus Roomies",
            description: "Track rides to class and split utilities.",
            location: "North Apartments",
            carpoolEnabled: true,
            groceriesEnabled: false,
            billsEnabled: true,
            emergencyEnabled: true
        )
    ]
}
