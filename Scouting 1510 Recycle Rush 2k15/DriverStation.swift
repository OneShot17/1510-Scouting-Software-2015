//
//  DriverStation.swift
//  Scouting 1510 Recycle Rush 2k15
//
//  Created by Stephen Brimhall on 3/27/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Foundation

enum DriverStation {
	case Red1
	case Red2
	case Red3
	case Blue1
	case Blue2
	case Blue3
	
	static func fromString(str : String) -> DriverStation! {
		switch str {
			case "Red 1":
				return Red1;
			case "Red 2":
				return Red2;
			case "Red 3":
				return Red3;
			case "Blue 1":
				return Blue1;
			case "Blue 2":
				return Blue2;
			case "Blue 3":
				return Blue3;
			default:
				return nil;
		}
	}
}