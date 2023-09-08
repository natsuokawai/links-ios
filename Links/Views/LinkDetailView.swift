//
//  LinkDetailView.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct LinkDetailView: View {
    @Binding var link: Link

    var body: some View {
        List {
            Section(header: Text("Title")) {
                TextField("Title", text: $link.title)
            }
            Section(header: Text("URL")) {
                TextField("URL", text: $link.urlString)
            }
            Section(header: Text("QR Code")) {
                HStack {
                    Spacer()
                    QRCodeView(string: link.urlString)
                    Spacer()
                }
                .padding([.top, .bottom])
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct LinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LinkDetailView(link: .constant(Link.sampleData[0]))
        }
    }
}
