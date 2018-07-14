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

class SchemeControllerNew: UIViewController, UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return drawRectangle
    }
    
    // MARK: - Views
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var cellsInfoTableView: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var drawRectangle: DrawRectangle! = {
        var VC = DrawRectangle(frame: CGRect.zero)
        VC.scheme = scheme
        return VC
    }()
    
    @IBAction func changeColor(_ sender: UIButton) {
        makeStep()
        
    }
    
    func makeStep() {
        guard let scheme = scheme else { return }
        for item in scheme.groupedCells[scheme.curGroup] {
            item.isRead = true
        }
        cellsInfoTableView.scrollToRow(at: IndexPath(row: scheme.curGroup, section: 0), at: .middle, animated: true)
        let curFirstCell = scheme.groupedCells[scheme.curGroup][0]
        scrollView.setContentOffset(CGPoint(x: 0, y: drawRectangle.cellHeight * scrollView.zoomScale * CGFloat(scheme.getCellRow(by: curFirstCell.id)!) - drawRectangle.cellHeight * scrollView.zoomScale), animated: true)
        
        cellsInfoTableView.reloadData()
        drawRectangle.setNeedsDisplay()
        
        progress = Float(scheme.cellsReady) / Float(scheme.cells.count)
        progressBar.progress = progress
        progressLabel.text = String(Int(roundf(progress * 100))) + " %"
        
        scheme.curGroup = (scheme.curGroup + 1) % (scheme.groupedCells.count)
    }
    
    // MARK: - Vars
    
    var scheme: SchemeNew?
    var progress: Float = 0
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellsInfoTableView.delegate = self
        cellsInfoTableView.dataSource = self
        cellsInfoTableView.rowHeight = 24.0
        
        scrollView.addSubview(drawRectangle)
        
        speechSynthesizer.delegate = self
        
        cellsInfoTableView.register(UINib(nibName: "InfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "InfoIDCell")
        
        scrollView.delegate = self
        
//        stopButton.layer.cornerRadius = 1.0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scheme?.delegate = self
        
        drawRectangle.setNeedsDisplay()
        let size = CGSize(width: drawRectangle.cellWidth * CGFloat(drawRectangle.colsCount), height: drawRectangle.cellHeight * CGFloat(drawRectangle.rowsCount))
        print("size: \(size)")
        scrollView.contentSize = size
        drawRectangle.frame = CGRect(origin: .zero, size: size)
        
        setupScrollViewZoom()
    }
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let speechSynthesizer = AVSpeechSynthesizer()
    
    @IBAction func play(_ sender: UIButton) {
        guard let scheme = scheme else { return }
        
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .word)
            playPauseButton(isPlayImage: true)
        } else {
            playPauseButton(isPlayImage: false)
            for row in scheme.groupedCells[scheme.curGroup...] {
                let str: String = row[0].color.defaultName! + " " + String(row.count)
                let speechUtterance = AVSpeechUtterance(string: str)
                
                speechUtterance.rate = 0.25
                speechUtterance.pitchMultiplier = 0.25
                speechUtterance.volume = 0.75
                speechUtterance.postUtteranceDelay = 0.005
                
                progress = 0
                //                cellsReady = 0
                
                speechSynthesizer.speak(speechUtterance)
            }
        }
        
//        if speechSynthesizer.isPaused {
//            playPauseButton(isPlayImage: true)
//            speechSynthesizer.continueSpeaking()
//        } else {
//
//
//        }
        
    }
    @IBAction func pause(_ sender: UIButton) {
        
        speechSynthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
        
    }
    @IBAction func stop(_ sender: UIButton) {
        
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.word)
        
    }
    
    func setupScrollViewZoom() {
        let scrollViewFrame = scrollView.frame
        print("frame: \(scrollViewFrame), contentSize: \(scrollView.contentSize)")
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        print("min scale: \(minScale)")
        scrollView.minimumZoomScale = minScale
//        scrollView.minimumZoomScale = 0.2

        scrollView.maximumZoomScale = 1.0
//        scrollView.zoomScale = 0.2
//        scrollView.zoomScale = minScale
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        drawRectangle.center.x = scrollView.frame.width / 2
    }
    
    func playPauseButton(isPlayImage: Bool) {
        if isPlayImage {
            playPauseButton.setImage(#imageLiteral(resourceName: "Play"), for: .normal)
        } else {
            playPauseButton.setImage(#imageLiteral(resourceName: "Pause"), for: .normal)
        }
    }
    
}

extension SchemeControllerNew: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("did finish speech: \(utterance.speechString)")
        makeStep()
    }
    
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
//        print("didStartSpeech: \(utterance.speechString)")
//
//    }
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
//        print("speak \(characterRange), \(utterance)")
//        // {location: _, length: _}
//    }
}

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
            cell.colorView.backgroundColor =  scheme.groupedCells[indexPath.row][0].color.colorValue
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

extension SchemeControllerNew: SchemeNewDelegate{
    func didProgressChanged() {
        guard let scheme = scheme else { return }
        
        cellsInfoTableView.scrollToRow(at: IndexPath(row: scheme.curGroup, section: 0), at: .middle, animated: true)
        let curFirstCell = scheme.groupedCells[scheme.curGroup][0]
        scrollView.setContentOffset(CGPoint(x: 0, y: drawRectangle.cellHeight * scrollView.zoomScale * CGFloat(scheme.getCellRow(by: curFirstCell.id)!) - drawRectangle.cellHeight * scrollView.zoomScale), animated: true)
        
        cellsInfoTableView.reloadData()
        drawRectangle.setNeedsDisplay()
        
        progress = Float(scheme.cellsReady) / Float(scheme.cells.count)
        progressBar.progress = progress
        progressLabel.text = String(Int(roundf(progress * 100))) + " %"
        
    }
}
