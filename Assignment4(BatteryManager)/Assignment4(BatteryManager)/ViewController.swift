//
//  ViewController.swift
//  Assignment4(BatteryManager)
//
//  Created by Oluwafemi Adenaike on 7/10/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let batterySlider = UISlider()
  let batteryIncreaseButton = UIButton()
  let batteryDecreaseButton = UIButton()
  let battery = UIImageView()
  
  let arrayOfBatteryImage = [UIImage(named: "0"), UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9")]
  var initSliderValue: Float = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .black
    createBattery()
    createIncBtn()
    createSliderBtn()
    createDecBtn()
    setUpConstraintsForBattery()
  }
  
  func createBattery() {
    battery.image = arrayOfBatteryImage[Int(initSliderValue)]
  }
  
  func createIncBtn() {
    batteryIncreaseButton.backgroundColor = .black
    let incImage = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    batteryIncreaseButton.setImage(incImage, for: .normal)
    batteryIncreaseButton.addTarget(self, action: #selector(incBtnAction), for: .touchUpInside)
  }
  
  @objc func incBtnAction() {
    if batterySlider.value < 9 {
      batterySlider.value += 1
    }
    //batterySlider.setValue(batterySlider.value, animated: true)
    battery.image = arrayOfBatteryImage[Int(batterySlider.value)]
  }
  
  func createSliderBtn() {
    batterySlider.backgroundColor = .blue
    batterySlider.maximumValue = 9
    batterySlider.minimumValue = 0
    batterySlider.addTarget(self, action: #selector(slBtnAction), for:.touchUpInside)
  }
  
  @objc func slBtnAction() {
    battery.image = arrayOfBatteryImage[Int(batterySlider.value)]
  }
  
  func createDecBtn() {
    batteryDecreaseButton.backgroundColor = .black
    let decImage = UIImage(systemName: "minus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    batteryDecreaseButton.setImage(decImage, for: .normal)
    batteryDecreaseButton.addTarget(self, action: #selector(decBtnAction), for: .touchUpInside)
    //battery.image = arrayOfBatteryImage[Int(sliderValue)]
  }
  
  @objc func decBtnAction() {
    if batterySlider.value > 0 {
      batterySlider.value -= 1
    }
    battery.image = arrayOfBatteryImage[Int(batterySlider.value)]
  }
  
  func setUpConstraintsForBattery() {
    
    view.addSubview(batterySlider)
    batterySlider.translatesAutoresizingMaskIntoConstraints = false
    batterySlider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    batterySlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    batterySlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
    batterySlider.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    view.addSubview(battery)
    battery.translatesAutoresizingMaskIntoConstraints = false
    battery.bottomAnchor.constraint(equalTo: batterySlider.topAnchor, constant: -20).isActive = true
    battery.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    battery.widthAnchor.constraint(equalToConstant: 200).isActive = true
    battery.heightAnchor.constraint(equalToConstant: 500).isActive = true
    
    view.addSubview(batteryDecreaseButton)
    batteryDecreaseButton.translatesAutoresizingMaskIntoConstraints = false
    batteryDecreaseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    batteryDecreaseButton.trailingAnchor.constraint(equalTo: batterySlider.leadingAnchor).isActive = true
    batteryDecreaseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    batteryDecreaseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    view.addSubview(batteryIncreaseButton)
    batteryIncreaseButton.translatesAutoresizingMaskIntoConstraints = false
    batteryIncreaseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    batteryIncreaseButton.leadingAnchor.constraint(equalTo: batterySlider.trailingAnchor).isActive = true
    batteryIncreaseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    batteryIncreaseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
}

