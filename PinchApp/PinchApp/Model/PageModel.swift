//
//  PageModel.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-\(imageName)"
    }
}
