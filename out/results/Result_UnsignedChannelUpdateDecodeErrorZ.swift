
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_UnsignedChannelUpdateDecodeErrorZ = Bindings.Result_UnsignedChannelUpdateDecodeErrorZ

			extension Bindings {

				/// A CResult_UnsignedChannelUpdateDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::UnsignedChannelUpdate on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_UnsignedChannelUpdateDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_UnsignedChannelUpdateDecodeErrorZ?

					public init(cType: LDKCResult_UnsignedChannelUpdateDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_UnsignedChannelUpdateDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_UnsignedChannelUpdateDecodeErrorZ in the success state.
					public init(o: UnsignedChannelUpdate) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_UnsignedChannelUpdateDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelUpdateDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_UnsignedChannelUpdateDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_UnsignedChannelUpdateDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelUpdateDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_UnsignedChannelUpdateDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_UnsignedChannelUpdateDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_UnsignedChannelUpdateDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_UnsignedChannelUpdateDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_UnsignedChannelUpdateDecodeErrorZ>) in
			CResult_UnsignedChannelUpdateDecodeErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelUpdateDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> UnsignedChannelUpdate? {
						if self.cType?.result_ok == true {
							return UnsignedChannelUpdate(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_UnsignedChannelUpdateDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		