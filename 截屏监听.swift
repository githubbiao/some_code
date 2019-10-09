//
//  ViewController.swift
//  截屏监听
//
//  Created by apple on 2019/9/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

protocol BuriedPointProtocol {
    func setupBuriedPoint(name: String?, type: String?, desc: String?, contentId: String?, otherInfo: [String: Any]?)
    func unpackBuriedPointParams() -> [String: Any]
}

class ViewController: UIViewController, BuriedPointProtocol {
    
    private let nameKey = "name"
    private let typeKey = "type"
    private let descKey = "desc"
    private let contentIdKey = "contentId"
    private let otherInfoKey = "otherInfo"
    
    var name: String?
    var type: String?
    var desc: String?
    var contentId: String?
    var otherInfo: [String: Any]?
    
    func setupBuriedPoint(name: String? = nil,
                          type: String? = nil,
                          desc: String? = nil,
                          contentId: String? = nil,
                          otherInfo: [String: Any]? = nil) {
        self.name = name
        self.type = type
        self.desc = desc
        self.contentId = contentId
        self.otherInfo = otherInfo
    }
    
    func unpackBuriedPointParams() -> [String: Any] {
        var params = [String: Any]()
        params[nameKey] = name
        params[typeKey] = type
        params[descKey] = desc
        params[contentIdKey] = contentId
        params[otherInfoKey] = otherInfo
        return params
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: nil) {[weak self] (noti) in
            let params = self?.unpackBuriedPointParams()
            print("\(String(describing: params))")
        }
    }


}

