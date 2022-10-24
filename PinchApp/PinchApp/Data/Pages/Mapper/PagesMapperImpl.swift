//
//  PagesMapperImpl.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

final class PagesMapperImpl: PagesMapper {
    func dtoToDomain(_ data: [PageDTO]) -> [Page] {
        data.map {
            .init(id: $0.id, imageName: $0.imageName)
        }
    }
}
