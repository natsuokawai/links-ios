//
//  LinkStore.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

@MainActor
class LinkStore: ObservableObject {
    @Published var links: [Link] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("links.data")
    }
    
    func load() async throws {
        let task = Task<[Link], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let links = try JSONDecoder().decode([Link].self, from: data)
            return links
        }
        let links = try await task.value
        self.links = links
    }
    
    func save(links: [Link]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(links)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
