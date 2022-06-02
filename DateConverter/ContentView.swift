//
//  ContentView.swift
//  DateConverter
//
//  Created by Lucas Chae on 6/2/22.
//

import SwiftUI

struct Model: Codable, Identifiable {
    let id = UUID()
    let date: Date?

    var formattedLaunchDate: String {
        date?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

let dates: [Model] = Bundle.main.decode("original.json")

// let dates: [Model] = Bundle.main.decode("sample2.json")

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach (dates) { date in
                    Text(date.formattedLaunchDate)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
