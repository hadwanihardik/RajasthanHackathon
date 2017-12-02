//
//  PlaceDetailsView.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/2/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class PlaceDetailsView: UIViewController {
    
    var placeData = places()
    var selectedPlace = ""
    @IBOutlet weak var txtDesc: UITextView!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imvMainImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(DBHandler.selectSpecificData("SELECT  * FROM place where placeId=\"\(selectedPlace)\"").object(at: 0))
        placeData = Utils.getPlaceDetailsWithValues(dictLead: DBHandler.selectSpecificData("SELECT  * FROM place where placeId=\"\(selectedPlace)\"").object(at: 0) as! NSDictionary)
        txtDesc.text = placeData.overview! as String!
        lblTitle.text = placeData.name! as String
        var imagesArray = [UIImage]()
        for i in 1...3
        {
            imagesArray.append(UIImage(named:(placeData.images as String! + "\(i)"))!)
        }
        imvMainImage.animationImages = imagesArray
        imvMainImage.animationDuration = 15
        imvMainImage.animationRepeatCount = 0
        imvMainImage.startAnimating()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnShareTapped(_ sender: Any) {
        
        // set up activity view controller
        let textToShare = "\(placeData.name as! String) \n\(placeData.overview as! String)"
        let imgToShare = UIImage(named: (placeData.images as! String + "1"))

        let activityViewController = UIActivityViewController(activityItems: [textToShare,imgToShare!], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    @IBAction func btnMapTapped(_ sender: Any)
    {
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps://?saddr=&daddr=\(placeData.lati! as String),\(placeData.longi! as String)&directionsmode=driving")! as URL)
            
        } else {
            UIApplication.shared.openURL(NSURL(string:
                "https://maps.google.com/?saddr=&daddr=\(placeData.lati! as String),\(placeData.longi! as String)&directionsmode=driving")! as URL)
        }

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
