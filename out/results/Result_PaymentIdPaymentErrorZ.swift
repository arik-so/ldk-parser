
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PaymentIdPaymentErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning_invoice::payment::PaymentError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PaymentIdPaymentErrorZ = Bindings.Result_PaymentIdPaymentErrorZ

			extension Bindings {

				/// A CResult_PaymentIdPaymentErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning_invoice::payment::PaymentError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentIdPaymentErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentIdPaymentErrorZ?

					public init(cType: LDKCResult_PaymentIdPaymentErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_PaymentIdPaymentErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentIdPaymentErrorZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_PaymentIdPaymentErrorZ {
						// native call variable prep
						
						let oPrimitiveWrapper = ThirtyTwoBytes(value: o)
				

						// native method call
						let nativeCallResult = CResult_PaymentIdPaymentErrorZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentIdPaymentErrorZ in the error state.
					public class func initWithErr(e: PaymentError) -> Result_PaymentIdPaymentErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentIdPaymentErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PaymentIdPaymentErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentIdPaymentErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentIdPaymentErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentIdPaymentErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentIdPaymentErrorZ>) in
				CResult_PaymentIdPaymentErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> PaymentError? {
						if self.cType?.result_ok == false {
							return PaymentError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return ThirtyTwoBytes(cType: self.cType!.contents.result.pointee).dangle().dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_PaymentIdPaymentErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		