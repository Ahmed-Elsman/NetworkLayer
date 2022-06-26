//
//  BasePresenterIO.swift
//  Elsman
//
//  Created by Elsman on 8/24/19.
//  Copyright © 2019 Elsman. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import SwiftMessages

public protocol BasePresenterInput: AnyObject {
    func viewDidLoad()
}

public protocol BaseDisplayLogic: AnyObject {
    func showError(error: Error)
    func showError(title: String, sub: String?)
    func showSuceess(title: String, sub: String?)

}

public protocol BasePresenterOutput: BaseDisplayLogic {
    func showLoading()
    func hideLoading()
}

extension BaseDisplayLogic where Self: UIViewController {

    public func showError(title: String, sub: String?) {

        let view = MessageView.viewFromNib(layout: .cardView)

        view.configureTheme(.warning)
        view.button?.isHidden = true
        view.configureContent(title: title, body: sub ?? "", iconText: "")
        SwiftMessages.show(view: view)
    }

    public func showSuceess(title: String, sub: String?) {

        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.success)
        view.button?.isHidden = true
        view.configureContent(title: title, body: sub ?? "")

        var successConfig = SwiftMessages.defaultConfig
        successConfig.presentationStyle = .center
        successConfig.preferredStatusBarStyle = .lightContent
        successConfig.presentationContext = .window(windowLevel: UIWindow.Level.normal)

        SwiftMessages.show(config: successConfig, view: view)
    }

}

extension UIViewController: BasePresenterOutput {
    public func showLoading() {
        startAnimating()
    }

    public func hideLoading() {
        stopAnimating()
    }

}
extension UIViewController: NVActivityIndicatorViewable {

    public func showError(error: Error) {
        showError(title: "error", sub: error.localizedDescription)
    }
}
