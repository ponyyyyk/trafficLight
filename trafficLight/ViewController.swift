//
//  ViewController.swift
//  trafficLight
//
//  Created by Василий Шумаков on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var switchLightButton: UIButton!
    
    private let lightIsOff = 0.3
    private let lightIsOn = 1.0
    private var currentColor = CurrentColor.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        switchLightButton.layer.cornerRadius = 20
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    
    @IBAction func switchLightButtonDidTapped() {
        if switchLightButton.currentTitle == "START" {
            switchLightButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentColor {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentColor = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentColor = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentColor = .red
        }
    }
    
}

extension ViewController {
    private enum CurrentColor {
        case red, yellow, green
    }
}

