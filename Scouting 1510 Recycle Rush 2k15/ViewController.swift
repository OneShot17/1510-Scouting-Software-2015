//
//  ViewController.swift
//  Scouting 1510 Recycle Rush 2k15
//
//  Created by Stephen Brimhall on 3/27/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Cocoa
import Foundation
import FileIO

class ViewController: NSViewController {
	
	override func viewDidAppear() {
		super.viewDidAppear();
	}
	
	///////////////
	// Variables //
	///////////////
	
	// Team number
	@IBOutlet weak var teamNumber: NSTextFieldCell!
	
	// Autonomous
	@IBOutlet weak var endedInZone: NSButtonCell!
	@IBOutlet weak var autoTotes: NSTextFieldCell!
	@IBOutlet weak var autoBins: NSTextFieldCell!
	var endInAuto = false;
	
	// Teleop
	@IBOutlet weak var teleTotes: NSTextFieldCell!
	@IBOutlet weak var teleStacks: NSTextFieldCell!
	@IBOutlet weak var teleBins: NSTextFieldCell!
	@IBOutlet weak var usesFeeder: NSButtonCell!
	@IBOutlet weak var usesLandfill: NSButtonCell!
	@IBOutlet weak var teleLitter: NSTextFieldCell!
	@IBOutlet weak var maxBinHeight: NSTextFieldCell!
	var usesFeederValue = false;
	var usesLandfillValue = false;
	
	
	/////////////
	// Methods //
	/////////////
	
	// Autonomous
	@IBAction func autoTotesPlus(sender: AnyObject) {
		autoTotes.integerValue++;
	}
	@IBAction func autoTotesMinus(sender: AnyObject) {
		autoTotes.integerValue--;
	}
	@IBAction func autoBinsPlus(sender: AnyObject) {
		autoBins.integerValue++;
	}
	@IBAction func autoBinsMinus(sender: AnyObject) {
		autoBins.integerValue--;
	}
	@IBAction func autoChanged(sender: AnyObject) {
		endInAuto = !endInAuto;
		
	}
	
	// Teleop
	@IBAction func teleTotesPlus(sender: AnyObject) {
		teleTotes.integerValue++;
	}
	@IBAction func teleTotesMinus(sender: AnyObject) {
		teleTotes.integerValue--;
	}
	@IBAction func teleStacksPlus(sender: AnyObject) {
		teleStacks.integerValue++;
	}
	@IBAction func teleStacksMinus(sender: AnyObject) {
		teleStacks.integerValue--;
	}
	@IBAction func teleBinsPlus(sender: AnyObject) {
		teleBins.integerValue++;
	}
	@IBAction func teleBinsMinus(sender: AnyObject) {
		teleBins.integerValue--;
	}
	@IBAction func teleLitterPlus(sender: AnyObject) {
		teleLitter.integerValue++;
	}
	@IBAction func teleLitterMinus(sender: AnyObject) {
		teleLitter.integerValue--;
	}
	@IBAction func usesStationChanged(sender: AnyObject) {
		usesFeederValue = !usesFeederValue;
	}
	@IBAction func usesLandfillChanged(sender: AnyObject) {
		usesLandfillValue = !usesLandfillValue;
	}
	@IBAction func maxBinPlus(sender: AnyObject) {
		maxBinHeight.integerValue++;
	}
	@IBAction func maxBinMinus(sender: AnyObject) {
		maxBinHeight.integerValue--;
	}
	
	// Save
	@IBAction func save(sender: AnyObject) {
		var match = Match(teamNumber.integerValue);
		match.autoTotes = autoTotes.integerValue;
		match.autoBins = autoBins.integerValue;
		match.teleBins = teleBins.integerValue;
		match.teleTotes = teleTotes.integerValue;
		match.teleNoodles = teleLitter.integerValue;
		match.teleTotesPerStackAvg = teleTotes.doubleValue / teleStacks.doubleValue;
		match.teleStacks = teleStacks.integerValue;
		match.teleBinMaxHeight = maxBinHeight.integerValue;
		match.endInAuto = endInAuto;
		match.usesFeederStation = usesFeederValue;
		match.usesLandfill = usesLandfillValue;
		Globals.matches.append(match);
		Globals.save.fire();
		autoTotes.integerValue = 0;
		autoBins.integerValue = 0;
		teleBins.integerValue = 0;
		teleTotes.integerValue = 0;
		teleLitter.integerValue = 0;
		teleStacks.integerValue = 0;
		maxBinHeight.integerValue = 0;
		teamNumber.stringValue = "";
	}
	
	
}

