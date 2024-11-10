//
//  MemberCoreDataManager.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//
import CoreData
import UIKit

class MemberCoreDataManager {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func selectMemberNickName(id: String) -> Member? {
        do {
            let request = Member.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", id)
            let member = try context.fetch(request).first
            
            return member
        } catch {
            return nil
        }
    }
}
