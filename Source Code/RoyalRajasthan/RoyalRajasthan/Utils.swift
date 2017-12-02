//
//  Utils.swift
//  RoyalRajasthan
//
//  Created by Chintan patel on 02/12/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import Foundation

class Utils
{
    static func getCityWithValues(dictLead:NSDictionary) -> city{
        let tmpOBJ = city.init()
        
        tmpOBJ.cityID =   dictLead["cityID"] as!  NSString
        tmpOBJ.name =   dictLead["name"] as! NSString
        tmpOBJ.imagename =   dictLead["imagename"] as! NSString
        tmpOBJ.overview =   dictLead["overview"] as! NSString
        tmpOBJ.famousfood =   dictLead["famousfood"] as! NSString
        tmpOBJ.bestvisittime =   dictLead["bestvisittime"] as! NSString
        tmpOBJ.tagline =   dictLead["tagline"] as! NSString
        tmpOBJ.lati =   dictLead["lati"] as! NSString
        tmpOBJ.longi =   dictLead["longi"] as! NSString
        
        return tmpOBJ
    }
        static func getPlaceDetailsWithValues(dictLead:NSDictionary) -> places{
        let tmpOBJ = places.init()
        
        tmpOBJ.cityID =   dictLead["cityID"] as!  NSString
        tmpOBJ.placeID =   dictLead["cityID"] as!  NSString

        tmpOBJ.name =   dictLead["name"] as! NSString
        tmpOBJ.images =   dictLead["images"] as! NSString
        tmpOBJ.overview =   dictLead["overview"] as! NSString
        tmpOBJ.longi =   dictLead["longi"] as! NSString
        tmpOBJ.lati =   dictLead["lati"] as! NSString
        
        return tmpOBJ
    }
    
   
    static func getTravelsWithValues(dictLead:NSDictionary) -> travels{
        let tmpOBJ = travels.init()
        //    CREATE TABLE "travels" ("travelsID" INTEGER PRIMARY KEY AUTOINCREMENT, "logoimage" TEXT, "name" TEXT, "phone" TEXT, "images" TEXT, "email" TEXT)
        tmpOBJ.travelsID =   dictLead["travelsID"] as! NSString
        tmpOBJ.logoimage =   dictLead["logoimage"] as! NSString
        tmpOBJ.name =   dictLead["name"] as! NSString
        tmpOBJ.phone =   dictLead["phone"] as! NSString
        tmpOBJ.email =   dictLead["email"] as! NSString
        
        return tmpOBJ
    }
    
    static func getFestivalsWithValues(dictLead:NSDictionary) -> festivals{
        let tmpOBJ = festivals.init()
        //CREATE TABLE "festivals" ("festivalID" INTEGER PRIMARY KEY AUTOINCREMENT, "name" TEXT, "overview" TEXT, "festivaltime" TEXT, "images" TEXT)
        tmpOBJ.festivalID =   dictLead["festivalID"] as! NSString
        tmpOBJ.name =   dictLead["name"] as! NSString
        tmpOBJ.overview =   dictLead["overview"] as! NSString
        tmpOBJ.festivaltime =   dictLead["festivaltime"] as! NSString
        tmpOBJ.images =   dictLead["images"] as! NSString
        
        return tmpOBJ
    }
    static func getHotelsWithValues(dictLead:NSDictionary) -> hotelsModel{
        let tmpOBJ = hotelsModel.init()
        
        tmpOBJ.cityID =   dictLead["cityID"] as! NSString
        tmpOBJ.hotelID =   dictLead["hotelID"] as! NSString
        tmpOBJ.name =   dictLead["name"] as! NSString
        tmpOBJ.address =   dictLead["address"] as! NSString
        tmpOBJ.phone =   dictLead["phone"] as! NSString
        tmpOBJ.images =   dictLead["images"] as! NSString
        tmpOBJ.lati =   dictLead["lati"] as! NSString
        tmpOBJ.longi =   dictLead["longi"] as! NSString
        
        return tmpOBJ
    }
    
    static func getShopsWithValues(dictLead:NSDictionary) -> shoppingModel{
        let tmpOBJ = shoppingModel.init()
        
        tmpOBJ.cityID =   dictLead["cityID"] as! NSString
        tmpOBJ.shopID =   dictLead["shopID"] as! NSString
        tmpOBJ.name =   dictLead["name"] as! NSString
        tmpOBJ.address =   dictLead["address"] as! NSString
        tmpOBJ.phone =   dictLead["phone"] as! NSString
        tmpOBJ.images =   dictLead["images"] as! NSString
        tmpOBJ.lati =   dictLead["lati"] as! NSString
        tmpOBJ.longi =   dictLead["longi"] as! NSString
        
        return tmpOBJ
    }
    
    static func getGuideWithValues(dictLead:NSDictionary) -> guidesModel{
        let tmpOBJ = guidesModel.init()
        tmpOBJ.cityID =   dictLead["cityID"] as! NSString
        tmpOBJ.guideID =   dictLead["guideID"] as! NSString
        tmpOBJ.name =   dictLead["name"] as! NSString
        tmpOBJ.languages =   dictLead["languages"] as! NSString
        tmpOBJ.phone =   dictLead["phone"] as! NSString
        tmpOBJ.image =   dictLead["image"] as! NSString
        tmpOBJ.price =   dictLead["price"] as! NSString
        tmpOBJ.rattings =   dictLead["rattings"] as! NSString
        
        return tmpOBJ
    }



}

