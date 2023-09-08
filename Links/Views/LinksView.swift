//
//  ContentView.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct LinksView: View {
    @Binding var links: [Link]

    var body: some View {
        NavigationStack {
            List {
                ForEach($links) { $link in
                    NavigationLink(link.title, destination: LinkEditlView(link: $link))
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
        LinksView(links: .constant(Link.sampleData))
    }
}
