//
//  ViewController.swift
//  KefBytes_CustomSegmentedControl
//
//  Created by Kent Franks on 8/15/18.
//  Copyright © 2018 Kent Franks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iBSegmentedControl: UISegmentedControl!
    // ❕use this is you want to create one programmatically
//    let segmentedControl = UISegmentedControl()
    let buttonBar = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildSegmentedControl()
    }
    
    func buildSegmentedControl() {
        // create segments
        iBSegmentedControl.removeAllSegments()
        iBSegmentedControl.insertSegment(withTitle: "Client", at: 0, animated: true)
        iBSegmentedControl.insertSegment(withTitle: "Prospect", at: 1, animated: true)
        iBSegmentedControl.insertSegment(withTitle: "Local", at: 2, animated: true)
        iBSegmentedControl.selectedSegmentIndex = 0

        // set colors
        iBSegmentedControl.backgroundColor = .clear
        iBSegmentedControl.tintColor = .clear
        buttonBar.backgroundColor = UIColor.darkGray

        // set titles
        iBSegmentedControl.setTitleTextAttributes([NSAttributedStringKey.font : UIFont(name: "Helvetica", size: 18) as Any, NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .normal)
        iBSegmentedControl.setTitleTextAttributes([NSAttributedStringKey.font : UIFont(name: "Helvetica", size: 18) as Any, NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .selected)
        iBSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        // add as subviews
        // ❕use this is you want to create one programmatically
//        self.view.addSubview(segmentedControl)
        self.view.addSubview(buttonBar)
        
        // Constraints
        iBSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.translatesAutoresizingMaskIntoConstraints = false

        iBSegmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor)
        iBSegmentedControl.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        iBSegmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        buttonBar.topAnchor.constraint(equalTo: iBSegmentedControl.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: iBSegmentedControl.leftAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: iBSegmentedControl.widthAnchor, multiplier: 1 / CGFloat(iBSegmentedControl.numberOfSegments)).isActive = true
        
        // Constraints for self.view
        // ❕use this is you want to create one programmatically
//        let xCenterConstraint = NSLayoutConstraint(item: iBSegmentedControl, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
//        let yCenterConstraint = NSLayoutConstraint(item: iBSegmentedControl, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
//        let leadingConstraint1 = NSLayoutConstraint(item: iBSegmentedControl, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
//        let trailingConstraint1 = NSLayoutConstraint(item: iBSegmentedControl, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
//        self.view.addConstraints([xCenterConstraint, yCenterConstraint, leadingConstraint1, trailingConstraint1])
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.iBSegmentedControl.frame.width / CGFloat(self.iBSegmentedControl.numberOfSegments)) * CGFloat(self.iBSegmentedControl.selectedSegmentIndex)
        }
    }

}

