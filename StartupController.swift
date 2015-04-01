//
//  StartupController.swift
//  Scouting 1510 Recycle Rush 2k15
//
//  Created by Stephen Brimhall on 3/27/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Cocoa
import Foundation

class StartupController : NSViewController {
	
	@IBOutlet weak var allianceStation: NSPopUpButtonCell!
	@IBOutlet weak var confirmButton: NSButtonCell!
	var makeNew = false;
	
	@IBAction func allianceChanged(sender: NSPopUpButton) {
		if allianceStation.stringValue != "" {
			confirmButton.enabled = true;
		}
	}
	
	@IBAction func confirmPressed(sender: NSButton) {
		Globals.driverStation = DriverStation.fromString(allianceStation.stringValue);
		Globals.createNew = makeNew;
		self.view.window!.close();
	}
	
	@IBAction func saveStateChanged(sender: AnyObject) {
		makeNew = !makeNew
	}
	
}