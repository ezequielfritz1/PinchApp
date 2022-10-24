//
//  PagesLocalDataSourceImpl.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

final class PagesLocalDataSourceImpl: PagesLocalDataSource {
    func getPages() -> [PageDTO] {
        [
            .init(id: 0, imageName: "magazine-front-cover"),
            .init(id: 1, imageName: "magazine-back-cover")
        ]
    }
}
