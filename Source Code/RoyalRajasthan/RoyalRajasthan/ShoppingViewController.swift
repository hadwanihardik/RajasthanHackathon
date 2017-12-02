//
//  HotelsViewController.swift
//  RoyalRajasthan
//
//  Created by Chintan patel on 02/12/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tblViewHotels: UITableView!
    
    var arrayForTravels = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewHotels.register(UINib(nibName: "ShoppingTableCell", bundle: nil), forCellReuseIdentifier: "ShoppingTableCell")
        
        arrayForTravels = DBHandler.selectData(fromTable: "shops")
        tblViewHotels.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayForTravels.count//arrayPlaces.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ShoppingTableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ShoppingTableCell
        
        var data = shoppingModel()
        
        data = Utils.getShopsWithValues(dictLead:(arrayForTravels.object(at: indexPath.row) as! NSMutableDictionary))
        
        cell.imgHotel.image = UIImage(named: data.images as String)
        cell.lblHotelName.text = data.name as String!
        cell.lblHotelAddress.text = data.address as String!
        
        cell.btnCallTapped.addTarget(self, action:#selector(self.handleRegister(sender:)), for: .touchUpInside)
        
        cell.btnCallTapped.tag = indexPath.row
        
        cell.btnMapTapped.addTarget(self, action:#selector(self.btnMaptapped(sender:)), for: .touchUpInside)
        
        cell.btnMapTapped.tag = indexPath.row

            return cell;
        
        
    }
    func handleRegister(sender: UIButton){
        var data = shoppingModel()
        
        data = Utils.getShopsWithValues(dictLead:(arrayForTravels.object(at: sender.tag) as! NSMutableDictionary))
        if let url = URL(string: "tel://\(data.phone!)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    func btnMaptapped(sender: UIButton){
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps://?saddr=&daddr=24.598593,73.696070&directionsmode=driving")! as URL)
            
        } else {
            UIApplication.shared.openURL(NSURL(string:
                "https://maps.google.com/?saddr=&daddr=24.598593,73.696070&directionsmode=driving")! as URL)
        }
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
