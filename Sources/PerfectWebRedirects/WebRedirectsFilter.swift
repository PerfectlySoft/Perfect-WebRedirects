//
//  Perfect_WebRedirects.swift
//  Perfect WebRedirects
//
//  Created by Jonathan Guthrie on 2017-02-01.
//	Copyright (C) 2017 PerfectlySoft, Inc.
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

import PerfectHTTP


public class WebRedirectsFilter: HTTPRequestFilter {

	public func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {

		if RedirectsConfig.standardRules.isEmpty && RedirectsConfig.wildcardRules.isEmpty {
			RedirectsConfig.load()
		}

		var doRedirect = false
		var to: RedirectsConfig.Sub = RedirectsConfig.Sub()

		if let r = RedirectsConfig.standardRules[request.path] {
			doRedirect = true
			to = r as RedirectsConfig.Sub
		} else {

			// check if covered by a wildcard
			for (key, value) in RedirectsConfig.wildcardRules {
        if request.path.starts(with: key.split(separator: "*")[0]) {
					doRedirect = true
					to = value as RedirectsConfig.Sub
          if to.destination.hasSuffix("*") {
						var dest = to.destination
            dest.removeLast(1)
						dest += request.path.split(separator: "/").last ?? ""
						to.destination = dest
					}
				}
			}
		}

		if doRedirect {
			response.status = HTTPResponseStatus.statusFrom(code: to.code)
			response.setHeader(.location, value: to.destination)
			response.completed()

		}

		// End. Continue
		callback(HTTPRequestFilterResult.continue(request, response))
	}

	/// Wrapper enabling PerfectHTTP 2.1 filter support
	public static func filterAPIRequest(data: [String:Any]) throws -> HTTPRequestFilter {
		return WebRedirectsFilter()
	}
	
}
