
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_BlindedRouteDecodeErrorZ = Bindings.Result_BlindedRouteDecodeErrorZ

			extension Bindings {

				/// A CResult_BlindedRouteDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::onion_message::blinded_route::BlindedRoute on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_BlindedRouteDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_BlindedRouteDecodeErrorZ?

					public init(cType: LDKCResult_BlindedRouteDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_BlindedRouteDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_BlindedRouteDecodeErrorZ in the success state.
					public init(o: BlindedRoute) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedRouteDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_BlindedRouteDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_BlindedRouteDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedRouteDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_BlindedRouteDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_BlindedRouteDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedRouteDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> BlindedRoute? {
						if self.cType?.result_ok == true {
							return BlindedRoute(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_BlindedRouteDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		