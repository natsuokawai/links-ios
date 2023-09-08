//
//  LinksApp.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

@main
struct LinksApp: App {
    @State private var links = Link.sampleData

    var body: some Scene {
        WindowGroup {
            LinksView(links: $links)
        }
    }
}
