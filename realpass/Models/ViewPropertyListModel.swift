
import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ViewPropertyListModel {
	public var propertyId : Int?
	public var propertyPic : String?
	public var propertyQrCode : String?
	public var address : String?
	public var rating : Double?
	public var website : String?
	public var agentId : Int?
	public var firstName : String?
	public var lastName : String?
	public var agencyName : String?
	public var profilePic : String?
	public var visitedDate : String?
	public var email : String?
	public var mobile : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ViewPropertyListModel]
    {
        var models:[ViewPropertyListModel] = []
        for item in array
        {
            models.append(ViewPropertyListModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		propertyId = dictionary["propertyId"] as? Int
		propertyPic = dictionary["propertyPic"] as? String
		propertyQrCode = dictionary["propertyQrCode"] as? String
		address = dictionary["address"] as? String
		rating = dictionary["rating"] as? Double
		website = dictionary["website"] as? String
		agentId = dictionary["agentId"] as? Int
		firstName = dictionary["firstName"] as? String
		lastName = dictionary["lastName"] as? String
		agencyName = dictionary["agencyName"] as? String
		profilePic = dictionary["profilePic"] as? String
		visitedDate = dictionary["visitedDate"] as? String
		email = dictionary["email"] as? String
		mobile = dictionary["mobile"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.propertyId, forKey: "propertyId")
		dictionary.setValue(self.propertyPic, forKey: "propertyPic")
		dictionary.setValue(self.propertyQrCode, forKey: "propertyQrCode")
		dictionary.setValue(self.address, forKey: "address")
		dictionary.setValue(self.rating, forKey: "rating")
		dictionary.setValue(self.website, forKey: "website")
		dictionary.setValue(self.agentId, forKey: "agentId")
		dictionary.setValue(self.firstName, forKey: "firstName")
		dictionary.setValue(self.lastName, forKey: "lastName")
		dictionary.setValue(self.agencyName, forKey: "agencyName")
		dictionary.setValue(self.profilePic, forKey: "profilePic")
		dictionary.setValue(self.visitedDate, forKey: "visitedDate")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.mobile, forKey: "mobile")

		return dictionary
	}

}
