# Perfect Web Redirects

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

## Perfect Web Redirects Demo

The Perfect WebRedirects module will filter for specified routes (including trailing wildcard routes) and perform redirects as instructed if a match is found.

A demo showing the usage, and working of the Perfect WebRedirects module can be found at [https://github.com/PerfectExamples/Perfect-WebRedirects-Demo](https://github.com/PerfectExamples/Perfect-WebRedirects-Demo).

## Including in your project

Import the dependency into your project by specifying it in your project's Package.swift file, or adding it via Perfect Assistant.

``` swift
.Package(url: "https://github.com/PerfectlySoft/Perfect-WebRedirects", majorVersion: 1),
```

Then in your `main.swift` file where you configure your web server, add it as an import, and add the filter:

``` swift
import PerfectWebRedirects
```

Adding the filter:

``` swift
// Add to the "filters" section of the config:
[
	"type":"request",
	"priority":"high",
	"name":WebRedirectsFilter.filterAPIRequest,
]
```

If you are also adding Request Logger filters, if the Web Redirects object is added second, directly after the RequestLogger filter, then both the original request (and it's associated redirect code) and the new request, will be logged correctly.

## Configuration file

The configuration for the routes is included in JSON files at `/config/redirect-rules/*.json` in the form:

```
{

  "/test/no": {
	"code": 302,
	"destination": "/test/yes"
  },

	"/test/no301": {
		"code": 301,
		"destination": "/test/yes"
  },
  
	"/test/wild/*": {
		"code": 302,
		"destination": "/test/wildyes"
  },

	"/test/wilder/*": {
		"code": 302,
		"destination": "/test/wilding/*"
  }

}
```

Note that multiple JSON files can exist in this directory - all will be loaded the first time the filter is invoked.

## Compatibility with Swift

The master branch of this project currently compiles with **Xcode 8.2** or the **Swift 3.0.2** toolchain on Ubuntu.


## Issues

We are transitioning to using JIRA for all bugs and support related issues, therefore the GitHub issues has been disabled.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)



## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
