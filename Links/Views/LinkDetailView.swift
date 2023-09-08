//
//  LinkDetailView.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct LinkDetailView: View {
    let link: Link
    @Environment(\.openURL) private var openURL

    var body: some View {
        VStack(alignment: .center) {
            List {
                Section(header: Text("Title")) {
                    Text(link.title)
                }
                Section(header: Text("URL")) {
                    Button(link.url.absoluteString) {
                        openURL(link.url)
                    }
                }
                Section(header: Text("QR Code")) {
                    HStack {
                        Spacer()
                        QRCodeView(string: link.url.absoluteString)
                        Spacer()
                    }
                    .padding([.top, .bottom])
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct LinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LinkDetailView(link: Link.sampleData[0])
        }
    }
}
