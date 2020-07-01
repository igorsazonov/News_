//
//  NewsFeedViewController.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 05.06.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    // MARK: - Variables

    @IBOutlet weak var containerView: UIView!

    @IBOutlet var buttons: [UIButton]!

    private lazy var  topViewController: TopViewController = {
        guard var viewController = UIStoryboard(name: "Top", bundle: Bundle.main).instantiateViewController(withIdentifier: "topVc") as?  TopViewController else {
            return TopViewController()
        }
        return viewController
    }()

    private lazy var  entertainViewController: EntertainViewController = {
        guard var viewController = UIStoryboard(name: "Entertain", bundle: Bundle.main).instantiateViewController(withIdentifier: "entertainVc") as? EntertainViewController else {
            return EntertainViewController()
        }
        return viewController
    }()

    private lazy var  sportsViewController: SportsViewController = {
        guard var viewController = UIStoryboard(name: "Sports", bundle: Bundle.main).instantiateViewController(withIdentifier: "sportsVc") as? SportsViewController else {
            return SportsViewController()
        }
        return viewController
    }()

    private lazy var  generalViewController: GeneralViewController = {
        guard var viewController = UIStoryboard(name: "General", bundle: Bundle.main).instantiateViewController(withIdentifier: "generalVc") as? GeneralViewController else {
            return GeneralViewController()
        }
        return viewController
    }()

    private lazy var  businessViewController: BusinessViewController = {
        guard var viewController = UIStoryboard(name: "Business", bundle: Bundle.main).instantiateViewController(withIdentifier: "businessVc") as? BusinessViewController else {
            return BusinessViewController()
        }
        return viewController
    }()

    private lazy var  techViewController: TechViewController = {
        guard var viewController = UIStoryboard(name: "Tech", bundle: Bundle.main).instantiateViewController(withIdentifier: "techVc") as? TechViewController else {
            return TechViewController()
        }
        return viewController
    }()

    private lazy var  scienceViewController: ScienceViewController = {
        guard var viewController = UIStoryboard(name: "Science", bundle: Bundle.main).instantiateViewController(withIdentifier: "scienceVc") as? ScienceViewController else {
            return ScienceViewController()
        }
        return viewController
    }()

    private lazy var  healthViewController: HealthViewController = {
        guard var viewController = UIStoryboard(name: "Health", bundle: Bundle.main).instantiateViewController(withIdentifier: "healthVc") as? HealthViewController else {
            return HealthViewController()
        }
        return viewController
    }()

    // MARK: - Function

    @objc func clicked(_ selectedButton: UIButton) {
        var viewController: UIViewController?
        var index: Int?

        index = selectedButton.tag
        viewController = getController(forIndex: index!)!

        for button in buttons {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }

        selectedButton.layer.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.6862745098, blue: 0.1333333333, alpha: 1)
        add(asChildViewController: viewController!)
    }

    private func add(asChildViewController viewController: UIViewController?) {
        if viewController != nil {
            addChild(viewController!)
            containerView.addSubview(viewController!.view)
            viewController!.view.frame = containerView.bounds
            viewController!.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            viewController!.didMove(toParent: self)
        } else {
            print("Error: viewController nil")
        }
    }
    private func remove(asChildViewController viewController: UIViewController?) {
        if viewController != nil {
            viewController!.willMove(toParent: nil)
            viewController!.view.removeFromSuperview()
            viewController!.removeFromParent()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if buttons.count > 0 {
            let firstButton: UIButton = buttons[0]
            add(asChildViewController: topViewController)
            for button in buttons {
                button.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.layer.cornerRadius = 17
                button.addTarget(self, action: #selector(clicked(_:)), for: UIControl.Event.touchUpInside)
            }
            firstButton.layer.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.6862745098, blue: 0.1333333333, alpha: 1)
        }
    }
    private func getController(forIndex index: Int) -> UIViewController? {
        var viewController: UIViewController?
        switch index {
        case 0:
            viewController = topViewController
        case 1:
            viewController = entertainViewController
        case 2:
            viewController = sportsViewController
        case 3:
            viewController = generalViewController
        case 4:
            viewController = businessViewController
        case 5:
            viewController = techViewController
        case 6:
            viewController = scienceViewController
        case 7:
            viewController = healthViewController
        default:
            viewController = nil
        }
        return viewController
    }
}
