//
//  FestivalsViewController.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/2/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class FestivalsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var arrayForFestivals = NSMutableArray()
    @IBOutlet weak var tblFestivals: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tblFestivals.register(UINib(nibName: "FestivalsTableViewCell", bundle: nil), forCellReuseIdentifier: "FestivalsTableViewCell")
        arrayForFestivals = DBHandler.selectData(fromTable: "festivals")
        
        tblFestivals.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayForFestivals.count//arrayPlaces.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FestivalsTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! FestivalsTableViewCell
        
        var data = festivals()
        
        data = Utils.getFestivalsWithValues(dictLead: (arrayForFestivals.object(at: indexPath.row) as! NSMutableDictionary))
        
        cell.imgFestival.image = UIImage(named: data.images as String)
        cell.lblName.text = data.name as String
        return cell;
        
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
