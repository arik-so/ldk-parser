
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NoneSendErrorZ represents the result of a fallible operation,
			/// containing a () on success and a crate::lightning::onion_message::messenger::SendError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NoneSendErrorZ = Bindings.Result_NoneSendErrorZ

			extension Bindings {

				/// A CResult_NoneSendErrorZ represents the result of a fallible operation,
				/// containing a () on success and a crate::lightning::onion_message::messenger::SendError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NoneSendErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NoneSendErrorZ?

					public init(cType: LDKCResult_NoneSendErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_NoneSendErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NoneSendErrorZ in the success state.
					public class func initWithOk() -> Result_NoneSendErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneSendErrorZ_ok()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NoneSendErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_NoneSendErrorZ in the error state.
					public class func initWithErr(e: SendError) -> Result_NoneSendErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneSendErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NoneSendErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_NoneSendErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneSendErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> SendError? {
						if self.cType?.result_ok == false {
							return SendError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					/*
					public func getValue() -> Void? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					*/

					internal func dangle() -> Result_NoneSendErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		