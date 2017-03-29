//
//  ContentCoordinator.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 3/27/17.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

class ContentCoordinator: Coordinator {

    let baseController: UIViewController
    var childCoordinators = [Coordinator]()

    init(_ baseController: UIViewController) {
        self.baseController = baseController
    }

    func start() {
        // TODO - create and use ContentViewController
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        // Wrapped in dispatch block to ensure this happens on the next run loop
        // after the root is configured, to prevent "Unbalanced calls to begin/
        // "end appearance transitions" warning. Necessary for any controllers
        // presented directly off of the root controller.
        DispatchQueue.main.async {
            self.baseController.present(vc, animated: false, completion: nil)
        }
    }

    func cleanup() {
        baseController.dismiss(animated: false, completion: nil)
    }

}
