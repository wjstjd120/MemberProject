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
    
    func creatMemberNickName(member: MemberModel) {
        let newMember = Member(context: context)
        newMember.id = member.id
        newMember.password = member.password
        newMember.name = member.name
        newMember.nickName = member.nickName
        do {
            try context.save()
            print("저장 성공")
        } catch {
            print("에러: \(error.localizedDescription)")
        }
    }
    
    func selectMember(id: String) -> Member? {
        do {
            let request = Member.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", id)
            let member = try context.fetch(request).first
            
            return member
        } catch {
            return nil
        }
    }
    
    func deleteMember(id: String){
        let request = Member.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        do{
            let result = try self.context.fetch(request)
            for data in result as [NSManagedObject]{
                self.context.delete(data)
            }
            try self.context.save()
            print("삭제 성공")
        }catch{
            print("삭제 실패")
        }
    }

}

struct MemberModel {
    let id: String
    let password: String
    let nickName: String
    let name: String
}
