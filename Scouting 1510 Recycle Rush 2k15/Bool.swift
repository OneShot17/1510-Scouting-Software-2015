//
//  Bool.swift
//  1510 Scouting System 2015
//
//  Adds a toString method that returns the bool value in terms of a string, because I've been having issues with that.
//
//  Created by Stephen Brimhall on 3/31/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Foundation

extension Bool {
	func toString() -> String {
		switch self {
		case true:
			return "TRUE";
		case false:
			return "FALSE";
		default:
			return "MIXED";
		}
	}
}