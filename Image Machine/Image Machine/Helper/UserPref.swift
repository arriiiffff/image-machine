//
//  UserPref.swift
//  Image Machine
//
//  Created by Muhammad Arif on 23/09/21.
//

import Foundation

public struct UserPref {
    public static var keyMachineData = "machineData"
    
    static let pref = UserDefaults.standard
    
    public static func saveObject(key: String ,value: AnyObject){
        var data: Data?
        if #available(iOS 11.0, *) {
            data = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false)
        } else {
            // Fallback on earlier versions
            data = NSKeyedArchiver.archivedData(withRootObject: value)
        }
        pref.set(data, forKey: key)
        commit()
    }
    
    public static func saveBool(key: String, value: Bool){
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveInt(key: String, value: Int) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveDouble(key: String, value: Double) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveString(key:String, value: String) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveArray(key: String, value: [Any]) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func commit(){
        pref.synchronize()
    }
    
    public static func remove(key:String) {
        pref.removeObject(forKey: key)
    }
    
    public static func getObject(key:String)->AnyObject?{
        if let data = pref.object(forKey: key) as? NSData {
            let obj = NSKeyedUnarchiver.unarchiveObject(with: data as Data)!
            return obj as AnyObject?
        }
        return nil
    }
    
    public static func getString(key:String) -> String{
        if let string = pref.string(forKey: key) {
            return string
        }
        return ""
    }
    
    public static func getBool(key:String) -> Bool {
        if pref.bool(forKey: key) {
            return pref.bool(forKey: key)
        }
        return false
    }
    
    public static func getInt(key:String) -> Int {
        return pref.integer(forKey: key)
    }
    
    public static func getDouble(key:String) -> Double {
        return pref.double(forKey: key)
    }
    
    public static func getArray(key:String) -> [Any] {
        if let dict = pref.array(forKey: key) {
            return dict
        }
        return []
    }
    
}
