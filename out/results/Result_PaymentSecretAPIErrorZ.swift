
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_PaymentSecretAPIErrorZ = Bindings.Result_PaymentSecretAPIErrorZ

			extension Bindings {

				/// A CResult_PaymentSecretAPIErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::util::errors::APIError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentSecretAPIErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentSecretAPIErrorZ?

					public init(pointer: LDKCResult_PaymentSecretAPIErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_PaymentSecretAPIErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentSecretAPIErrorZ in the success state.
					public init(o: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentSecretAPIErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretAPIErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_PaymentSecretAPIErrorZ in the error state.
					public init(e: APIError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentSecretAPIErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretAPIErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_PaymentSecretAPIErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentSecretAPIErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_PaymentSecretAPIErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentSecretAPIErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentSecretAPIErrorZ>) in
			CResult_PaymentSecretAPIErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretAPIErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> APIError? {
						if self.cType?.result_ok == false {
							return APIError(pointer: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return ThirtyTwoBytes(pointer: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_PaymentSecretAPIErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		