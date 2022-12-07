
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_GossipTimestampFilterDecodeErrorZ = Bindings.Result_GossipTimestampFilterDecodeErrorZ

			extension Bindings {

				/// A CResult_GossipTimestampFilterDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::GossipTimestampFilter on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_GossipTimestampFilterDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_GossipTimestampFilterDecodeErrorZ?

					public init(cType: LDKCResult_GossipTimestampFilterDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_GossipTimestampFilterDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_GossipTimestampFilterDecodeErrorZ in the success state.
					public init(o: GossipTimestampFilter) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_GossipTimestampFilterDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_GossipTimestampFilterDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_GossipTimestampFilterDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_GossipTimestampFilterDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_GossipTimestampFilterDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_GossipTimestampFilterDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_GossipTimestampFilterDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_GossipTimestampFilterDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_GossipTimestampFilterDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_GossipTimestampFilterDecodeErrorZ>) in
			CResult_GossipTimestampFilterDecodeErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_GossipTimestampFilterDecodeErrorZ(cType: nativeCallResult)

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

					public func getValue() -> GossipTimestampFilter? {
						if self.cType?.result_ok == true {
							return GossipTimestampFilter(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_GossipTimestampFilterDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		