
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_PaymentPreimageAPIErrorZ = Bindings.Result_PaymentPreimageAPIErrorZ

			extension Bindings {

				/// A CResult_PaymentPreimageAPIErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::util::errors::APIError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentPreimageAPIErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentPreimageAPIErrorZ?

					public init(pointer: LDKCResult_PaymentPreimageAPIErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_PaymentPreimageAPIErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentPreimageAPIErrorZ in the success state.
					public init(o: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentPreimageAPIErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentPreimageAPIErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_PaymentPreimageAPIErrorZ in the error state.
					public init(e: APIError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentPreimageAPIErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentPreimageAPIErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_PaymentPreimageAPIErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentPreimageAPIErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_PaymentPreimageAPIErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentPreimageAPIErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentPreimageAPIErrorZ>) in
			CResult_PaymentPreimageAPIErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentPreimageAPIErrorZ(pointer: nativeCallResult)

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

					internal func dangle() -> Result_PaymentPreimageAPIErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		