//
//  UiPages.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

struct UiPage: Identifiable {
    let id: Int
    let imageName: String
}

extension UiPage {
    var thumbnailName: String {
        "thumb-\(imageName)"
    }
}
