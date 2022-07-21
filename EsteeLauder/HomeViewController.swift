//
//  HomeViewController.swift
//  EsteeLauder
//
//  Created by Sandya Suresh on 7/21/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var detailsButton: UIButton!
    
    var images = ["serum_and_balm", "serum_and_hands", "serum_backlit", "serum_front", "serums", "style_serum"]
    var i = 0
    
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        i = images.firstIndex(of: "serum_front")!
        imageView.image = UIImage(named: images[i])
        // Do any additional setup after loading the view.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in self.nextImage()}
        
        detailsButton.layer.shadowColor = UIColor.black.cgColor
        detailsButton.layer.shadowOpacity = 0.5
        detailsButton.layer.shadowRadius = 10
        
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOpacity = 0.6
        titleLabel.layer.shadowRadius = 10
    }
    
    @IBAction func prevBut(_ sender: Any) {
            timer?.invalidate()
            prevImage()
    }
    @IBAction func nextBut(_ sender: Any) {
        timer?.invalidate()
            nextImage()
    }
                                  
    @objc func swipe(_sender: UISwipeGestureRecognizer) {
        timer?.invalidate()
        switch _sender.direction{
            case .right:
                prevImage()
                print("right")
            case .left:
                nextImage()
                print("left")
            default:
                break;
        }
    }
    func nextImage(){
        if(i == 0){
            i = images.count - 1;
        }else{
            i = i - 1
        }
        imageView.image = UIImage(named: images[i])
    }
    func prevImage(){
        if(i == images.count - 1){
            i = 0;
        }else{
            i = i + 1
        }
        imageView.image = UIImage(named: images[i])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
