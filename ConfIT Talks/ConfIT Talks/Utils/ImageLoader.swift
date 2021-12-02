//
//  ImageLoader.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Foundation
import Combine

class ImageLoader {
    static func loadImage(url urlString: String) -> AnyPublisher<Data?, Never> {
        guard let url = URL(string: urlString) else {
            return Just(nil).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data? in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    return nil
                }
                return element.data
            }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
