//
//  Reachability.swift
//  Elsman
//
//  Created by Elsman on 7/7/19.
//  Copyright © 2019 Elsman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftMessages

public class MainAppReachability {

    public static let shared = MainAppReachability()
    private let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")

    private init() {}

    var isConnected: Bool {
        return reachabilityManager?.isReachable ?? false
    }

    public func startNetworkReachabilityObserver() {
        reachabilityManager?.startListening { [weak self] status in
            switch status {
            case .notReachable:
                print("The network is not reachable")
                self?.showNoInternetConnection(message: "check internet")
                NotificationCenter.default.post(name: Notifications.notConnected.name, object: nil)
            case .unknown :
                print("It is unknown whether the network is reachable")
            case .reachable(.ethernetOrWiFi), .reachable(.cellular):
                print("The network is reachable over the cellular connection")
                NotificationCenter.default.post(name: Notifications.connected.name, object: nil)
                SwiftMessages.hideAll()
            }
        }
    }

    func showNoInternetConnection(message: String) {
            var config = SwiftMessages.Config()
            config.presentationStyle = .top
            config.duration = .forever
            config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
            let view = MessageView.viewFromNib(layout: .statusLine)
            view.id = "Internet"
            view.configureTheme(backgroundColor: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), iconImage: nil, iconText: nil)
            view.button?.isHidden = true
            view.iconImageView?.isHidden = true
            view.iconLabel?.isHidden = true
            view.bodyLabel?.text = message
            SwiftMessages.show(config: config, view: view)
        }
    }


public enum Notifications: String, NotificationName {
    case connected
    case notConnected
}

public protocol NotificationName {
    var name: Notification.Name { get }
}

public extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
        return Notification.Name(rawValue)
    }
}   
