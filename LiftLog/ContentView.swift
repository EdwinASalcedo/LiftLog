//
//  ContentView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
            StartView()
                .tabItem {
                    Label("Start Lifting", systemImage: "plus")
                }
            ExcercisesView()
                .tabItem {
                    Label("Excercises", systemImage: "dumbbell")
                }
        }
    }
}

#Preview {
    ContentView()
}
