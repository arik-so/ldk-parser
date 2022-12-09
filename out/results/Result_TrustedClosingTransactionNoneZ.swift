
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_TrustedClosingTransactionNoneZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::chan_utils::TrustedClosingTransaction on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_TrustedClosingTransactionNoneZ = Bindings.Result_TrustedClosingTransactionNoneZ

			extension Bindings {

				/// A CResult_TrustedClosingTransactionNoneZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::TrustedClosingTransaction on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_TrustedClosingTransactionNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_TrustedClosingTransactionNoneZ?

					public init(cType: LDKCResult_TrustedClosingTransactionNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_TrustedClosingTransactionNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_TrustedClosingTransactionNoneZ in the success state.
					@available(*, deprecated, message: "This method passes the following non-cloneable, but freeable objects by value: `o`.")
					public class func initWithOk(o: TrustedClosingTransaction) -> Result_TrustedClosingTransactionNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TrustedClosingTransactionNoneZ_ok(o.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TrustedClosingTransactionNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_TrustedClosingTransactionNoneZ in the error state.
					public class func initWithErr() -> Result_TrustedClosingTransactionNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TrustedClosingTransactionNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TrustedClosingTransactionNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_TrustedClosingTransactionNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TrustedClosingTransactionNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					/*
					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}
					*/

					
					public func getValue() -> TrustedClosingTransaction? {
						if self.cType?.result_ok == true {
							return TrustedClosingTransaction(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_TrustedClosingTransactionNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		