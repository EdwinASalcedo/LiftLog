//
//  SetRowView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/18/25.
//

import SwiftUI

extension Double {
    func trimmedWeightString() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        //formatter.usesGroupingSeparator = false
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    var content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}

struct SetRowView: View {
    @Binding var set: LiftSet
    var setNumber: Int
    
    @State private var isEditingWeight = false
    @State private var weightInput: String = ""
    @State private var isEditingReps = false
    @State private var repsInput: String = ""
    @State private var isCompleted = false
    
    @FocusState private var focusedField: Field?
    enum Field {
        case weight, reps
    }
    
    var body: some View {
        HStack {
            Text("\(setNumber)")
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(isCompleted ? .clear : .gray.opacity(0.2)))
            
            Spacer()
            
            Text("\(set.weight.trimmedWeightString()) lb x \(String(set.reps))")
                .foregroundStyle(.secondary)
            
            Spacer()
            
            if isEditingWeight {
                TextField("", text: $weightInput)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .weight)
                    .multilineTextAlignment(.center)
                    .frame(width: 60)
                    .padding(.vertical, 7)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(isCompleted ? .clear : .gray.opacity(0.2)))
                    .onChange(of: weightInput) {
                        weightInput = String(weightInput.prefix(4).filter { $0.isNumber })
                    }
                    .onAppear {
                        weightInput = "\(set.weight.trimmedWeightString())"
                        focusedField = .weight
                    }
                    .onSubmit {
                        if let newWeight = Double(weightInput) {
                            set.weight = newWeight
                        }
                        isEditingWeight = false
                    }
            } else {
                Text(String(set.weight.trimmedWeightString()))
                    .frame(width: 60)
                    .padding(.vertical, 7)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(isCompleted ? .clear : .gray.opacity(0.2)))
                    .onTapGesture {
                        isEditingWeight = true
                    }
            }
            
            Spacer()
            
            if isEditingReps {
                TextField("", text: $repsInput)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .reps)
                    .multilineTextAlignment(.center)
                    .frame(width: 60)
                    .padding(.vertical, 7)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(isCompleted ? .clear : .gray.opacity(0.2)))
                    .onChange(of: repsInput) {
                        repsInput = String(repsInput.prefix(4).filter { $0.isNumber })
                    }
                    .onAppear {
                        repsInput = "\(set.reps)"
                        focusedField = .reps
                    }
                    .onSubmit {
                        if let newReps = Int(repsInput) {
                            set.reps = newReps
                        }
                        isEditingReps = false
                    }
            } else {
                Text(String(set.reps))
                    .frame(width: 60)
                    .padding(.vertical, 7)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(isCompleted ? .clear : .gray.opacity(0.2)))
                    .onTapGesture {
                        isEditingReps = true
                    }
            }
            
            Spacer()
            
            Button() {
                isCompleted.toggle()
            } label: {
                Image(systemName: "checkmark")
            }
            .buttonStyle(.borderedProminent)
            .tint(isCompleted ? .green : .gray.opacity(0.2))
            .foregroundStyle(.primary)
        }
        .padding(.vertical, 8)
        .background(isCompleted ? Color.mint.opacity(0.1) : Color.clear)
    }
}

#Preview {
    StatefulPreviewWrapper(LiftSet.example) { binding in
        SetRowView(set: binding, setNumber: 1)
    }
}
