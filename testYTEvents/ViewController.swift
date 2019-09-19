//
//  ViewController.swift
//  testYTEvents
//
//  Created by Hung-Kun Hsieh on 2019/8/5.
//  Copyright © 2019 ActionApp. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class ViewController: UIViewController {

    @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerView.delegate = self
        let privateVideoID = "KuxW_UIMVUY"
        let notEmbeddableVideoID = "uRyAS_F3C20"
        playerView.load(withVideoId: notEmbeddableVideoID, playerVars: [
            "playsinline": 1,
            "origin": "https://youtube.com",
            "iv_load_policy": 3,
            "modestbranding": 1,
            "fs": 0
            ])
        
    }


}

extension ViewController: WKYTPlayerViewDelegate {
    func playerView(_ playerView: WKYTPlayerView, didChangeTo state: WKYTPlayerState) {
        switch state {
        case .queued:
            print("player queued")
        case .playing:
            print("player playing")
        case .paused:
            print("player paused")
        case .ended:
            print("player ended")
        case .buffering:
            print("player buffering")
        case .unstarted:
            print("player unstarted")
        default:
            print("player unknown state :\(state.rawValue)")
            break
        }
    }
    func playerView(_ playerView: WKYTPlayerView, receivedError error: WKYTPlayerError) {
        print("player received error")
        print(error)
        var errorMessage = ""
        switch error {
        case .html5Error:
            errorMessage = "HTML5 error"
        case .invalidParam:
            errorMessage = "Invalid Param"
        case .notEmbeddable:
            errorMessage = "Not Embeddable"
        case .videoNotFound:
            errorMessage = "Video Not Found"
        case .unknown:
            errorMessage = "Unknown"
        default:
            errorMessage = "Not Listed"
        }
        errorLabel.text = "Error: \(errorMessage)"
    }
}
