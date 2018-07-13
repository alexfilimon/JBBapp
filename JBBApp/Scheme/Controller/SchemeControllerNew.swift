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
    
    // MARK: - Views
    
    @IBOutlet weak var cellsInfoTableView: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var drawRectangle: DrawRectangle! = {
        var VC = DrawRectangle(frame: CGRect.zero)
        VC.scheme = scheme
        return VC
    }()
    
    @IBAction func changeColor(_ sender: UIButton) {
        
        
    }
    
    func makeStep() {
        guard let scheme = scheme else { return }
        for item in scheme.groupedCells[curGroup] {
            item.isRead = true
        }
        cellsInfoTableView.scrollToRow(at: IndexPath(row: curGroup, section: 0), at: .middle, animated: true)
        let curFirstCell = scheme.groupedCells[curGroup][0]
        scrollView.setContentOffset(CGPoint(x: 0, y: drawRectangle.cellHeight * CGFloat(scheme.getCellRow(by: curFirstCell.id)!) - drawRectangle.cellHeight), animated: true)
        
        cellsInfoTableView.reloadData()
        drawRectangle.setNeedsDisplay()
        
        cellsReady += scheme.groupedCells[curGroup].count
        progress = Float(cellsReady) / Float(scheme.cells.count)
        progressBar.progress = progress
        
        curGroup = (curGroup + 1) % (scheme.groupedCells.count)
    }
    
    // MARK: - Vars
    
    var scheme: SchemeNew?
    var curGroup: Int = 0
    var progress: Float = 0
    var cellsReady: Int = 0
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellsInfoTableView.delegate = self
        cellsInfoTableView.dataSource = self
        cellsInfoTableView.rowHeight = 24.0
        
        scrollView.addSubview(drawRectangle)
        
        speechSynthesizer.delegate = self
        
        cellsInfoTableView.register(UINib(nibName: "InfoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "InfoIDCell")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        drawRectangle.setNeedsDisplay()
        let size = CGSize(width: drawRectangle.cellWidth * CGFloat(drawRectangle.colsCount), height: drawRectangle.cellHeight * CGFloat(drawRectangle.rowsCount))
        print("size: \(size)")
        scrollView.contentSize = size
        drawRectangle.frame = CGRect(origin: .zero, size: size)
        
        
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    let speechSynthesizer = AVSpeechSynthesizer()
    
    @IBAction func play(_ sender: UIButton) {
        guard let scheme = scheme else { return }
        if speechSynthesizer.isPaused {
            speechSynthesizer.continueSpeaking()
        } else {
            for row in scheme.groupedCells {
                let str: String = row[0].color.defaultName! + " " + String(row.count)
                let speechUtterance = AVSpeechUtterance(string: str)
                
                speechUtterance.rate = 0.25
                speechUtterance.pitchMultiplier = 0.25
                speechUtterance.volume = 0.75
                speechUtterance.postUtteranceDelay = 0.005
                
                progress = 0
                cellsReady = 0
                
                speechSynthesizer.speak(speechUtterance)
            }
        }
        
    }
    @IBAction func pause(_ sender: UIButton) {
        
        speechSynthesizer.pauseSpeaking(at: .immediate)
        
    }
    @IBAction func stop(_ sender: UIButton) {
        
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        
    }
    
}

extension SchemeControllerNew: AVSpeechSynthesizerDelegate {
//    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
//        <#code#>
//    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("didStartSpeech: \(utterance.speechString)")
        makeStep()
    }
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
    
    
}
