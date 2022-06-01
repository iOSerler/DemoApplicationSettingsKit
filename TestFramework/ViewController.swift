//
//  ViewController.swift
//  TestFramework
//
//  Created by Yerzhan Gapurinov on 28.05.2022.
//

import UIKit
import SettingsKit
import DonationKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .default)
        let largeBoldDoc = UIImage(systemName: "gear", withConfiguration: config)
        let button = UIButton()
        button.setTitle(" Settings", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.setImage(largeBoldDoc, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    let label: UILabel = {
        let attributedText = NSMutableAttributedString(string: "Developed by iOSerler\n",
                                                       attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)])
        attributedText.append(NSAttributedString(string:
                                                """
                                                \nAskarbekuly Nursultan
                                                Bekzhan Talgat
                                                Gapurinov Yerzhan
                                                Kamil Khairullin
                                                """,
                                                attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                                                             NSAttributedString.Key.baselineOffset: 5]))
        
        
        let label = UILabel()
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(label)
        
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 250),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(){
        let settingsB = SettingsBuilder(analytics: nil, settingsSections: nil, notificationControlPanel: nil, notificationLocalSchedule: nil, settingsStyleConfigurable: nil)
        
        settingsB.settingsView.settingsViewDelegate = self
        
        self.navigationController?.pushViewController(settingsB.settingsView as UIViewController, animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension ViewController: SettingsViewDelegate {
    func openDonateProposition() {
        //create purchaseBuilder
        let purchaseBuilder = PurchaseBuilder(
            analytics: nil,
            purchaseProductIdentifiers: [
                "com.TestFramework.myPrice099",
                "com.TestFramework.myPrice299",
                "com.TestFramework.myPrice999"
            ],
            config: nil
        )
        //push to the navigationController
        self.navigationController?.pushViewController(purchaseBuilder.view as! UIViewController, animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
}

