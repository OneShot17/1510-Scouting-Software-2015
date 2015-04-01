//
//  Match.swift
//  Scouting 1510 Recycle Rush 2k15
//
//  Created by Stephen Brimhall on 3/27/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Foundation

class Match {
	let team : Int;
	var endInAuto = false;
	var autoTotes = 0;
	var autoBins = 0;
	var teleStacks = 0;
	var teleTotesPerStackAvg = 0.0;
	var teleTotes = 0;
	var teleBins = 0;
	var teleBinMaxHeight = 0;
	var teleNoodles = 0;
	var usesFeederStation = false;
	var usesLandfill = false;
	
	init (_ team : Int) {
		self.team = team;
	}
	
	func toCSV() -> String {
		var output: String = "";
		
		output += team + ",";
		output += endInAuto.toString() + ",";
		output += autoTotes + ",";
		output += autoBins + ",";
		output += teleStacks + ",";
		output += teleTotesPerStackAvg + ",";
		output += teleTotes + ",";
		output += teleBins + ",";
		output += teleBinMaxHeight + ",";
		output += teleNoodles + ",";
		output += usesFeederStation.toString() + ",";
		output += usesLandfill.toString();
		
		return output;
	}
	
	class func csvHeader() -> String {
		return "Team,End in Autonomous,Yellow Auto Totes,Auto Bins,Stacks in Teleop,Average Teleop stack size,Totes stacked in Teleop,Bins placed in Teleop,Highest stack height,Litter scored,Uses feeder station,Uses landfill";
	}
	
	func toString() -> String {
		return toCSV();
	}
}