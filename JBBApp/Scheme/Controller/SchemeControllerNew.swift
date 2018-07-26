//
//  SchemeControllerNew.swift
//  JBBApp
//
//  Created by Александр Филимонов on 11/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class SchemeControllerNew: UIViewController {
    
    // MARK: - Properties
    
    var scheme: SchemeNew?
    let speechSynthesizer = AVSpeechSynthesizer()
    lazy var drawRectangle: DrawRectangle! = {
        var VC = DrawRectangle(frame: CGRect.zero)
        VC.scheme = scheme
        return VC
    }()
    private var canZoom = true
    private var minScale: CGFloat = 1.0
    var rate: Float!
    var pitch: Float!
    var volume: Float!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var cellsInfoTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // MARK: - IBActions
    
    @IBAction func reverseScheme(_ sender: UIButton) {
        guard !speechSynthesizer.isSpeaking else { return }
        
        let alert = UIAlertController(title: "Вы точно хотите перевернуть схему?", message: "Если вы сделаете это, то вы потеряете весь прогресс", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action) in
            self.scheme?.reverse()
            
            self.reloadTableAndDraw()
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        guard let scheme = scheme else { return }
        
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .word)
            playPauseButton(isPlayImage: true)
            canZoom = true
        } else {
            playPauseButton(isPlayImage: false)
            
            scrollView.setZoomScale(1.0, animated: true)
            canZoom = false
            
            for row in scheme.groupedCells[scheme.curGroup...] {
                let str: String = row[0].color.defaultName! + " " + String(row.count)
                let speechUtterance = AVSpeechUtterance(string: str)
                
                speechUtterance.rate = rate
                speechUtterance.pitchMultiplier = pitch
                speechUtterance.volume = volume
                speechUtterance.postUtteranceDelay = 0.005
                speechUtterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
                
                speechSynthesizer.speak(speechUtterance)
            }
        }
        
    }
    
    // MARK: - BaseClass
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellsInfoTableView.delegate = self
        cellsInfoTableView.dataSource = self
        cellsInfoTableView.rowHeight = 24.0
        
        scrollView.addSubview(drawRectangle)
        
        speechSynthesizer.delegate = self
        
        cellsInfoTableView.register(UINib(nibName: "InfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "InfoIDCell")
        
        navigationController?.hidesBarsOnSwipe = true
        
        scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scheme?.delegate = self
        
        drawRectangle.setNeedsDisplay()
        
        let size = CGSize(width: drawRectangle.cellWidth * CGFloat(drawRectangle.colsCount), height: drawRectangle.cellHeight * CGFloat(drawRectangle.rowsCount))
        scrollView.contentSize = size
        drawRectangle.frame = CGRect(origin: .zero, size: size)
        
        setupScrollViewZoom()
        
        if !loadSettings() {
            registerDefaultSettings()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idSegueSettings" {
            let newVC = segue.destination as! SettingsSpeechController
            newVC.delegate = self
        }
    }
    
    // MARK: - Internal methods
    
    func reloadTableAndDraw() {
        cellsInfoTableView.reloadData()
        drawRectangle.setNeedsDisplay()
//        guard let scheme = scheme else { return }
//        let curFirstCell = scheme.groupedCells[scheme.curGroup-1][0]
//        let curSizeGroup = scheme.groupedCells[scheme.curGroup-1].count
//        let curLastCell = scheme.groupedCells[scheme.curGroup-1][curSizeGroup - 1]
//
//        let numOfFirstRow = scheme.getNumOfRow(cellId: curFirstCell.id)
//        let numOfLastRow = scheme.getNumOfRow(cellId: curLastCell.id)
//
//        guard let numOfFirstRow1 = numOfFirstRow, let numOfLastRow1 = numOfLastRow else { return }
//
//        let y = CGFloat(numOfFirstRow1) * drawRectangle.cellHeight * scrollView.zoomScale
//        let height = CGFloat(numOfLastRow1 + 1) * drawRectangle.cellHeight * scrollView.zoomScale - y
//        drawRectangle.setNeedsDisplay(CGRect(x: 0, y: y, width: drawRectangle.frame.width, height: height))
//
//        print("CGRECT: \(CGRect(x: 0, y: y, width: drawRectangle.frame.width, height: height))")
    }
    
    func playPauseButton(isPlayImage: Bool) {
        if isPlayImage {
            playPauseButton.setImage(#imageLiteral(resourceName: "Play"), for: .normal)
        } else {
            playPauseButton.setImage(#imageLiteral(resourceName: "Pause"), for: .normal)
        }
    }
    
    func scrollViewsToTop() {
        cellsInfoTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .middle, animated: true)
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func scrollViewsToCurrentGroup() {
        guard let scheme = scheme else { return }
        
        cellsInfoTableView.scrollToRow(at: IndexPath(row: scheme.curGroup-1, section: 0), at: .middle, animated: true)
        let curFirstCell = scheme.groupedCells[scheme.curGroup-1][0]
        scrollView.setContentOffset(CGPoint(x: 0, y: drawRectangle.cellHeight * scrollView.zoomScale * CGFloat(scheme.getNumOfRow(cellId: curFirstCell.id)!) - drawRectangle.cellHeight * scrollView.zoomScale), animated: true)
    }
    
    func registerDefaultSettings() {
        rate = AVSpeechUtteranceDefaultSpeechRate
        pitch = 1.0
        volume = 1.0
        
        let defaultSpeechSettings: Dictionary<String, Any> = ["rate": rate, "pitch": pitch, "volume": volume]
        
        UserDefaults.standard.register(defaults: defaultSpeechSettings)
    }
    
    func loadSettings() -> Bool {
        let userDefaults = UserDefaults.standard as UserDefaults
        
        if let theRate: Float = userDefaults.value(forKey: "rate") as? Float {
            rate = theRate
            pitch = userDefaults.value(forKey: "pitch") as! Float
            volume = userDefaults.value(forKey: "volume") as! Float
            
            return true
        }
        return false
    }
    
}

// MARK: - Private methods

private extension SchemeControllerNew {
    
    func setupScrollViewZoom() {
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        minScale = min(scaleWidth, scaleHeight)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1.0
    }
    
}

// MARK: - UIScrollViewDelegate

extension SchemeControllerNew: UIScrollViewDelegate {
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        if canZoom {
            scrollView.minimumZoomScale = minScale
        } else {
            scrollView.minimumZoomScale = 1.0
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        drawRectangle.center.x = scrollView.frame.width / 2
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return drawRectangle
    }
    
}

// MARK: - AVSpeechSynthesizerDelegate

extension SchemeControllerNew: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        guard let scheme = scheme else { return }
        scheme.readNext()
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SchemeControllerNew: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let scheme = scheme {
            return scheme.groupedCells.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoIDCell", for: indexPath) as! InfoTableViewCell
        if let scheme = scheme {
            cell.label.text = String(scheme.groupedCells[indexPath.row].count)
            cell.color = scheme.groupedCells[indexPath.row][0].color.colorValue
            cell.isRead = scheme.groupedCells[indexPath.row][0].isRead
            cell.colorView.layer.backgroundColor = scheme.groupedCells[indexPath.row][0].color.colorValue.cgColor
//            cell.colorView.backgroundColor =  scheme.groupedCells[indexPath.row][0].color.colorValue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 23
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !speechSynthesizer.isSpeaking {
            scheme?.changeProgress(indexOfGroupedCells: indexPath.row)
        } else {
            print("Во время диктовки нельзя изменять прогресс")
        }
    }
    
}

// MARK: - SchemeNewDelegate

extension SchemeControllerNew: SchemeNewDelegate{
    
    func scheme(didProgressChangedTo newProgress: Float) {
        
        self.scrollViewsToCurrentGroup()
        reloadTableAndDraw()
        
        progressBar.progress = newProgress
        progressLabel.text = String(Int(roundf(newProgress * 100))) + " %"
    }
    
    func schemeReversed() {
        progressBar.progress = 0.0
        progressLabel.text = "0 %"
        
        scrollViewsToTop()
    }
    
    func schemeFinished() {
        print("схема закончилась")
    }
    
}

// MARK: - SettingsViewControllerDelegate

extension SchemeControllerNew: SettingsViewControllerDelegate {
    
    func didSaveSettings() {
        print("settings saved")
        let settings = UserDefaults.standard
        
        rate = settings.value(forKey: "rate") as! Float
        pitch = settings.value(forKey: "pitch") as! Float
        volume = settings.value(forKey: "volume") as! Float
        
        speechSynthesizer.stopSpeaking(at: .word)
        playPauseButton(isPlayImage: true)
        canZoom = true
    }
    
}
