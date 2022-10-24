//
//  PagesViewModel.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

import Foundation

final class PagesViewModel: ObservableObject {
    private let getPagesUseCase: GetPagesUseCase

    @Published var pages: [UiPage] = []

    init(getPagesUseCase: GetPagesUseCase = GetPagesUseCaseImpl()) {
        self.getPagesUseCase = getPagesUseCase
    }

    func onAppear() {
        pages = getPagesUseCase.execute()
    }
}
