
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Integer in the range `0..32`
			internal typealias u5 = Bindings.u5

			extension Bindings {

				/// Integer in the range `0..32`
				internal class u5: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKu5?

					public init(cType: LDKu5) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKu5, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: UInt8) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKu5(_0: value)

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> UInt8 {
						return self.cType!._0
					}

					internal func dangle() -> u5 {
        				self.dangling = true
						return self
					}

										

				}

			}
		