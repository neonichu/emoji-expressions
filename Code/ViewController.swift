//
//  ViewController.swift
//  EmojiExpressionTester
//
//  Created by Boris Bügling on 06/09/14.
//  Copyright (c) 2014 Boris Bügling. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    var searchBar : UISearchBar!
    var textView : ICTextView!

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.searchBar.becomeFirstResponder()
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = UIRectEdge.None

        self.searchBar = UISearchBar(frame: CGRect(x: 0.0, y: 20.0, width: self.view.frame.size.width, height: 44.0))
        self.searchBar.delegate = self

        self.textView = ICTextView(frame: self.view.bounds)
        self.textView.contentInset = UIEdgeInsets(top: CGRectGetMaxY(self.searchBar.frame), left: 0.0, bottom: 216.0, right: 0.0)
        self.textView.font = UIFont.systemFontOfSize(14.0)
        self.textView.scrollIndicatorInsets = self.textView.contentInset
        self.textView.text = NSString.stringWithContentsOfFile(NSBundle.mainBundle().pathForResource("test", ofType:"txt")!, encoding: NSUTF8StringEncoding, error: nil)

        self.view.addSubview(self.textView)
        self.view.addSubview(self.searchBar)
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if (countElements(searchText) == 0) {
            self.textView.resetSearch()
        }

        self.textView.scrollToMatch(searchText, searchOptions: NSRegularExpressionOptions.CaseInsensitive, animated: true, atScrollPosition: ICTextViewScrollPositionMiddle)
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.textView.becomeFirstResponder()
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.textView.scrollToMatch(searchBar.text, searchOptions: NSRegularExpressionOptions.CaseInsensitive, animated: true, atScrollPosition: ICTextViewScrollPositionMiddle)
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.text = nil
        self.textView.resetSearch()
    }
}
