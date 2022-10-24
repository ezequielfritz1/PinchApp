//
//  GetPagesUseCaseImpl.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

final class GetPagesUseCaseImpl: GetPagesUseCase {
    private let service: PageService
    private let mapper: PagesDomainMapper

    init(service: PageService = PageServiceImpl(), mapper: PagesDomainMapper = PagesDomainMapperImpl()) {
        self.service = service
        self.mapper = mapper
    }

    func execute() -> [UiPage] {
        mapper.domainToPresentation(service.getPages())
    }
}
