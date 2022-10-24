//
//  PagesConfigurator.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

final class PagesConfigurator {
    static func configPagesView(with viewModel: PagesViewModel = PagesViewModel()) -> PagesView {
        PagesView(viewModel: viewModel)
    }
}
