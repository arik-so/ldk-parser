
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_WriteableScoreZ = Bindings.Option_WriteableScoreZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::routing::scoring::WriteableScore or not
				internal class Option_WriteableScoreZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_WriteableScoreZ?

					public init(cType: LDKCOption_WriteableScoreZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCOption_WriteableScoreZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: WriteableScore?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_WriteableScoreZ_some(some.activate().cType!)
						} else {
							self.cType = COption_WriteableScoreZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the crate::lightning::routing::scoring::WriteableScore, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_WriteableScoreZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> WriteableScore? {
						if self.cType!.tag == LDKCOption_WriteableScoreZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_WriteableScoreZ_Some {
							return NativelyImplementedWriteableScore(cType: self.cType!.some, anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle() -> Option_WriteableScoreZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_WriteableScoreZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_WriteableScoreZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		