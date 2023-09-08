//
//  ContentView.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct LinksView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}