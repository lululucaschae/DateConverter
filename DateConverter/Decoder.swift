//
//  Decoder.swift
//  DateConverter
//
//  Created by Lucas Chae on 6/2/22.
//

import Foundation

extension Bundle {

    func decode<T: Codable> (_ file: String) -> T {

        // Find path to the file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // load information of the url into data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }

        let decoder = JSONDecoder()

        // Decoding "Date" format
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        do {
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch {
            fatalError("Failed to decode \(file) from bundle. Error: \(error)")
        }
    }
}
