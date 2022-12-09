
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_CommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::chan_utils::CommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_CommitmentTransactionDecodeErrorZ = Bindings.Result_CommitmentTransactionDecodeErrorZ

			extension Bindings {

				/// A CResult_CommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::CommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CommitmentTransactionDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CommitmentTransactionDecodeErrorZ?

					public init(cType: LDKCResult_CommitmentTransactionDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_CommitmentTransactionDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CommitmentTransactionDecodeErrorZ in the success state.
					public class func initWithOk(o: CommitmentTransaction) -> Result_CommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CommitmentTransactionDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CommitmentTransactionDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Creates a new CResult_CommitmentTransactionDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_CommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CommitmentTransactionDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CommitmentTransactionDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Frees any resources used by the CResult_CommitmentTransactionDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CommitmentTransactionDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_CommitmentTransactionDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CommitmentTransactionDecodeErrorZ>) in
				CResult_CommitmentTransactionDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CommitmentTransactionDecodeErrorZ(cType: nativeCallResult)

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
					

					
					public func getValue() -> CommitmentTransaction? {
						if self.cType?.result_ok == true {
							return CommitmentTransaction(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_CommitmentTransactionDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		