
import Foundation
 
public class GetBuyerProfileModel {
	public var buyerId : Int?
	public var qrCode : String?
	public var profilePic : String?
	public var firstName : String?
	public var lastName : String?
	public var mobile : String?
	public var email : String?
	public var hasCall : String?
	public var hasSMS : String?
	public var hasEmail : String?
	public var availabilityTime : Array<AvailabilityTime>?
	public var answer1 : String?
	public var answer2 : String?
	public var partners : Array<Partners>?
	public var preferredSuburbs : Array<PreferredSuburbs>?
	public var minPrice : String?
	public var maxPrice : String?
	public var bedrooms : Int?
	public var bathrooms : Int?
	public var cars : Int?
	public var aboutMe : String?
	public var preApprovedFinance : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [GetBuyerProfileModel]
    {
        var models:[GetBuyerProfileModel] = []
        for item in array
        {
            models.append(GetBuyerProfileModel(dictionary: item as! NSDictionary)!)
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

		buyerId = dictionary["buyerId"] as? Int
		qrCode = dictionary["qrCode"] as? String
		profilePic = dictionary["profilePic"] as? String
		firstName = dictionary["firstName"] as? String
		lastName = dictionary["lastName"] as? String
		mobile = dictionary["mobile"] as? String
		email = dictionary["email"] as? String
		hasCall = dictionary["hasCall"] as? String
		hasSMS = dictionary["hasSMS"] as? String
		hasEmail = dictionary["hasEmail"] as? String
        if (dictionary["availabilityTime"] != nil) { availabilityTime = AvailabilityTime.modelsFromDictionaryArray(array: dictionary["availabilityTime"] as! NSArray) }
		answer1 = dictionary["answer1"] as? String
		answer2 = dictionary["answer2"] as? String
        if (dictionary["partners"] != nil) { partners = Partners.modelsFromDictionaryArray(array: dictionary["partners"] as! NSArray) }
        if (dictionary["preferredSuburbs"] != nil) { preferredSuburbs = PreferredSuburbs.modelsFromDictionaryArray(array: dictionary["preferredSuburbs"] as! NSArray) }
		minPrice = dictionary["minPrice"] as? String
		maxPrice = dictionary["maxPrice"] as? String
		bedrooms = dictionary["bedrooms"] as? Int
		bathrooms = dictionary["bathrooms"] as? Int
		cars = dictionary["cars"] as? Int
		aboutMe = dictionary["aboutMe"] as? String
		preApprovedFinance = dictionary["preApprovedFinance"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.buyerId, forKey: "buyerId")
		dictionary.setValue(self.qrCode, forKey: "qrCode")
		dictionary.setValue(self.profilePic, forKey: "profilePic")
		dictionary.setValue(self.firstName, forKey: "firstName")
		dictionary.setValue(self.lastName, forKey: "lastName")
		dictionary.setValue(self.mobile, forKey: "mobile")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.hasCall, forKey: "hasCall")
		dictionary.setValue(self.hasSMS, forKey: "hasSMS")
		dictionary.setValue(self.hasEmail, forKey: "hasEmail")
		dictionary.setValue(self.answer1, forKey: "answer1")
		dictionary.setValue(self.answer2, forKey: "answer2")
		dictionary.setValue(self.minPrice, forKey: "minPrice")
		dictionary.setValue(self.maxPrice, forKey: "maxPrice")
		dictionary.setValue(self.bedrooms, forKey: "bedrooms")
		dictionary.setValue(self.bathrooms, forKey: "bathrooms")
		dictionary.setValue(self.cars, forKey: "cars")
		dictionary.setValue(self.aboutMe, forKey: "aboutMe")
		dictionary.setValue(self.preApprovedFinance, forKey: "preApprovedFinance")

		return dictionary
	}

}
