
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_BlindedRouteNoneZ represents the result of a fallible operation,
			/// containing a crate::lightning::onion_message::blinded_route::BlindedRoute on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_BlindedRouteNoneZ = Bindings.Result_BlindedRouteNoneZ

			extension Bindings {

				/// A CResult_BlindedRouteNoneZ represents the result of a fallible operation,
				/// containing a crate::lightning::onion_message::blinded_route::BlindedRoute on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_BlindedRouteNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_BlindedRouteNoneZ?

					public init(cType: LDKCResult_BlindedRouteNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_BlindedRouteNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_BlindedRouteNoneZ in the success state.
					public class func initWithOk(o: BlindedRoute) -> Result_BlindedRouteNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedRouteNoneZ_ok(o.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedRouteNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_BlindedRouteNoneZ in the error state.
					public class func initWithErr() -> Result_BlindedRouteNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedRouteNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedRouteNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_BlindedRouteNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedRouteNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					/*
					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}
					*/

					
					public func getValue() -> BlindedRoute? {
						if self.cType?.result_ok == true {
							return BlindedRoute(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_BlindedRouteNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		