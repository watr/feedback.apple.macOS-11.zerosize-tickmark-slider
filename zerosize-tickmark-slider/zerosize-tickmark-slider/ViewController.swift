//
//  ViewController.swift
//  zerosize-tickmark-slider
//
//  Created by HASHIMOTO Wataru on 2021/04/14.
//

import Cocoa

class CutsomSlider: NSSlider {
    var hidesTickMarks: Bool = false
    
    override func rectOfTickMark(at index: Int) -> NSRect {
        var r = super.rectOfTickMark(at: index)
        if self.hidesTickMarks {
            r.size = CGSize.zero
            return r
        }
        else {
            return r
        }
    }
}

class ViewController: NSViewController {

    @IBOutlet weak var slider: CutsomSlider!
    
    @IBOutlet weak var tickMarkSizeZeroButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let slider = self.slider else {
            return
        }
        slider.numberOfTickMarks =
            Int(((slider.maxValue - slider.minValue) + 1))
        self.applyTickMarkStatus()
    }
    
    func applyTickMarkStatus() {
        self.slider.hidesTickMarks = self.tickMarkSizeZeroButton.state != .off
    }
    
    @IBAction func showsTickMarkAction(_ sender: Any) {
        self.applyTickMarkStatus()
        if let slider = self.slider {
            slider.needsDisplay = true
            slider.needsLayout = true
        }
    }
    
}

