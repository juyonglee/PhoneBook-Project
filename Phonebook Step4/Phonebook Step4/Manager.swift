//
//  Manager.swift
//  Phonebook Step4
//
//  Created by JuYong Lee.
//  Copyright © 2018 JuYong Lee. All rights reserved.
//

import Foundation

class Manager {
    //  전화번호를 관리하는 PhoneInfo 배열
    var phoneInfos:Array<PhoneInfo> = []
    
    //  PhoneInfo 저장 기능
    func createPhoneInfoObject(contactInfo:Dictionary<String, String>) -> Void {
        switch contactInfo["case"]! {
        case "1":
            self.phoneInfos.append(PhoneInfo(name: contactInfo["name"]!, phoneNumber: contactInfo["phoneNum"]!))
        case "2":
            self.phoneInfos.append(PhoneUnivInfo(name: contactInfo["name"]!, phoneNumber: contactInfo["phoneNum"]!, major: contactInfo["major"]!, year: Int(contactInfo["grade"]!)!))
        case "3":
            self.phoneInfos.append(PhoneCompanyInfo(name: contactInfo["name"]!, phoneNumber: contactInfo["phoneNum"]!, company: contactInfo["company"]!))
        default:
            print("Default Never Used!")
        }

    }
    //  PhoneInfo 검색 기능
    func searchPhoneInfo(name:String) -> (Int, Bool) {
        var index:Int = 0
        for phoneInfo in self.phoneInfos {
            if phoneInfo.name == name {
                phoneInfo.printPhoneInfo()
                return (index, true)
            }
            index += 1
        }
        return (-1, false)
    }
    //  PhoneInfo 삭제 기능
    func removePhoneInfo(name:String) -> Bool {
        let searchResult = searchPhoneInfo(name: name)
        if searchResult.1 {
            phoneInfos.remove(at: searchResult.0)
            return true
        } else {
            print("입력하신 연락처가 존재하지 않습니다.")
            print("**************************\n")
            return false
        }
    }
}
