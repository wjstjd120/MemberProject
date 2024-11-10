//
//  Member+CoreDataClass.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//
//

import Foundation
import CoreData

@objc(Member)
public class Member: NSManagedObject {
    public static let className = "Member"
    public enum Key {
      static let id = "id"
      static let password = "password"
      static let nickName = "nickName"
      static let name = "name"
    }
}
