//
//  StartView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/15/25.
//

import SwiftUI

struct StartView: View {
    let folders: [Folder] = [Folder.example, Folder.example, Folder.example]
    // fit as many columns in view so long as there is a min 150 px gap
    let columns = [
        GridItem(.adaptive(minimum: 130))
    ]
    @State private var showingPopover = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Quick Start")
                        .font(.headline)
                        .padding(.top)
                    
                    Button("Start an Empty Workout") {
                        
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.bordered)
                    
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
                        .tint(.blue)
                        
                        Button() {
                            
                        } label: {
                            Image(systemName: "folder")
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)
                        
                        Button() {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)
                    }
                    .padding(.vertical)
                    
                    ForEach(folders) { folder in
                        HStack {
                            Text(folder.name)
                            Text("(\(folder.numberOfTemplates))")
                            
                            Spacer()
                            
                            Button() {
                                
                            } label: {
                                Image(systemName: "ellipsis")
                            }
                            .buttonStyle(.bordered)
                            .tint(.blue)
                        }
                        
                        LazyVGrid(columns: columns) {
                            ForEach(folder.templates) { template in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(template.name)
                                        
                                        Spacer()
                                        
                                        Button() {
                                            
                                        } label: {
                                            Image(systemName: "ellipsis")
                                        }
                                        .buttonStyle(.bordered)
                                        .tint(.blue)
                                    }
                                    .padding([.top, .horizontal])
                                    
                                    Text(template.exercises.map {$0.name}.joined(separator: ", "))
                                        .padding(.horizontal)
                                        .foregroundStyle(.secondary)
                                    
                                    Spacer()
                                }
                                .frame(minHeight: 150, maxHeight: 150)
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.secondary)
                                )
                                .onTapGesture {
                                    showingPopover = true
                                    print("Hi")
                                }
                            }
                        }
                        .padding(.bottom)
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
