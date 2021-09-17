//
//  ViewTimer.swift
//  PokedexZoom
//
//  Created by Stefano Brandi on 16/07/21.
//

import UIKit
import AVFoundation
import UserNotifications

class ViewTimer: UIViewController {
    
    
    @IBOutlet weak var btnStart1: UIButton!
    @IBOutlet weak var btnStart2: UIButton!
    @IBOutlet weak var btnStart3: UIButton!
    @IBOutlet weak var btnStart4: UIButton!
    @IBOutlet weak var progress1: UIProgressView!
    @IBOutlet weak var progress2: UIProgressView!
    @IBOutlet weak var progress3: UIProgressView!
    @IBOutlet weak var progress4: UIProgressView!
    
    
    @objc func displayAlert() {
        let alert = UIAlertController(title: "PokèTimer", message: "Tempo di recupero finito", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            AudioServicesPlaySystemSound(1520)
            print("Ok")
        }))
        AudioServicesPlaySystemSound(1520)
        self.present(alert, animated: true, completion: nil)
    }
    
    func notificaUser(timeUser: Double) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            
            let content = UNMutableNotificationContent()
            content.title = "PokèTimer"
            content.subtitle = "Tempo di recupero finito"
            //content.body = "Preparati per la prossima ripetizione"
            content.categoryIdentifier = "Utility"
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "sound1.mp3"))
            
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: timeUser,
                repeats: false)
            
            let request = UNNotificationRequest(
                identifier: "10.second.message",
                content: content,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnStart1(_ sender: Any) {
        AudioServicesPlaySystemSound(1520)
        self.progress1.setProgress(0, animated: true)
        
        UIView.animate(withDuration: 30) {
            self.progress1.setProgress(1, animated: true)
        }
        
        self.notificaUser(timeUser: 30)
        self.perform(#selector(self.displayAlert), with: nil, afterDelay: 30)
        
        
    }
    
    
    @IBAction func btnStart2(_ sender: Any) {
        AudioServicesPlaySystemSound(1520)
        
        DispatchQueue.main.async {
            self.progress2.setProgress(0, animated: true)
            UIView.animate(withDuration: 45) {
                self.progress2.setProgress(1, animated: true)
            }
        }
        
        
        self.notificaUser(timeUser: 45)
        self.perform(#selector(self.displayAlert), with: nil, afterDelay: 45)
    }
    
    
    @IBAction func btnStart3(_ sender: Any) {
        AudioServicesPlaySystemSound(1520)
        self.progress3.setProgress(0, animated: true)
        
        UIView.animate(withDuration: 60) {
            self.progress3.setProgress(1, animated: true)
        }
        
        self.notificaUser(timeUser: 60)
        self.perform(#selector(self.displayAlert), with: nil, afterDelay: 60)
    }
    
    
    @IBAction func btnStart4(_ sender: Any) {
        AudioServicesPlaySystemSound(1520)
        self.progress4.setProgress(0, animated: true)
        
        UIView.animate(withDuration: 90) {
            self.progress4.setProgress(1, animated: true)
        }
        
        self.notificaUser(timeUser: 90)
        self.perform(#selector(self.displayAlert), with: nil, afterDelay: 90)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set value 0 for progressView
        self.progress1.setProgress(0, animated: true)
        self.progress2.setProgress(0, animated: true)
        self.progress3.setProgress(0, animated: true)
        self.progress4.setProgress(0, animated: true)
        
        // colors
        self.progress1.tintColor = .systemRed
        self.progress2.tintColor = .systemRed
        self.progress3.tintColor = .systemRed
        self.progress4.tintColor = .systemRed
    }
    
}
 
