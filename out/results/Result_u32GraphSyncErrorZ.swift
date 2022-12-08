
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_u32GraphSyncErrorZ = Bindings.Result_u32GraphSyncErrorZ

			extension Bindings {

				/// A CResult_u32GraphSyncErrorZ represents the result of a fallible operation,
				/// containing a u32 on success and a crate::lightning_rapid_gossip_sync::error::GraphSyncError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_u32GraphSyncErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_u32GraphSyncErrorZ?

					public init(cType: LDKCResult_u32GraphSyncErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_u32GraphSyncErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_u32GraphSyncErrorZ in the success state.
					public init(o: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_u32GraphSyncErrorZ_ok(o)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_u32GraphSyncErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_u32GraphSyncErrorZ in the error state.
					public init(e: GraphSyncError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_u32GraphSyncErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_u32GraphSyncErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_u32GraphSyncErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_u32GraphSyncErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> GraphSyncError? {
						if self.cType?.result_ok == false {
							return GraphSyncError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> UInt32? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					

					internal func dangle() -> Result_u32GraphSyncErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		