//
//  PagesLocalDataSource.swift
//  PinchApp
//
//  Created by Ezequiel Fritz on 24/10/22.
//

protocol PagesLocalDataSource {
    func getPages() -> [PageDTO]
}
