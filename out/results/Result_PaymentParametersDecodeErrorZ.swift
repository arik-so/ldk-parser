
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PaymentParametersDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::routing::router::PaymentParameters on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PaymentParametersDecodeErrorZ = Bindings.Result_PaymentParametersDecodeErrorZ

			extension Bindings {

				/// A CResult_PaymentParametersDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::routing::router::PaymentParameters on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentParametersDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentParametersDecodeErrorZ?

					public init(cType: LDKCResult_PaymentParametersDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_PaymentParametersDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentParametersDecodeErrorZ in the success state.
					public class func initWithOk(o: PaymentParameters) -> Result_PaymentParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentParametersDecodeErrorZ_ok(o.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentParametersDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentParametersDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_PaymentParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentParametersDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentParametersDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PaymentParametersDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentParametersDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentParametersDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentParametersDecodeErrorZ>) in
				CResult_PaymentParametersDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentParametersDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> PaymentParameters? {
						if self.cType?.result_ok == true {
							return PaymentParameters(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_PaymentParametersDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		