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
    
    //var categoryNews: String = ""

    private lazy var topViewController: TopViewController = {
        if let viewController = UIStoryboard(name: "Top", bundle: Bundle.main).instantiateViewController(withIdentifier: "topVc") as? TopViewController {
            return viewController
        }
        return TopViewController()
    }()

    private lazy var entertainViewController: EntertainViewController = {
        if let viewController = UIStoryboard(name: "Entertain", bundle: Bundle.main).instantiateViewController(withIdentifier: "entertainVc") as? EntertainViewController {
            return viewController
        }
        return EntertainViewController()
    }()

    private lazy var sportsViewController: SportsViewController = {
        if let viewController = UIStoryboard(name: "Sports", bundle: Bundle.main).instantiateViewController(withIdentifier: "sportsVc") as? SportsViewController {
            return viewController
        }
        return SportsViewController()
    }()

    private lazy var generalViewController: GeneralViewController = {
        if let viewController = UIStoryboard(name: "General", bundle: Bundle.main).instantiateViewController(withIdentifier: "generalVc") as? GeneralViewController {
            return viewController
        }
        return GeneralViewController()
    }()

    private lazy var businessViewController: BusinessViewController = {
        if let viewController = UIStoryboard(name: "Business", bundle: Bundle.main).instantiateViewController(withIdentifier: "businessVc") as? BusinessViewController {
            return viewController
        }
        return BusinessViewController()
    }()

    private lazy var techViewController: TechViewController = {
        if let viewController = UIStoryboard(name: "Tech", bundle: Bundle.main).instantiateViewController(withIdentifier: "techVc") as? TechViewController {
            return viewController
        }
        return TechViewController()
    }()

    private lazy var scienceViewController: ScienceViewController = {
        if let viewController = UIStoryboard(name: "Science", bundle: Bundle.main).instantiateViewController(withIdentifier: "scienceVc") as? ScienceViewController {
            return viewController
        }
        return ScienceViewController()
    }()

    private lazy var healthViewController: HealthViewController = {
        if let viewController = UIStoryboard(name: "Health", bundle: Bundle.main).instantiateViewController(withIdentifier: "healthVc") as? HealthViewController {
            return viewController
        }
        return HealthViewController()
    }()

    // MARK: - Function

    @objc func clicked(_ selectedButton: UIButton) {
        let indexButton = selectedButton.tag
        /*
        switch indexButton {
        case 0:
            categoryNews = ""
        case 1:
            categoryNews = "entertainment"
        case 2:
            categoryNews = "sports"
        case 3:
            categoryNews = "general"
        case 4:
            categoryNews = "business"
        case 5:
            categoryNews = "technology"
        case 6:
            categoryNews = "science"
        case 7:
            categoryNews = "health"
        default:
             return
        }*/
        
        let viewController = getController(forIndex: indexButton)

        for button in buttons {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }

        selectedButton.layer.backgroundColor = #colorLiteral(red: 0.368627451, green: 0.3607843137, blue: 0.9019607843, alpha: 1)
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
            firstButton.layer.backgroundColor = #colorLiteral(red: 0.368627451, green: 0.3607843137, blue: 0.9019607843, alpha: 1)
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
