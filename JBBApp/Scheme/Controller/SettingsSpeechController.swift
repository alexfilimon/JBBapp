//
//  SettingsSpeechController.swift
//  JBBApp
//
//  Created by Александр Филимонов on 15/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit
import AVKit

class SettingsSpeechController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let speechSettings = UserDefaults.standard
    
    var rate: Float!
    var pitch: Float!
    var volume: Float!
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rate = speechSettings.value(forKey: "rate") as! Float
        pitch = speechSettings.value(forKey: "pitch") as! Float
        volume = speechSettings.value(forKey: "volume") as! Float
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveSettings))
        // navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .done, target: self, action: #selector(dismisSettings))
    }
    
    @objc func saveSettings() {
        UserDefaults.standard.set(rate, forKey: "rate")
        UserDefaults.standard.set(pitch, forKey: "pitch")
        UserDefaults.standard.set(volume, forKey: "volume")
        UserDefaults.standard.synchronize()
        
        delegate?.didSaveSettings()
        
        navigationController?.popViewController(animated: true)
    }
    
//    @objc func dismisSettings() {
//        navigationController?.popViewController(animated: true)
//    }
    
    @objc func handleSliderValueChange(sender: CustomSlider) {
        switch sender.sliderIdentifier {
        case 100:
            rate = sender.value
            
        case 200:
            pitch = sender.value
            
        default:
            volume = sender.value
        }
        tableView.reloadData()
    }

}

extension SettingsSpeechController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if indexPath.row < 3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cellSlider", for: indexPath) as UITableViewCell
            
            let keyLabel = cell.contentView.viewWithTag(10) as? UILabel
            let valueLabel = cell.contentView.viewWithTag(20) as? UILabel
            let slider = cell.contentView.viewWithTag(30) as! CustomSlider
            
            var value: Float = 0.0
            switch indexPath.row {
            case 0:
                value = rate
                
                keyLabel?.text = "Скорость"
                valueLabel?.text = NSString(format: "%.2f", rate) as String
                
                slider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
                slider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
                slider.addTarget(self, action: #selector(handleSliderValueChange), for: .valueChanged)
                
                slider.sliderIdentifier = 100
                
            case 1:
                value = pitch
                
                keyLabel?.text = "Тембр"
                valueLabel?.text = NSString(format: "%.2f", pitch) as String
                
                slider.minimumValue = 0.5
                slider.maximumValue = 2.0
                slider.addTarget(self, action: #selector(handleSliderValueChange), for: .valueChanged)
                
                slider.sliderIdentifier = 200
                
            default:
                value = volume
                
                keyLabel?.text = "Громкость"
                valueLabel?.text = NSString(format: "%.2f", volume) as String
                
                slider.minimumValue = 0.0
                slider.maximumValue = 1.0
                slider.addTarget(self, action: #selector(handleSliderValueChange), for: .valueChanged)
                
                slider.sliderIdentifier = 300
            }
            
            if slider.value != value {
                slider.value = value
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

protocol SettingsViewControllerDelegate {
    func didSaveSettings()
}
