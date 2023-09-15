//
//  PopoverViewController.swift
//  UIKitMarathon5
//
//  Created by alexeituszowski on 14.09.2023.
//

import UIKit

final class PopoverViewController: UIViewController {
    let closeButton: UIButton = {
        let button = UIButton(type: .close)
        return button
    }()
    
    let segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["280pt", "150pt"])
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(closeButton)
        view.addSubview(segmentControl)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        preferredContentSize = CGSize(width: 300, height: 280)
        
        segmentControl.addTarget(self, action: #selector(segmentDidChange), for: .valueChanged)
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    
    @objc
    func close() {
        dismiss(animated: true)
    }
    
    @objc
    func segmentDidChange() {
        if segmentControl.selectedSegmentIndex == 0 {
            preferredContentSize = CGSize(width: 300, height: 280)
        } else {
            preferredContentSize = CGSize(width: 300, height: 150)
        }
    }
}
