
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_InFlightHtlcsDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning_invoice::payment::InFlightHtlcs on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_InFlightHtlcsDecodeErrorZ = Bindings.Result_InFlightHtlcsDecodeErrorZ

			extension Bindings {

				/// A CResult_InFlightHtlcsDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::payment::InFlightHtlcs on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_InFlightHtlcsDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_InFlightHtlcsDecodeErrorZ?

					public init(cType: LDKCResult_InFlightHtlcsDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_InFlightHtlcsDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_InFlightHtlcsDecodeErrorZ in the success state.
					@available(*, deprecated, message: "This method passes the following non-cloneable, but freeable objects by value: `o`.")
					public class func initWithOk(o: InFlightHtlcs) -> Result_InFlightHtlcsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InFlightHtlcsDecodeErrorZ_ok(o.dangle().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InFlightHtlcsDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_InFlightHtlcsDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_InFlightHtlcsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InFlightHtlcsDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InFlightHtlcsDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_InFlightHtlcsDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InFlightHtlcsDecodeErrorZ_free(self.cType!)

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
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> InFlightHtlcs? {
						if self.cType?.result_ok == true {
							return InFlightHtlcs(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_InFlightHtlcsDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_InFlightHtlcsDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_InFlightHtlcsDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		