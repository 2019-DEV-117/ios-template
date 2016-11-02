//
//  BuildType.swift
//  {{ cookiecutter.project_name }}
//
//  Created by {{ cookiecutter.lead_dev }} on 11/1/16.
//  Copyright © 2016 {{ cookiecutter.company_name }}. All rights reserved.
//

import Foundation

/// A representation of the current build type, driven by -D compiler flags.
/// These compiler flags are configured in the Config specific `.xcconfig` file.
enum BuildType {

    /// Debug build (-D DEBUG)
    case Debug

    /// Internal build, configured as release but not for App Store submission (-D RZINTERNAL)
    case Internal

    /// App store Release build, no flags
    case Release

    /// Whether or not this build type is the active build type.
    var active: Bool {
        switch self {
        case .Debug:
            #if DEBUG
                return true
            #else
                return false
            #endif
        case .Internal:
            #if RZINTERNAL
                return true
            #else
                return false
            #endif
        case .Release:
            return !BuildType.Debug.active && !BuildType.Internal.active
        }
    }

}
