//
//  ViewController.swift
//  BingeBot
//
//  Created by iv on 6/6/19.
//  Copyright © 2019 ivsath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var bingebotSpokenLabel: UILabel!
    @IBOutlet weak var randomShowLabel: UILabel!
    @IBOutlet weak var addShowTextField: UITextField!
    @IBOutlet weak var addShowButton: UIButton!
    
    @IBOutlet weak var showsStackView: UIStackView!
    @IBOutlet weak var randomShowStackView: UIStackView!
    @IBOutlet weak var addShowStackView: UIStackView!
    
    var shows: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsStackView.isHidden = true
        randomShowStackView.isHidden = true
    }
    
    @IBAction func randomShowButtonWasPressed(_ sender: Any) {
        randomShowLabel.text = shows.randomElement()
        randomShowLabel.isHidden = false
        bingebotSpokenLabel.isHidden = false
    }
    
    func updateShowsLabel() {
        showsLabel.text = shows.joined(separator: ", ")
    }

    @IBAction func addShowButtonWasPressed(_ sender: Any) {
        guard let showName = addShowTextField.text, !showName.isEmpty else {
            return
        }
        shows.append(showName)
        updateShowsLabel()
        addShowTextField.text = ""
        showsStackView.isHidden = false
        if shows.count > 1 {
            randomShowStackView.isHidden = false
            bingebotSpokenLabel.isHidden = true
            randomShowLabel.isHidden = true
        }
    }
    
}

