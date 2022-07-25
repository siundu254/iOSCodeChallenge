//
//  NasaAPIModel.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 25/07/2022.
//

import Foundation

struct NasaAPIModel: Codable {
    let collection: NasaCollection
}

struct NasaCollection: Codable {
    let version: String
    let href: String
    let items: [NasaCollectionItems]
    let links: [NasaCollectionLinks]
    
}

struct NasaCollectionMetadata: Codable {
    let total_hits: String
}

struct NasaCollectionLinks: Codable {
    let rel: String
    let prompt: String
    let href: String
}

struct NasaCollectionItems: Codable {
    let href: String
    let links: [NasaCollectionItemLink]
    let data: [NasaCollectionItemData]
}

struct NasaCollectionItemData: Codable {
    let photographer: String?
    let center: String
    let title: String
    let nasa_id: String
    let media_type: String
    let date_created: String
    let description: String
}

struct NasaCollectionItemLink: Codable {
    let href: String
    let rel: String
    let render: String?
}
