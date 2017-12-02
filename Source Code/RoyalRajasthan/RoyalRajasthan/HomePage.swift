//
//  HomePage.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/2/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class HomePage: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tblPlaces: UITableView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var btnMenu1: UIButton!
    @IBOutlet weak var btnMenu3: UIButton!
    @IBOutlet weak var btnMenu2: UIButton!
    @IBOutlet weak var btnMenu: UIButton!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var btn1Leading: NSLayoutConstraint!
    @IBOutlet weak var btn2Leading: NSLayoutConstraint!
    @IBOutlet weak var btn3Leading: NSLayoutConstraint!
    
    var arrayForPlaces = NSMutableArray()
    var isMenuOpen =  false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblPlaces.register(UINib(nibName: "PlaceCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
        arrayForPlaces = DBHandler.selectData(fromTable: "city")
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayForPlaces.count//arrayPlaces.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "PlaceCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! PlaceCell
        
        var data = city()
        
        data = Utils.getCityWithValues(dictLead: (arrayForPlaces.object(at: indexPath.row) as! NSMutableDictionary))
        
        cell.imvPlace.image = UIImage(named: data.name.uppercased)
        cell.lblPlaceName.text = data.name.uppercased as String
        cell.lblTagLine.text = data.tagline as String
        return cell;
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row != 0
        {
            return;
        }
        let detailPage = CityDetailViewController(nibName: "CityDetailViewController", bundle: nil)
        
        detailPage.cityData = Utils.getCityWithValues(dictLead: (arrayForPlaces.object(at: 0) as! NSMutableDictionary))
        self.navigationController?.pushViewController(detailPage, animated: true)
        
    }

    @IBAction func openCloseMenu(_ sender: Any) {
        if(isMenuOpen == false)
        {
            
            leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            }, completion:
                {
                    (value: Bool) in
                    self.btnMenu.setImage(UIImage(named:"menuClose"), for: .normal)
  
            })
            isMenuOpen = true
        }
        else
        {
            leadingConstraint.constant = -178
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            }, completion:
                {
                    (value: Bool) in
                    self.btnMenu.setImage(UIImage(named:"menuOpen"), for: .normal)

            })
            isMenuOpen = false
            
        }
    }
    
    @IBAction func btnTravellsTapped(_ sender: Any)
    {
         leadingConstraint.constant = -178
        self.view.layoutIfNeeded()
        self.btnMenu.setImage(UIImage(named:"menuOpen"), for: .normal)
        let travells = TravelsViewController(nibName: "TravelsViewController", bundle: nil)
        self.navigationController?.pushViewController(travells, animated: true)
    }
    
    @IBAction func btnFestivalsTapped(_ sender: Any) {
        leadingConstraint.constant = -178
        self.view.layoutIfNeeded()
        self.btnMenu.setImage(UIImage(named:"menuOpen"), for: .normal)
        let festivals = FestivalsViewController(nibName: "FestivalsViewController", bundle: nil)
        self.navigationController?.pushViewController(festivals, animated: true)
    }
    @IBAction func btnFeedBackTapped(_ sender: Any) {
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
