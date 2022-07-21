//
//  DetailsViewController.swift
//  EsteeLauder
//
//  Created by Sandya Suresh on 7/21/22.
//

import UIKit

var images = ["big_drop", "droplet", "droplet1", "hands", "model_face_and_serum", "idkwhatthisis"]
var timer: Timer?

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        i = images.firstIndex(of: "model_face_and_serum")!
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

        // Do any additional setup after loading the view.
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
