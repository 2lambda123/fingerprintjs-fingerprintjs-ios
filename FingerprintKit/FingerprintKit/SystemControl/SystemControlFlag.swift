//
//  SystemControlFlag.swift
//  FingerprintKit
//
//  Created by Petr Palata on 08.03.2022.
//

import Foundation

enum SystemControlFlag {
    // MARK: Device HW Information
    case hardwareModel
    case hardwareMachine
    
    // MARK: OS/Kernel Information
    case osType
    case osRelease
    case osVersion
    case kernelVersion
    
    var sysctlFlags: [Int32] {
        switch self {
        case .hardwareMachine:
            return [CTL_HW, HW_MACHINE]
        case .hardwareModel:
            return [CTL_HW, HW_MODEL]
        case .osRelease:
            return [CTL_KERN, KERN_OSRELEASE]
        case .osType:
            return [CTL_KERN, KERN_OSTYPE]
        case .osVersion:
            return [CTL_KERN, KERN_OSVERSION]
        case .kernelVersion:
            return [CTL_KERN, KERN_VERSION]
        }
    }
}
