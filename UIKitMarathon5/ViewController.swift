//
//  ViewController.swift
//  UIKitMarathon5
//
//  Created by alexeituszowski on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        button.sizeToFit()
        
        button.addTarget(self, action: #selector(presentPopover), for: .touchUpInside)
    }

    
    @objc func presentPopover(_ sender: UIButton){
        let vc = PopoverViewController()
        vc.modalPresentationStyle = .popover
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = sender.bounds
        vc.popoverPresentationController?.permittedArrowDirections = .up
        vc.popoverPresentationController?.delegate = self
        present(vc, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    // 1
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    // 2
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
}
