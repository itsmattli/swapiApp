//
//  DetailViewController.swift
//  swapiApp
//
//  Created by Matthew Li on 2017-12-01.
//  Copyright © 2017 Matthew Li. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var openingCrawl: UITextView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = openingCrawl {
                label.text = detail.opening_crawl
                self.timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            }
        }
    }
    
    var timer = Timer()
    var step: Double = 0
    
    @objc func update() {
        let progress = step / 50
        
        // Get the number of characters
        let characters = openingCrawl.text.count
        
        // Calculate where to scroll
        let location = Double(characters) * progress
        
        // Scroll the textView
        openingCrawl.scrollRangeToVisible(NSRange(location: Int(location), length: 10))
        step += 1
        print(step)
        
        if (progress == 1) {
            self.timer.invalidate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Film? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.timer.invalidate()
    }


}

