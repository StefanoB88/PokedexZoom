//
//  ViewDetail.swift
//  PokedexZoom
//
//  Created by Stefano Brandi on 17/07/21.
//

import UIKit

class ViewDetail: UIViewController {
    
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var imgType1: UIImageView!
    @IBOutlet weak var imgType2: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var imgBackgroundType: UIImageView!
    
    
    
    var detail = DataManager.shared.getDetail
    
    
    
    
    
    override func viewDidLoad() {
        
        print(detail.types!.count)
        
        do {
            
            let url = URL(string: (detail.sprites?.front_default)!)
            let data = try Data(contentsOf: url!)
            let image: UIImage = UIImage(data: data)!
            
            img1.image = image
            shape()
            
            lblName.text = detail.name?.uppercased()
            lblHeight.text = "\(detail.height!)" + " M" + "\nHeight"
            lblWeight.text = "\(detail.weight!)" + " KG" + "\nWeight"
            
            if detail.types!.count == 2 {
                
                lblType.text = "\(detail.types![0].type!.name ?? "")" + "/" + "\(detail.types![1].type!.name ?? "")"
                
                switch "\(detail.types![1].type!.name ?? "")" {
                
                case "grass":
                    imgType2.backgroundColor = .systemGreen
                    
                case "fire":
                    imgType2.backgroundColor = .systemRed
                    
                case "water":
                    imgType2.backgroundColor = .blue
                    
                case "normal":
                    imgType2.backgroundColor = .systemGray
                    
                case "poison":
                    imgType2.backgroundColor = .systemPurple
                    
                default:
                    break
                }
                
            } else {
                
                lblType.text = "\(detail.types![0].type!.name ?? "")"
                imgType2.isHidden = true
            }
            
            switch "\(detail.types![0].type!.name ?? "")" {
            
            case "grass":
                view.backgroundColor = .systemGreen
                imgType1.backgroundColor = .systemGreen
                imgBackgroundType.backgroundColor = .green
                
            case "fire":
                view.backgroundColor = .systemRed
                imgType1.backgroundColor = .systemRed
                
            case "water":
                view.backgroundColor = .blue
                imgType1.backgroundColor = .blue
                
            case "normal":
                view.backgroundColor = .systemGray
                imgType1.backgroundColor = .systemGray
                
            case "poison":
                view.backgroundColor = .systemPurple
                imgType1.backgroundColor = .systemPurple
                
            case "ghost":
                view.backgroundColor = .systemGray6
                imgType1.backgroundColor = .systemGray6
                
            case "electric":
                view.backgroundColor = .systemYellow
                imgType1.backgroundColor = .systemYellow
                
            case "ground":
                view.backgroundColor = .brown
                imgType1.backgroundColor = .brown
                
            case "rock":
                view.backgroundColor = .systemGray2
                imgType1.backgroundColor = .systemGray2
                
            case "ice":
                view.backgroundColor = .cyan
                imgType1.backgroundColor = .cyan
                
            case "psychic":
                view.backgroundColor = .magenta
                imgType1.backgroundColor = .magenta
                
            case "bug":
                view.backgroundColor = .green
                imgType1.backgroundColor = .green
                
            case "dark":
                view.backgroundColor = .black
                imgType1.backgroundColor = .black
                
            default:
                break
            }
            
            
        } catch {
            
            print("Errore")
        }
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func shape() {
        imgType1.layer.borderWidth = 1
        imgType1.layer.masksToBounds = false
        imgType1.layer.borderColor = UIColor.black.cgColor
        imgType1.layer.cornerRadius = imgType1.frame.height/2
        imgType1.clipsToBounds = true
        
        imgType2.layer.borderWidth = 1
        imgType2.layer.masksToBounds = false
        imgType2.layer.borderColor = UIColor.black.cgColor
        imgType2.layer.cornerRadius = imgType1.frame.height/2
        imgType2.clipsToBounds = true
        
        img1.layer.borderWidth = 2
        img1.backgroundColor = .white
        img1.layer.masksToBounds = false
        img1.layer.borderColor = UIColor.black.cgColor
        img1.layer.cornerRadius = img1.frame.height/4
        img1.clipsToBounds = true
    }
    
}
