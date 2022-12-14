
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_BuiltCommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::chan_utils::BuiltCommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_BuiltCommitmentTransactionDecodeErrorZ = Bindings.Result_BuiltCommitmentTransactionDecodeErrorZ

			extension Bindings {

				/// A CResult_BuiltCommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::BuiltCommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_BuiltCommitmentTransactionDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_BuiltCommitmentTransactionDecodeErrorZ?

					internal init(cType: LDKCResult_BuiltCommitmentTransactionDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_BuiltCommitmentTransactionDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_BuiltCommitmentTransactionDecodeErrorZ in the success state.
					public class func initWithOk(o: BuiltCommitmentTransaction) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BuiltCommitmentTransactionDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BuiltCommitmentTransactionDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_BuiltCommitmentTransactionDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BuiltCommitmentTransactionDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BuiltCommitmentTransactionDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_BuiltCommitmentTransactionDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BuiltCommitmentTransactionDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_BuiltCommitmentTransactionDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_BuiltCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_BuiltCommitmentTransactionDecodeErrorZ>) in
				CResult_BuiltCommitmentTransactionDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BuiltCommitmentTransactionDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> BuiltCommitmentTransaction? {
						if self.cType?.result_ok == true {
							return BuiltCommitmentTransaction(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_BuiltCommitmentTransactionDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_BuiltCommitmentTransactionDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_BuiltCommitmentTransactionDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		