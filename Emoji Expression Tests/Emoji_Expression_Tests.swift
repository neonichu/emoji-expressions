//
//  Emoji_Expression_Tests.swift
//  Emoji Expression Tests
//
//  Created by Boris Bügling on 06/09/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

import EmojiExpressionTester
import XCTest

extension NSRegularExpression {
    func firstMatch(string : String) -> NSTextCheckingResult? {
        return self.firstMatchInString(string, options: NSMatchingOptions.allZeros, range: NSRange(location: 0, length: countElements(string)))
    }

    func firstMatchString(string : String) -> String? {
        var firstMatch = self.firstMatch(string)!
        return (string as NSString).substringWithRange(firstMatch.range)
    }
}

class Emoji_Expression_Tests: XCTestCase {
    
    func testZeroOrMore() {
        var regex = NSRegularExpression.emojiExpressionWithPattern("abcx🍺", options: NSRegularExpressionOptions.allZeros, error: nil)!
        XCTAssertEqual(regex.firstMatchString("abc")!, "abc", "")
    }
    
}
