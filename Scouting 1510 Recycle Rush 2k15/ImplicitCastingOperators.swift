//
//  ImplicitCastingOperators.swift
//  1510 Scouting System 2015
//
//  Created by Stephen Brimhall on 3/30/15.
//  Copyright (c) 2015 Stephen Brimhall. All rights reserved.
//

import Foundation

func + (left: Int, right: String) -> String {
	return "\(left)\(right)";
}

func + (left: String, right: Int) -> String {
	return "\(left)\(right)";
}

func + (left: Double, right: String) -> String {
	return "\(left)\(right)";
}

func + (left: String, right: Double) -> String {
	return "\(left)\(right)";
}

func + (left: Bool, right: String) -> String {
	return left.toString()+right;
}

func += (inout left: String, right: Bool) {
	left = left + right.toString();
}

public typealias void = Void;