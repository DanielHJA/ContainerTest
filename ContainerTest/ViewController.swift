//
//  ViewController.swift
//  ContainerTest
//
//  Created by Daniel Hjärtström on 2018-06-24.
//  Copyright © 2018 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var currentViewControllerIndex: Int = 0
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: "Switch", style: .plain, target: self, action: #selector(switchController))
    }()
    
    private var viewControllers: [UIViewController] {
        return [FirstViewController(), SecondViewController()]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Title"
        navigationItem.rightBarButtonItem = rightBarButtonItem
        switchController()
    }
    
    @objc private func switchController() {
        let childController = viewControllers[currentViewControllerIndex]
        addChildViewController(childController)
        view.addSubview(childController.view)
        childController.view.frame = view.bounds
        childController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childController.didMove(toParentViewController: self)
        currentViewControllerIndex = currentViewControllerIndex == 0 ? 1 : 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

