//
//  EggType.swift
//  EggChallenge
//
//  Created by Yasin Akbaş on 27.12.2019.
//  Copyright © 2019 Yasin Akbaş. All rights reserved.
//

public enum EggType: CaseIterable {
    case soft,normal,hard
    
    static var items: [String] {
        return ["soft","normal","hard"]
    }
}


