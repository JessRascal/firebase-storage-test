//
//  DataService.swift
//  firebase-storage-test
//
//  Created by Jess Rascal on 06/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import Foundation
import Firebase

let FIRE_REF = FIRDatabase.database().reference()
let FIRE_STORAGE_REF = FIRStorage.storage().reference(forURL: "gs://fir-storage-test-d0754.appspot.com")

class DataService {
    static let ds = DataService()
}
