//
//  ViewRoutable.swift
//  Elsman
//
//  Created by Elsman on 8/24/19.
//  Copyright © 2019 Elsman. All rights reserved.
//

import UIKit

public protocol ViewRoutable: AnyObject {
    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?)
    func push(view: ViewRoutable, animated flag: Bool)
    func pushFromTabbar(view: ViewRoutable, animated flag: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}

public extension ViewRoutable {

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {

    }
    func push(view: ViewRoutable, animated flag: Bool) {

    }
    func pushFromTabbar(view: ViewRoutable, animated flag: Bool) {

    }
    func dismiss(animated flag: Bool, completion: (() -> Void)?) {

    }
}

public extension ViewRoutable where Self: UIViewController {

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        if  let view = view as? UIViewController {
            present(view, animated: flag, completion: completion)
        }
    }

    func push(view: ViewRoutable, animated flag: Bool) {
        if  let view = view as? UIViewController {
            navigationController?.pushViewController(view, animated: true)
        }
    }

    func pushFromTabbar(view: ViewRoutable, animated flag: Bool) {
        if  let view = view as? UIViewController {
            navigationController?.tabBarController?.present(view, animated: true, completion: nil)
        }
    }
}

extension UIViewController: ViewRoutable {

}
