//
//  NewLinkSheet.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct NewLinkSheet: View {
    @Binding var links: [Link]
    @Binding var isPresentingNewLinkSheet: Bool
    @State var link = Link(title: "title", url: URL(string: "https://example.com")!)

    var body: some View {
        NavigationStack {
            LinkEditlView(link: $link)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewLinkSheet = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            isPresentingNewLinkSheet = false
                            links.append(link)
                        }
                    }
                }
        }
    }
}

struct NewLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NewLinkSheet(links: .constant(Link.sampleData), isPresentingNewLinkSheet: .constant(true))
    }
}
