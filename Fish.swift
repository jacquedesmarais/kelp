//
//  Fish Tracker
//
//  Created by Jacque on 11/6/17.
//  Copyright © 2017 jacquedesmarais. All rights reserved.
//

import UIKit

class Fish: NSObject, NSCoding {
    
    // MARK : Properties
    
    var name: String
    var photo: UIImage?
    var family: String
    var color: String
    var aquarium: String
    var fishDescription: String
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("fishes")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let familyKey = "family"
        static let colorKey = "color"
        static let aquariumKey = "aquarium"
        static let fishDescriptionKey = "fishDescription"
    }
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, family: String, color: String, aquarium: String, fishDescription: String) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.family = family
        self.color = color
        self.aquarium = aquarium
        self.fishDescription = fishDescription
        
        super.init()
    }
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        aCoder.encode(family, forKey: PropertyKey.familyKey)
        aCoder.encode(color, forKey: PropertyKey.colorKey)
        aCoder.encode(aquarium, forKey: PropertyKey.aquariumKey)
        aCoder.encode(fishDescription, forKey: PropertyKey.fishDescriptionKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let family = aDecoder.decodeObject(forKey: PropertyKey.familyKey) as! String
        let color = aDecoder.decodeObject(forKey: PropertyKey.colorKey) as! String
        let aquarium = aDecoder.decodeObject(forKey: PropertyKey.aquariumKey) as! String
        let fishDescription = aDecoder.decodeObject(forKey: PropertyKey.fishDescriptionKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, family: family, color: color, aquarium: aquarium, fishDescription: fishDescription)
    }
    
}

