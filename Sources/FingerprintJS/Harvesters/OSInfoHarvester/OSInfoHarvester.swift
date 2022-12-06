//
//  OSInfoHarvester.swift
//  FingerprintJS
//
//  Created by Petr Palata on 11.03.2022.
//

import Foundation

protocol OSInfoHarvesting {
    var osTimeZoneIdentifier: String { get }

    var osBuild: String { get }

    var osVersion: String { get }

    var osType: String { get }

    var osRelease: String { get }

    var kernelVersion: String { get }
}

struct OSInfoHarvester {
    private let systemControl: SystemControlValuesProviding
    private let timeZoneInfoProvider: TimeZoneInfoProvidable

    init(
        systemControl: SystemControlValuesProviding = SystemControl(),
        timeZoneInfoProvider: TimeZoneInfoProvidable = TimeZone.current
    ) {
        self.systemControl = systemControl
        self.timeZoneInfoProvider = timeZoneInfoProvider
    }
}

extension OSInfoHarvester: OSInfoHarvesting {
    var osTimeZoneIdentifier: String {
        timeZoneInfoProvider.identifier
    }

    var osType: String {
        return systemControl.osType ?? "Undefined"
    }

    var osVersion: String {
        return systemControl.osVersion ?? "Undefined"
    }

    var osRelease: String {
        return systemControl.osRelease ?? "Undefined"
    }

    var kernelVersion: String {
        return systemControl.kernelVersion ?? "Undefined"
    }

    var osBuild: String {
        guard let osBuild = systemControl.osBuild else {
            return "Undefined"
        }
        return "\(osBuild)"
    }
}