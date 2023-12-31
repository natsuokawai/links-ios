//
//  ContentView.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct LinksView: View {
    @Binding var links: [Link]
    @State var isPresentingNewLinkSheet = false
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void

    var body: some View {
        NavigationStack {
            List {
                ForEach($links) { $link in
                    NavigationLink(link.title, destination: LinkEditlView(link: $link))
                }
            }
            .navigationTitle("Links")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        isPresentingNewLinkSheet = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                        Text("New Link")
                    }
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $isPresentingNewLinkSheet) {
            NewLinkSheet(links: $links, isPresentingNewLinkSheet: $isPresentingNewLinkSheet)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView(links: .constant(Link.sampleData)) {}
    }
}
