

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class UserDataModel {
	public var userId : Int?
    public var agentId : Int?
    public var buyerId : Int?
	public var firstName : String?
	public var lastName : String?
	public var profilePic : String?
	public var agency : String?
	public var mobile : String?
	public var email : String?
	public var accessToken : String?
	public var isProfileSetUp : Bool?

    public class func modelsFromDictionaryArray(array:NSArray) -> [UserDataModel]{
        var models:[UserDataModel] = []
        for item in array
        {
            models.append(UserDataModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }


	required public init?(dictionary: NSDictionary) {

		userId = dictionary["userId"] as? Int
        agentId = dictionary["agentId"] as? Int
		firstName = dictionary["firstName"] as? String
		lastName = dictionary["lastName"] as? String
		profilePic = dictionary["profilePic"] as? String
		agency = dictionary["agency"] as? String
		mobile = dictionary["mobile"] as? String
		email = dictionary["email"] as? String
		accessToken = dictionary["accessToken"] as? String
		isProfileSetUp = dictionary["isProfileSetUp"] as? Bool
        buyerId  = dictionary["buyerId"] as? Int
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.userId, forKey: "userId")
        dictionary.setValue(self.agentId, forKey: "agentId")
		dictionary.setValue(self.firstName, forKey: "firstName")
		dictionary.setValue(self.lastName, forKey: "lastName")
		dictionary.setValue(self.profilePic, forKey: "profilePic")
		dictionary.setValue(self.agency, forKey: "agency")
		dictionary.setValue(self.mobile, forKey: "mobile")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.accessToken, forKey: "accessToken")
		dictionary.setValue(self.isProfileSetUp, forKey: "isProfileSetUp")
        dictionary.setValue(self.buyerId, forKey: "buyerId")
		return dictionary
	}
    
    
    func saveDictionary(){
        var dictionary: [String: Any] = [:]
        dictionary["accessToken"] = accessToken
        dictionary["userId"] = userId
        dictionary["agentId"] = agentId
        dictionary["email"] = email
        dictionary["buyerId"] = buyerId
        dictionary["firstName"] = firstName
        dictionary["lastName"] = lastName
        dictionary["profilePic"] = profilePic
        dictionary["agency"] = agency
        dictionary["mobile"] = mobile
        dictionary["isProfileSetUp"] = isProfileSetUp
        UserDefaults.standard.setValue(dictionary, forKey: Keys.currentUserData)
        print("checkuser_Default_store\(UserDefaults.standard.object(forKey: Keys.currentUserData))")
    }
}
