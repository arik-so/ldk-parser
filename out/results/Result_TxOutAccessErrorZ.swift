
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_TxOutAccessErrorZ = Bindings.Result_TxOutAccessErrorZ

			extension Bindings {

				/// A CResult_TxOutAccessErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::TxOut on success and a crate::lightning::chain::AccessError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_TxOutAccessErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_TxOutAccessErrorZ?

					public init(pointer: LDKCResult_TxOutAccessErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_TxOutAccessErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_TxOutAccessErrorZ in the success state.
					public init(o: TxOut) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TxOutAccessErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_TxOutAccessErrorZ in the error state.
					public init(e: AccessError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TxOutAccessErrorZ_err(e.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_TxOutAccessErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TxOutAccessErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_TxOutAccessErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_TxOutAccessErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_TxOutAccessErrorZ>) in
			CResult_TxOutAccessErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> AccessError? {
						if self.cType?.result_ok == false {
							return AccessError(value: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> TxOut? {
						if self.cType?.result_ok == true {
							return TxOut(pointer: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_TxOutAccessErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		