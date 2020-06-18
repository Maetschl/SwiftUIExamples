//
//  User+CoreDataProperties.swift
//  CoreDataSwitUI
//
//  Created by Julian Arias Maetschl on 17-06-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//
//

import Foundation
import Combine
import CoreData
import UIKit


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var id: UUID?

    var wrappedImage: UIImage { UIImage(data: image ?? Data()) ?? UIImage.placeholder }
    var wrappedName: String { name ?? "unknown" }
    var wrappedId: UUID { id ?? UUID() }

}


extension UIImage {
    var toJpegCompressionData: Data? {
        jpegData(compressionQuality: 0.5)
    }
    static var placeholder: UIImage {
        UIImage(
            systemName: "person.crop.circle",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 100, weight: .regular)
        )!
    }
}
