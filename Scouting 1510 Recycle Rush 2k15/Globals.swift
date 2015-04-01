//
//  Globals.swift
//  Scouting 1510 Recycle Rush 2k15
//
//  Created by Stephen Brimhall on 3/27/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Foundation

/// Contains all global variables
struct Globals {
	/// The list of matches that will be exported in the scouting sheet
	static var matches = [Match]();
	/// The alliance station of the team being watched
	static var driverStation: DriverStation! = nil;
	/// No longer used
	static var createNew = false;
	/// The current save file URL being used
	static var URL : NSURL? = nil;
	/// Save event
	static var save = ESEvent();
}