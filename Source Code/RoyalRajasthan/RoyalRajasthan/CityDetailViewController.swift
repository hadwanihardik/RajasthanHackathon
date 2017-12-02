//
//  CityDetailViewController.swift
//  RoyalRajasthan
//
//  Created by Chintan patel on 02/12/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
//    @IBOutlet weak var tblPlaces: UITableView!
    @IBOutlet weak var imgMainImage: UIImageView!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet  var btnPlaces : Array <UIButton>?
    
    
    var cityData = city()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = cityData.name.uppercased
        txtDesc.text = " Famous food: \(cityData.famousfood!)\n\n Best Time To Visit:\(cityData.bestvisittime!) \n\nOverview:\(cityData.overview!)"
        var imagesArray = [UIImage]()
        for i in 1...5
        {
            imagesArray.append(UIImage(named:(cityData.imagename as String! + "\(i)"))!)
        }
        imgMainImage.animationImages = imagesArray
        imgMainImage.animationDuration = 15
        imgMainImage.animationRepeatCount = 0
        imgMainImage.startAnimating()
        
        
        ///
        
        for btnPlace in btnPlaces!
        {
            btnPlace.layer.borderColor = UIColor.init(colorLiteralRed: 248/255.0, green: 246/255.0, blue: 248/255.0, alpha: 0.8).cgColor
            btnPlace.layer.borderWidth = 2
           // btnPlace.layer.cornerRadius = 17
            btnPlace.clipsToBounds = true
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func openHotels(_ sender: Any) {
        let hotelsOBJ = HotelsViewController(nibName: "HotelsViewController", bundle: nil)
        self.navigationController?.pushViewController(hotelsOBJ, animated: true)
    }
    
    @IBAction func openShoppings(_ sender: Any) {
        let shopsOBJ = ShoppingViewController(nibName: "ShoppingViewController", bundle: nil)
        self.navigationController?.pushViewController(shopsOBJ, animated: true)
        
    }
    @IBAction func openGuides(_ sender: Any) {
        
        let guideOBJ = GuidesViewController(nibName: "GuidesViewController", bundle: nil)
        self.navigationController?.pushViewController(guideOBJ, animated: true)
    }

    @IBAction func openMap(_ sender: Any) {
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps://?saddr=&daddr=\(cityData.lati! as String),\(cityData.longi! as String)&directionsmode=driving")! as URL)
            
        } else {
            UIApplication.shared.openURL(NSURL(string:
                "https://maps.google.com/?saddr=&daddr=\(cityData.lati! as String),\(cityData.longi! as String)&directionsmode=driving")! as URL)
        }
    }
    
    
    

    @IBAction func openPlaceDetails(_ sender: UIButton) {
        
        let placeDetails = PlaceDetailsView(nibName: "PlaceDetailsView", bundle: nil)
        placeDetails.selectedPlace = "\(sender.tag)"
        self.navigationController?.pushViewController(placeDetails, animated: true)
        
    }
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
