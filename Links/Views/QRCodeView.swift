//
//  QRCodeView.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import SwiftUI

struct QRCodeView: View {
    let string: String

    var body: some View {
        Image(uiImage: generateQRCode(from: string))
            .resizable()
            .interpolation(.none)
            .scaledToFit()
            .frame(width: 300)
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(string: "https://www.apple.com")
    }
}
