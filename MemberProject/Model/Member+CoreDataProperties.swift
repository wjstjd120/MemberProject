//
//  Member+CoreDataProperties.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//
//

import Foundation
import CoreData


extension Member {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Member> {
        return NSFetchRequest<Member>(entityName: "Member")
    }

    @NSManaged public var id: String?
    @NSManaged public var password: String?
    @NSManaged public var nickName: String?
    @NSManaged public var name: String?

}

extension Member : Identifiable {

}
