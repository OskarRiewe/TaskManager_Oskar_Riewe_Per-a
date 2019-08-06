//
//  Task.swift
//  TaskManager_Oskar_Riewe_Perła
//
//  Created by Oskar Riewe-Perla on 05/08/2019.
//  Copyright © 2019 Oskar Riewe-Perla. All rights reserved.
//

import UIKit

class Task {

    var Title: String
    var Description: String
    var Done: Bool
    
    init(Title title:String, Description description:String, isDone done:Bool) {
        self.Title = title
        self.Description = description
        self.Done = done
    }

}
