//
//  PagesDomainMapper.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

protocol PagesDomainMapper {
    func domainToPresentation(_ data: [Page]) -> [UiPage]
}
