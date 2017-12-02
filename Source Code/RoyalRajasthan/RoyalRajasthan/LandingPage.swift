//
//  LandingPage.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/2/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class LandingPage: UIViewController {
    
    //Outlets
    @IBOutlet weak var videoViewer: UIView!
    @IBOutlet weak var btnSkip: UIButton!
    
    //Objects
    var playerView = AVPlayerViewController()
    var player = AVPlayer()
    var isPushed = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadVideo()
        btnSkip.layer.borderColor = UIColor.init(colorLiteralRed: 248/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1.0).cgColor
        btnSkip.layer.borderWidth = 1.5
        btnSkip.layer.cornerRadius = 17
        DispatchQueue.main.asyncAfter(deadline: .now() + 18.5, execute: {
            if(self.isPushed==false)
            {
                self.skipVideo(self.btnSkip)
            }
        })
        // Do any additional setup after loading the view.
    }
    func loadVideo()
    {
        
        let videoString:String? = Bundle.main.path(forResource: "VIDEO RAJSTHAN", ofType: ".mp4")
        
        if let url = videoString {
            let videoURL = NSURL(fileURLWithPath: url)
            self.player = AVPlayer(url: videoURL as URL)
            self.playerView.player = self.player
        }
        self.videoViewer.addSubview(self.playerView.view);
        self.playerView.view.frame = CGRect(x: 0, y: 0, width: self.videoViewer.frame.size.width, height: self.videoViewer.frame.size.height);
        self.playerView.didMove(toParentViewController: self)
        self.playerView.player?.play()
        self.playerView.showsPlaybackControls = false
        self.addChildViewController(self.playerView)

    }

    @IBAction func skipVideo(_ sender: Any) {
        isPushed = true
        let home = HomePage(nibName: "HomePage", bundle: nil)
        self.playerView.player?.pause()
        self.playerView.removeFromParentViewController()
        self.navigationController?.pushViewController(home, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
