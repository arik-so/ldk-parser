
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_TrustedCommitmentTransactionNoneZ = Bindings.Result_TrustedCommitmentTransactionNoneZ

			extension Bindings {

				/// A CResult_TrustedCommitmentTransactionNoneZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::TrustedCommitmentTransaction on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_TrustedCommitmentTransactionNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_TrustedCommitmentTransactionNoneZ?

					public init(pointer: LDKCResult_TrustedCommitmentTransactionNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_TrustedCommitmentTransactionNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_TrustedCommitmentTransactionNoneZ in the success state.
					public init(o: TrustedCommitmentTransaction) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TrustedCommitmentTransactionNoneZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_TrustedCommitmentTransactionNoneZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_TrustedCommitmentTransactionNoneZ in the error state.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TrustedCommitmentTransactionNoneZ_err()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_TrustedCommitmentTransactionNoneZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_TrustedCommitmentTransactionNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TrustedCommitmentTransactionNoneZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}

					public func getValue() -> TrustedCommitmentTransaction? {
						if self.cType?.result_ok == true {
							return TrustedCommitmentTransaction(pointer: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_TrustedCommitmentTransactionNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		