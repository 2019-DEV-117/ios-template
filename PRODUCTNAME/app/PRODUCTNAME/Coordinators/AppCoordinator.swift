//
//  AppCoordinator.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 3/24/17.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    private let window: UIWindow
    fileprivate let rootController: UIViewController
    var childCoordinators = [Coordinator]()

    init(window: UIWindow) {
        self.window = window
        let rootController = UIViewController()
        rootController.view.backgroundColor = .white
        self.rootController = rootController
    }

    func start() {
        // Configure window/root view controller
        window.setRootViewController(rootController, animated: false)
        window.makeKeyAndVisible()

        // Spin off auth coordinator
        let authCoordinator = AuthCoordinator(rootController)
        authCoordinator.delegate = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }

    func cleanup() {
    }

}

extension AppCoordinator: AuthCoordinatorDelegate {

    func didSignIn() {
        guard let (index, authCoordinator) = child(ofType: AuthCoordinator.self) else {
            preconditionFailure("On didSignIn, we should have an AuthCoordinator in our list of coordinators.")
        }
        childCoordinators.remove(at: index)
        authCoordinator.cleanup()

        let contentCoordinator = ContentCoordinator(rootController)
        contentCoordinator.start()
        childCoordinators.append(contentCoordinator)
    }

}
