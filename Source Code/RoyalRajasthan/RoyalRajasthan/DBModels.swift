//
//  DBModels.swift
//  RoyalRajasthan
//
//  Created by Chintan patel on 02/12/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import Foundation
class city: NSObject {
    
    var cityID : NSString!
    var name : NSString!
    var imagename : NSString!
    var overview : NSString!
    var famousfood : NSString!
    var bestvisittime : NSString!
    var tagline : NSString!
    var lati : NSString!
    var longi : NSString!
  
}

class places: NSObject {
    
    var overview : NSString!
    var placeID : NSString!
    var cityID : NSString!
    var name : NSString!
    var images : NSString!
    var lati : NSString!
    var longi : NSString!

}


class travels: NSObject {
   
    
    var travelsID : NSString!
    var logoimage : NSString!
    var name : NSString!
    var phone : NSString!
    var images : NSString!
    var email : NSString!
    
}

class festivals: NSObject {
   
    var festivalID : NSString!
    var name : NSString!
    var overview : NSString!
    var festivaltime : NSString!
    var images : NSString!
 
    
    
}





