//
//  StartView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Quick Start")
                        .font(.headline)
                        .padding(.top)
                    
                    Button("Start an Empty Workout") {
                        
                    }
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)
                    
                    HStack {
                        Text("Templates")
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                        .buttonStyle(.bordered)
                        .tint(.mint)
                        
                        Button() {
                            
                        } label: {
                            Image(systemName: "folder")
                        }
                        .buttonStyle(.bordered)
                        .tint(.mint)
                        
                        Button() {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                        .buttonStyle(.bordered)
                        .tint(.mint)
                    }
                    .padding(.vertical)
                    
                    // later going to be a ForEach(folder)
                    HStack {
                        Text("My Templates (#)")
                            .font(.headline)
                        
                        Spacer()
                        
                        Button() {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                        .buttonStyle(.bordered)
                        .tint(.mint)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Lift Log")
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    StartView()
}
