import Foundation

// MARK: - Manager
class SaveManager {
    
    // MARK: Singleton
    
    private static let instance = SaveManager()
    
    class func sharedInstance () -> SaveManager {
        return instance
    }
    
    // MARK: Manager
    
    func save(object: AnyObject, key: String) {
        standard().set(object, forKey: key)
        sync()
    }
    
    func get(key: String) -> String? {
        return standard().string(forKey: key)
    }
    
    func delete(key: String) {
        standard().removeObject(forKey: key)
        sync()
    }
    
    // MARK: Helpers
    
    func standard() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func sync() {
        standard().synchronize()
    }
}
