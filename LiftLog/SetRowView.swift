//
//  SetRowView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/18/25.
//

import SwiftUI

struct SetRowView: View {
    var body: some View {
        HStack{
            Button("#") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.bordered)
            
            Spacer()
            
            Text("50 lb x 10")
            
            Spacer()
            
            Button("50") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.bordered)
            
            Spacer()
            
            Button("10") {
                
            }
            .foregroundStyle(.primary)
            .buttonStyle(.bordered)
            
            Spacer()
            
            Button() {
                
            } label: {
                Image(systemName: "checkmark")
            }
            .foregroundStyle(.primary)
            .buttonStyle(.bordered)
        }
        //.padding(.horizontal)
    }
}

#Preview {
    SetRowView()
}
