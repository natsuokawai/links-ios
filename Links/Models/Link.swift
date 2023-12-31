//
//  Link.swift
//  Links
//
//  Created by natsuo kawai on 2023/09/08.
//

import Foundation

struct Link: Identifiable, Codable {
    let id: UUID
    var title: String
    var url: URL
    
    var urlString: String {
        get {
            url.absoluteString
        }
        set {
            if let newURL = URL(string: newValue) {
                url = newURL
            }
        }
    }
    
    init(id: UUID = UUID(), title: String, url: URL) {
        self.id = id
        self.title = title
        self.url = url
    }
}

extension Link {
    static var sampleData: [Link] {
        let links = [
            ("Human Interface Guidelines", "https://developer.apple.com/design/human-interface-guidelines"),
            ("Swift Programming Language", "https://github.com/apple/swift")
        ]
        return links.compactMap { (title, urlString) in
            if let url = URL(string: urlString) {
                return Link(title: title, url: url)
            }
            return nil
        }
    }
}
