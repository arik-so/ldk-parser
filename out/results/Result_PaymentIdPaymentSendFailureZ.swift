
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PaymentIdPaymentSendFailureZ represents the result of a fallible operation,
			/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::ln::channelmanager::PaymentSendFailure on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PaymentIdPaymentSendFailureZ = Bindings.Result_PaymentIdPaymentSendFailureZ

			extension Bindings {

				/// A CResult_PaymentIdPaymentSendFailureZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::ln::channelmanager::PaymentSendFailure on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentIdPaymentSendFailureZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentIdPaymentSendFailureZ?

					public init(cType: LDKCResult_PaymentIdPaymentSendFailureZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_PaymentIdPaymentSendFailureZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentIdPaymentSendFailureZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
						// native call variable prep
						
						let oPrimitiveWrapper = ThirtyTwoBytes(value: o)
				

						// native method call
						let nativeCallResult = CResult_PaymentIdPaymentSendFailureZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentSendFailureZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentIdPaymentSendFailureZ in the error state.
					public class func initWithErr(e: PaymentSendFailure) -> Result_PaymentIdPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentIdPaymentSendFailureZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentSendFailureZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PaymentIdPaymentSendFailureZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentIdPaymentSendFailureZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentIdPaymentSendFailureZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentIdPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentIdPaymentSendFailureZ>) in
				CResult_PaymentIdPaymentSendFailureZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentSendFailureZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> PaymentSendFailure? {
						if self.cType?.result_ok == false {
							return PaymentSendFailure(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return ThirtyTwoBytes(cType: self.cType!.contents.result.pointee, anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_PaymentIdPaymentSendFailureZ {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Result_PaymentIdPaymentSendFailureZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_PaymentIdPaymentSendFailureZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentIdPaymentSendFailureZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		