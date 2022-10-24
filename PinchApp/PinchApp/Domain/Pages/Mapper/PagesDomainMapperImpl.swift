//
//  PagesDomainMapperImpl.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

final class PagesDomainMapperImpl: PagesDomainMapper {
    func domainToPresentation(_ data: [Page]) -> [UiPage] {
        data.map {
            .init(id: $0.id, imageName: $0.imageName)
        }
    }
}
