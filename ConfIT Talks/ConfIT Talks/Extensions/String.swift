//
//  String.swift
//  ConfIT Talks
//
//  Created by Alberto Guerrero Martin on 1/12/21.
//

import Foundation

extension String {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
    
    var decodingUnicodeCharacters: String { applyingTransform(.init("Hex-Any"), reverse: false) ?? "" }
    
    func uppercasingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func uppercaseFirstLetter() {
        self = self.uppercasingFirstLetter()
    }
}
