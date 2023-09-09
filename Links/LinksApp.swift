//
//  LinksApp.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

@main
struct LinksApp: App {
    @StateObject private var store = LinkStore()
    @State private var err: Error?
    @State private var isPresentingError = false

    var body: some Scene {
        WindowGroup {
            LinksView(links: $store.links) {
                Task {
                    do {
                        try await store.save(links: store.links)
                    } catch {
                        err = error
                        isPresentingError = true
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    err = error
                    isPresentingError = true
                }
            }
            .alert(err?.localizedDescription ?? "Some error occurrd.", isPresented: $isPresentingError) {
                Button("OK", role: .cancel) {
                    store.links = []
                    isPresentingError = false
                }
            }
        }
    }
}
