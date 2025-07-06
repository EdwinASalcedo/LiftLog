//
//  AddExerciseView.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 7/5/25.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var userExercises: [Exercise]

    @State private var name: String = ""
    @State private var selectedBodyPart: String? = nil
    @State private var selectedCategory: String? = nil

    let bodyParts = ["Core", "Chest", "Back", "Shoulders", "Arms", "Legs", "Other", "Olympic", "Full Body", "Cardio"]
    let categories = ["Barbell", "Dumbbell", "Machine / Other", "Weighted Bodyweight", "Assisted Bodyweight", "Reps Only", "Cardio", "Duration"]

    var isFormComplete: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && selectedBodyPart != nil && selectedCategory != nil
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Name")
                    .font(.headline)
                TextField("Add Name", text: $name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .bold()
                    .foregroundStyle(name.isEmpty ? .black : .gray)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))

                Text("Body Part")
                    .font(.headline)
                WrapHStack(items: bodyParts, selection: $selectedBodyPart)

                Text("Category")
                    .font(.headline)
                Menu {
                    ForEach(categories, id: \.self) { category in
                        Button(category) { selectedCategory = category }
                    }
                } label: {
                    HStack {
                        Text(selectedCategory ?? "Select an Option")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .foregroundStyle(selectedCategory == nil ? .gray : .black)
                            
                        Image(systemName: "chevron.up.chevron.down")
                            .foregroundStyle(.black)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Create New Exercise")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .padding(6)
                            .foregroundStyle(.black)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newExercise = Exercise(
                            id: UUID().uuidString,
                            name: name.trimmingCharacters(in: .whitespaces),
                            bodyPart: selectedBodyPart!,
                            category: selectedCategory!
                        )
                        
                        userExercises.append(newExercise)
                        ExerciseStore.shared.save(userExercises)
                        dismiss()
                    }
                    .disabled(!isFormComplete)
                }
            }
        }
    }
}

struct WrapHStack: View {
    let items: [String]
    @Binding var selection: String?

    var body: some View {
        let rows = Array(items.chunked(into: 4))
        VStack(alignment: .leading) {
            ForEach(rows, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button(action: { selection = item }) {
                            Text(item)
                                .bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .foregroundStyle(selection == item ? Color.white : Color.black)
                                .background(selection == item ? Color.blue : Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

class ExerciseStore {
    static let shared = ExerciseStore()
    private let key = "userExercises"

    func load() -> [Exercise] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([Exercise].self, from: data) else { return [] }
        return decoded
    }

    func save(_ exercises: [Exercise]) {
        if let data = try? JSONEncoder().encode(exercises) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}


#Preview {
    StatefulPreviewWrapper([Exercise(id: UUID().uuidString, name: "Lat Pullover", bodyPart: "Back", category: "Machine / Other")]) { binding in
            AddExerciseView(userExercises: binding)
    }
}
