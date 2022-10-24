//
//  ControlImageView.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 21/10/22.
//

import SwiftUI

struct ControlImageView: View {
    let imageName: String

    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(imageName: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
