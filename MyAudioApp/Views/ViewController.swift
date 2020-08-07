//
//  ViewController.swift
//  MyAudioApp
//
//  Created by Francisco Higuera Zamarripa on 26/06/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var lblTimeToEnd: UILabel!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var imgSong: UIImageView!
    @IBOutlet weak var btn_playpause: UIButton!
    @IBOutlet weak var Slider_changetime: UISlider!
    @IBOutlet weak var btn_repeat: UIButton!
    @IBOutlet weak var btn_suffle: UIButton!
    var player : AVPlayer? = AVPlayer()
    var paused : Bool = false
    var playing:Bool  = false
    var lastSong: Bool = true
    var t = CMTime()
    var repeatStatus: Int = 0
    var countdownTimer: Timer!
    var totalTime: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
            

        // Do any additional setup after loading the view.
    }

    @IBAction func btn_PlayPause(_ sender: Any) {
        if(!playing){
            if(paused == false){
                reproducir(sonido: "DigimonTry")
                playing = true
                btn_playpause.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            }else{
                player?.play()
                playing = true;
                btn_playpause.setBackgroundImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            }
        }else{
            player?.pause()
            paused = true
            playing = false
            btn_playpause.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        }
    }
     
    @IBAction func Slider_ChangeTime(_ sender: Any) {
        player?.play()
        self.t = CMTimeMake(value: Int64(self.Slider_changetime.value), timescale: 1)
        player?.seek(to: t)
    }
    @IBAction func btn_Repeat(_ sender: Any) {
        
        switch self.repeatStatus {
        case 0:
            self.repeatStatus = 1
            self.btn_repeat.tintColor = UIColor.green
            break
        case 1:
            self.repeatStatus = 2
            self.btn_repeat.tintColor = UIColor.green
            self.btn_repeat.setImage(UIImage(systemName: "repeat.1"), for: .normal)

            break
        case 2:
            self.btn_repeat.tintColor = UIColor.white
            self.btn_repeat.setImage(UIImage(systemName: "repeat"), for: .normal)
            self.repeatStatus = 0
            break
        default:
            self.repeatStatus = 0
        }
    
    }
    func reproducir(sonido: String){
        do{
            let url = "https://drive.google.com/uc?export=download&id=13BMzWwG-WQ_0xQoA8qAPbTtBHHMUVNbF"
            let playerItem = AVPlayerItem( url:NSURL( string:url )! as URL )
            player = AVPlayer(playerItem:playerItem)
            player?.rate = 1.0;
            player?.play()
        }catch let error as NSError{
            print("se cayo a pedasos")
        }
    }
    
    func updateSlider(){
        Slider_changetime.value = Float(CMTimeGetSeconds((player?.currentTime())!))
        lblCurrentTime.text = self.timeFormatted(Int(Slider_changetime.value)) 
    }
    
    func nextSong(){
        
    }
    //https://www.icloud.com/iclouddrive/0VjAQNt9aPxDRxWmwOg85ixRw#DigimonTry
    //
    
    func prepareView(){
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: .main) { _ in
            self.player?.seek(to: CMTime.zero)
            
            if(self.repeatStatus == 2){
                self.player?.play()
            }else{
                if(self.repeatStatus == 0){
                    if(self.lastSong){
                        self.btn_playpause.setBackgroundImage(UIImage(systemName: "play.circle.fill"), for: .normal)
                    }
                }else{
                    self.nextSong()
                }
                
            }
            

        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.updateSlider()
            if(self.player?.currentItem != nil){
                self.Slider_changetime.maximumValue = Float(CMTimeGetSeconds((self.player?.currentItem!.asset.duration)!))
                if(self.totalTime == 0){
                    self.totalTime = Int(CMTimeGetSeconds((self.player?.currentItem!.asset.duration)!))
                }
                self.lblTimeToEnd.text = String(self.timeFormatted(self.totalTime - Int(CMTimeGetSeconds((self.player?.currentTime())!))))

            }
            
            }
        
    }
    
    func endTimer() {
       // countdownTimer.invalidate()
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60

        return String(format: "%02d:%02d", minutes, seconds)
    }
}

