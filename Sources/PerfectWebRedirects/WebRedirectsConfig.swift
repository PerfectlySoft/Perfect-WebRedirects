//
//  Config.swift
//  Perfect-WebRedirects
//
//  Created by Jonathan Guthrie on 2017-02-01.
//
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2017 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectLogger
import Foundation

public struct RedirectsConfig {

	// Rules engine
	static var standardRules = [String: Sub]()
	static var wildcardRules = [String: Sub]()

	/// Where should the rules engine find the config file
	public static var rulesDir = "./config/redirect-rules/"

	/// If this is true, the redirects filter will run
	/// If false, it will be skipped even if configured to run in server config
	public static var active = true

	// Once config has been read in, this will be true.
	// Not designed to be user-settable
	var loaded = false

	public init() {}

	struct Sub {
		var code = 302
		var destination = "/"
		init(_ c: Int, _ d: String){
			code = c
			destination = d
		}
		init(){}
	}

	static func load(){
		let d = Dir(RedirectsConfig.rulesDir)
		if !d.exists {
			LogFile.critical("Error loading rules: \(RedirectsConfig.rulesDir) does not exist.")
			return
		}

		do {

			try d.forEachEntry(closure: {
				n in
        if n.hasSuffix(".json") {
					let thisFile = File("\(RedirectsConfig.rulesDir)\(n)")
					do {
						try thisFile.open(.read, permissions: .readUser)
						defer { thisFile.close() }
						let txt = try thisFile.readString()
						let rules = try txt.jsonDecode() as! Dictionary<String, Any>
						for i in rules {
							let ii = i.value as! [String: Any]
							if let c = ii["code"], let d = ii["destination"] {
								let s = Sub(c as! Int, d as! String)
                if i.key.hasSuffix("*") {
									RedirectsConfig.wildcardRules[i.key] = s
								} else {
									RedirectsConfig.standardRules[i.key] = s
								}
							}
						}
					} catch {
						print("Error reading rules file: \(error)")
					}
				}
			})
		} catch {
			LogFile.critical("Error loading rules: \(error)")
		}
	}
}
