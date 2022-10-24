//
//  PagesMapper.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

protocol PagesMapper {
    func dtoToDomain(_ data: [PageDTO]) -> [Page]
}
