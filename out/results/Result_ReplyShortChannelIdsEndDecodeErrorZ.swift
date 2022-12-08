
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_ReplyShortChannelIdsEndDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::ReplyShortChannelIdsEnd on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_ReplyShortChannelIdsEndDecodeErrorZ = Bindings.Result_ReplyShortChannelIdsEndDecodeErrorZ

			extension Bindings {

				/// A CResult_ReplyShortChannelIdsEndDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::ReplyShortChannelIdsEnd on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ReplyShortChannelIdsEndDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ?

					public init(cType: LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ReplyShortChannelIdsEndDecodeErrorZ in the success state.
					public init(o: ReplyShortChannelIdsEnd) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ReplyShortChannelIdsEndDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ReplyShortChannelIdsEndDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_ReplyShortChannelIdsEndDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ReplyShortChannelIdsEndDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ReplyShortChannelIdsEndDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_ReplyShortChannelIdsEndDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ReplyShortChannelIdsEndDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_ReplyShortChannelIdsEndDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ>) in
				CResult_ReplyShortChannelIdsEndDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ReplyShortChannelIdsEndDecodeErrorZ(cType: nativeCallResult)

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
					

					
					public func getValue() -> ReplyShortChannelIdsEnd? {
						if self.cType?.result_ok == true {
							return ReplyShortChannelIdsEnd(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}
					

					internal func dangle() -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		