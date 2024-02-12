
import Foundation
 
public class GetUserDataModel {
	public var buyerId : Int?
//    public var agentId : Int?
	public var profilePic : String?
	public var firstName : String?
	public var lastName : String?
	public var mobile : String?
	public var email : String?
    public var qrCode : String?
    public var propertyList = [Int]()

    
    public class func modelsFromDictionaryArray(array:NSArray) -> [GetUserDataModel]
    {
        var models:[GetUserDataModel] = []
        for item in array
        {
            models.append(GetUserDataModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		buyerId = dictionary["buyerId"] as? Int
//        buyerId = dictionary["agentId"] as? Int
		profilePic = dictionary["profilePic"] as? String
		firstName = dictionary["firstName"] as? String
		lastName = dictionary["lastName"] as? String
		mobile = dictionary["mobile"] as? String
		email = dictionary["email"] as? String
        qrCode = dictionary["qrCode"] as? String
        propertyList = (dictionary["propertyList"] as? Array ?? [0])
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.buyerId, forKey: "buyerId")
//        dictionary.setValue(self.buyerId, forKey: "agentId")
		dictionary.setValue(self.profilePic, forKey: "profilePic")
		dictionary.setValue(self.firstName, forKey: "firstName")
		dictionary.setValue(self.lastName, forKey: "lastName")
		dictionary.setValue(self.mobile, forKey: "mobile")
		dictionary.setValue(self.email, forKey: "email")
        dictionary.setValue(self.qrCode, forKey: "qrCode")
        dictionary.setValue(self.propertyList, forKey: "propertyList")

		return dictionary
	}

}
