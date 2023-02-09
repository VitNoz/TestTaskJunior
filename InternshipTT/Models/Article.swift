//
//  Article.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 03.02.2023.
//

struct Article: Decodable {
    let uri: String?
    let url: String?
    let id: Int?
    let asset_id: Int?
    let source: String?
    let published_date: String?
    let updated: String?
    let section: String?
    let subsection: String?
    let nytdsection: String?
    let adx_keywords: String?
    let column: String?
    let byline: String?
    let type: String?
    let title: String?
    let abstract: String?
    let des_facet: Array<String>?
    let org_facet: Array<String>?
    let per_facet: Array<String>?
    let geo_facet: Array<String>?
    let media: [Media]?
    let eta_id: Int?
}

struct Media: Decodable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approved_for_syndication: Int?
    let mediametadata: [MediaMetaData]?

    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case approved_for_syndication
        case mediametadata = "media-metadata"
    }
}

struct MediaMetaData: Decodable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}

struct Response: Decodable {
    let status: String?
    let copyright: String?
    let num_results: Int?
    let results: [Article]?
}
