//
//  HelperTool.swift
//  com.davidwernhart.Helper
//
//  Created by David Wernhart on 13.02.20.
//  Copyright © 2020 David Wernhart. All rights reserved.
//

import Foundation

final class HelperTool: NSObject, HelperToolProtocol {
    
    static let instance = HelperTool()
    
    var modifiedKeys: [String: UInt8] = [:]
    
    func getVersion(withReply reply: (String) -> Void) {
//        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString" as String) as? String ?? "(unknown version)"
//        let build = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? "(unknown build)"
//        reply("v\(version) (\(build))")
        reply(helperVersion)

    }

    func setSMCByte(key: String, value: UInt8) {
        do {
            try SMCKit.open()
        } catch {
            print(error)
            exit(EX_UNAVAILABLE)
        }
        let smcKey = SMCKit.getKey(key, type: DataTypes.UInt8)
        let bytes: SMCBytes = (value, UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
        UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
        UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
        UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
        UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
        UInt8(0), UInt8(0))
        
        if(self.modifiedKeys[key] == nil){
            readSMCByte(key: key) { (originalValue) in
                self.modifiedKeys[key] = originalValue
                _ = try? SMCKit.writeData(smcKey, data: bytes)
            }
        }
        else{
            _ = try? SMCKit.writeData(smcKey, data: bytes)
        }

        
    }

    func readSMCByte(key: String, withReply reply: @escaping (UInt8) -> Void) {
        do {
            try SMCKit.open()
        } catch {
            print(error)
            exit(EX_UNAVAILABLE)
        }

        let smcKey = SMCKit.getKey(key, type: DataTypes.UInt8)
        do {
            let status = try SMCKit.readData(smcKey).0
            reply(status)
        } catch {
            reply(0)
        }
    }
    
    func readSMCUInt32(key: String, withReply reply: @escaping (UInt32) -> Void) {
        do {
            try SMCKit.open()
        } catch {
            print(error)
            exit(EX_UNAVAILABLE)
        }

        let smcKey = SMCKit.getKey(key, type: DataTypes.UInt32)
        do {
            let data = try SMCKit.readData(smcKey)
            reply(UInt32(fromBytes: (data.0, data.1, data.2, data.3)))
        } catch {
            reply(0)
        }
    }
    
    func reset(){
        for (key, value) in modifiedKeys{
            setSMCByte(key: key, value: value)
        }
        modifiedKeys.removeAll()
    }
}
