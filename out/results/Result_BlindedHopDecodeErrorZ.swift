
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_BlindedHopDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::onion_message::blinded_route::BlindedHop on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_BlindedHopDecodeErrorZ = Bindings.Result_BlindedHopDecodeErrorZ

			extension Bindings {

				/// A CResult_BlindedHopDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::onion_message::blinded_route::BlindedHop on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_BlindedHopDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_BlindedHopDecodeErrorZ?

					public init(cType: LDKCResult_BlindedHopDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_BlindedHopDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_BlindedHopDecodeErrorZ in the success state.
					@available(*, deprecated, message: "This method passes the following non-cloneable, but freeable objects by value: `o`.")
					public class func initWithOk(o: BlindedHop) -> Result_BlindedHopDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedHopDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedHopDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_BlindedHopDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_BlindedHopDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedHopDecodeErrorZ_err(e.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedHopDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_BlindedHopDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedHopDecodeErrorZ_free(self.cType!)

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
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					
					public func getValue() -> BlindedHop? {
						if self.cType?.result_ok == true {
							return BlindedHop(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_BlindedHopDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		