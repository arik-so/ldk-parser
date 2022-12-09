
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentSecretZ on success and a crate::lightning::util::errors::APIError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ = Bindings.Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ

			extension Bindings {

				/// A CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentSecretZ on success and a crate::lightning::util::errors::APIError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ?

					public init(cType: LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ in the success state.
					public init(o: ([UInt8], [UInt8])) {
						// native call variable prep
						
						let oTuple = Tuple_PaymentHashPaymentSecretZ(tuple: o)
				

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_ok(oTuple.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ in the error state.
					public init(e: APIError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ>) in
				CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> APIError? {
						if self.cType?.result_ok == false {
							return APIError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					
					public func getValue() -> ([UInt8], [UInt8])? {
						if self.cType?.result_ok == true {
							return Tuple_PaymentHashPaymentSecretZ(cType: self.cType!.contents.result.pointee).dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		