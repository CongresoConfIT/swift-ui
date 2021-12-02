//
//  Media.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Foundation

struct Media: Decodable {
    let id: Int
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case guid
    }
    
    enum GuidCodingKeys: String, CodingKey {
        case rendered
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        
        let guidValues = try values.nestedContainer(keyedBy: GuidCodingKeys.self, forKey: .guid)
        url = try guidValues.decode(String.self, forKey: .rendered).decodingUnicodeCharacters        
    }
}
