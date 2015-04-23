//
//  AppDelegate.swift
//  Scouting 1510 Recycle Rush 2k15
//
//  Created by Stephen Brimhall on 3/27/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Cocoa
import Foundation
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	
	
	func applicationDidFinishLaunching(aNotification: NSNotification) {
		Globals.save.connect(save);
	}
	
	func applicationWillTerminate(aNotification: NSNotification) {
	}
	
	@IBAction func open(sender: AnyObject) {
		/*
		let openDialog = NSOpenPanel();
		openDialog.directoryURL = NSURL(fileURLWithPath: "/Users/\(NSUserName())");
		openDialog.canChooseFiles = true;
		openDialog.canChooseDirectories = false;
		openDialog.allowedFileTypes = ["pkg"];
		openDialog.beginWithCompletionHandler() { (result: Int) -> () in
		if result == NSFileHandlingPanelOKButton {
		Globals.URL = openDialog.URL!;
		}
		}
		*/
		
		let openDialog = NSOpenPanel();
		openDialog.directoryURL = NSURL(fileURLWithPath: "/Users/\(NSUserName())");
		openDialog.canChooseFiles = true;
		openDialog.canChooseDirectories = false;
		openDialog.allowedFileTypes = ["csv","matches"];
		openDialog.beginWithCompletionHandler() { (result: Int) -> () in
			if result == NSFileHandlingPanelOKButton {
				Globals.URL = openDialog.URL!;
			}
		}
	}
	
	func save() {
		/*
		if let url = Globals.URL {
		for match in Globals.matches {
		var file : FileOut;
		if (NSFileManager.defaultManager().fileExistsAtPath(url.path!)) {
		NSFileManager.defaultManager().createFileAtPath(url.path!+"/\(match.team).match",contents: nil, attributes: nil);
		file = FileOut(filename: url.path!+"/\(match.team).match", mode: IOFlags.append);
		} else {
		file = FileOut(filename: url.path!+"/\(match.team).match", mode: IOFlags.replace);
		}
		file.write(match.toString());
		}
		Globals.matches.removeAll(keepCapacity: false);
		} else {
		let saveDialog = NSSavePanel();
		saveDialog.directoryURL = NSURL(fileURLWithPath: "/Users/\(NSUserName())");
		saveDialog.allowedFileTypes = ["pkg"];
		saveDialog.canCreateDirectories = false;
		saveDialog.prompt = "Save";
		saveDialog.message = "Choose where you want to create the event package to store the matches.";
		saveDialog.beginWithCompletionHandler() { (result: Int) -> Void in
		if result == NSFileHandlingPanelOKButton {
		NSFileManager.defaultManager().createDirectoryAtURL(saveDialog.URL!, withIntermediateDirectories: false, attributes: nil, error: nil);
		Globals.URL = saveDialog.URL!;
		for match in Globals.matches {
		NSFileManager.defaultManager().createFileAtPath(saveDialog.URL!.path!+"/\(match.team).match",contents: (match.toString() as NSString).dataUsingEncoding(NSUTF8StringEncoding), attributes: nil);
		Globals.matches.removeAll(keepCapacity: false);
		}
		}
		}
		}
		*/
		
		if let url = Globals.URL {
			let file = FileOut(filename: url.path!, mode: IOFlags.append);
			for match in Globals.matches {
				file.write(match.toCSV());
				file.write("\n");
				Globals.matches.removeAll();
			}
		} else {
			let saveDialog = NSSavePanel();
			saveDialog.directoryURL = NSURL(fileURLWithPath: "/Users/\(NSUserName())");
			saveDialog.allowedFileTypes = ["csv","matches"];
			saveDialog.canCreateDirectories = true;
			saveDialog.prompt = "Save";
			saveDialog.beginWithCompletionHandler() { (result : Int) -> Void in
				if result == NSFileHandlingPanelOKButton {
					NSFileManager.defaultManager().createFileAtPath(saveDialog.URL!.path!,contents: nil, attributes: nil);
					let file = FileOut(filename: saveDialog.URL!.path!, mode: IOFlags.append);
					file.write(Match.csvHeader());
					file.write("\n");
					for match in Globals.matches {
						file.write(match.toCSV());
						file.write("\n");
					}
					Globals.URL = saveDialog.URL!;
					Globals.matches.removeAll();
				}
			}
		}
	}
}

