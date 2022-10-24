//
//  PageServiceImpl.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

final class PageServiceImpl: PageService {
    private let dataProvider: PagesLocalDataSource
    private let mapper: PagesMapper

    init(dataProvider: PagesLocalDataSource = PagesLocalDataSourceImpl(), mapper: PagesMapper = PagesMapperImpl()) {
        self.dataProvider = dataProvider
        self.mapper = mapper
    }

    func getPages() -> [Page] {
        mapper.dtoToDomain(dataProvider.getPages())
    }
}
