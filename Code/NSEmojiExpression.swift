//
//  NSEmojiExpression.swift
//  EmojiExpressionTester
//
//  Created by Boris Bügling on 06/09/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

import Foundation

extension NSMutableString {
    func replace(target : String, withString : String) {
        self.replaceOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.allZeros, range: NSRange(location: 0, length: self.length))
    }
}

public extension NSRegularExpression {
    public class func emojiExpressionWithPattern(pattern: String, options: NSRegularExpressionOptions = NSRegularExpressionOptions.allZeros, error: NSErrorPointer = nil) -> NSRegularExpression? {
        var mutablePattern = NSMutableString.stringWithString(pattern)

        mutablePattern.replace("💥", withString: "^")
        mutablePattern.replace("🚏", withString: "$")
        mutablePattern.replace("🍺", withString: "*")
        mutablePattern.replace("🍻", withString: "+")
        mutablePattern.replace("🍷", withString: "?")
        mutablePattern.replace("👽", withString: ".")
        mutablePattern.replace("🙈", withString: "(")
        mutablePattern.replace("💫", withString: "|")
        mutablePattern.replace("🙊", withString: ")")
        mutablePattern.replace("😈", withString: "(?:")
        mutablePattern.replace("👿", withString: ")")
        mutablePattern.replace("🌑", withString: "[")
        mutablePattern.replace("🌕", withString: "]")
        mutablePattern.replace("👎", withString: "^[")
        mutablePattern.replace("👍", withString: "]")

        return self.regularExpressionWithPattern(mutablePattern, options: options, error: error)
    }
}
