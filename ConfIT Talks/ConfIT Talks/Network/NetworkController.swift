//
//  NetworkController.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Foundation
import Combine

enum NetworkError: Error {
    case networkError
    case mediaNotFound
}


class NetworkController {
    private let baseUrl = "https://confit.es/wp-json/wp/v2"
    private let baseImageUrl = "https://confit.es/wp-json/wp/v2/media"
    
    func getSessions() -> AnyPublisher<[Session], Never> {
        guard let sessionsUrl = URL(string: "\(baseUrl)/sessions") else {
            return Just([]).eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .custom { decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            if let date = DateFormatter.wordpressACFDayFormatter.date(from: dateStr) {
                return date
            } else if let date = DateFormatter.wordpressACFHourFormatter.date(from: dateStr) {
                return date
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
            }
        }
        
        var request = URLRequest(url: sessionsUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [Session].self, decoder: decoder)
            .replaceError(with: [])
//            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func getPosts() -> AnyPublisher<[Post], Never> {
        guard let sessionsUrl = URL(string: "\(baseUrl)/posts") else {
            return Just([]).eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .custom { decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            if let date = DateFormatter.wordpressACFDayFormatter.date(from: dateStr) {
                return date
            } else if let date = DateFormatter.wordpressACFHourFormatter.date(from: dateStr) {
                return date
            } else if let date = DateFormatter.wordpressPostDateFormatter.date(from: dateStr) {
                return date
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
            }
        }
        
        var request = URLRequest(url: sessionsUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [Post].self, decoder: decoder)
            .replaceError(with: [])
//            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }

    func getImageURL(imageId: Int) -> AnyPublisher<Data?, Never> {
        guard let imageUrl = URL(string: "\(baseImageUrl)/\(imageId)") else {
            return Just(nil).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: imageUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: Media?.self, decoder: JSONDecoder())
            .replaceError(with: nil)
            .flatMap { media -> AnyPublisher<Data?, Never> in
                guard let media = media else {
                    return Just(nil).eraseToAnyPublisher()
                }
                
                return ImageLoader.loadImage(url: media.url)
            }
            .eraseToAnyPublisher()
    }
}
