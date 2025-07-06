//
//  ProfileView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Image(systemName: "person")
                        .padding(.horizontal)
                    
                    VStack {
                        Text("Edwin Salcedo")
                        Text("# workouts")
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "gearshape.fill")
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "ruler.fill")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
