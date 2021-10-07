

import Foundation
import Resolver
import SwiftUI

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { SavedMinutesViewModel() }
        register { LoginViewModel()}
        register {TimerViewModel()}
    }
}
