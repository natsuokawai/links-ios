//
//  ContentView.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct LinksView: View {
    var links: [Link]

    var body: some View {
        NavigationStack {
            List {
                ForEach(links) { link in
                    NavigationLink(link.title, destination: Text(link.title))
                }
            }
            .navigationTitle("Links")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView(links: Link.sampleData)
    }
}
