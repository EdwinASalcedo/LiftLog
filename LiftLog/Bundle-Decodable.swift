//
//  Bundle-Decodable.swift
//  LiftLog
//
//  Created by Edwin Salcedo on 6/10/25.
//

import Foundation

extension Bundle {
    // By adding <T:Decodabel> it allows for any JSON file to be decoded for any type of struct you create
    // the parameter takes in a filepath String and returns the T generic/type/struct
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            // filepath doesn't exist within app bundle
            fatalError("Failed to locate \(file) in bundle.")
        }

        // url successful so now get the internal data from the filepath
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        do {
            // data successfuly so now try and actually decode the data into preferred generic/type/struct
            return try decoder.decode(T.self, from: data)
            // if not successful then one of the below errors will be thrown
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
