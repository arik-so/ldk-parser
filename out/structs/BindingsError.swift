
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias BindingsError = Bindings.BindingsError

			extension Bindings {
		

				/// Sub-errors which don't have specific information in them use this type.
				public class BindingsError: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKError?

					public init(pointer: LDKError) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKError, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					

					
					/// Zero-Sized_types aren't consistent across Rust/C/C++, so we add some size here
					public func getDummy() -> UInt8 {
						// return value (do some wrapping)
						let returnValue = self.cType!._dummy

						return returnValue;
					}
		

					internal func dangle() -> BindingsError {
						self.dangling = true
						return self
					}

										

				}

				
			}
		
		