
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_CVec_u8ZPeerHandleErrorZ = Bindings.Result_CVec_u8ZPeerHandleErrorZ

			extension Bindings {

				/// A CResult_CVec_u8ZPeerHandleErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::CVec_u8Z on success and a crate::lightning::ln::peer_handler::PeerHandleError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CVec_u8ZPeerHandleErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CVec_u8ZPeerHandleErrorZ?

					public init(cType: LDKCResult_CVec_u8ZPeerHandleErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_CVec_u8ZPeerHandleErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CVec_u8ZPeerHandleErrorZ in the success state.
					public init(o: [UInt8]) {
						// native call variable prep
						
						let oVector = Vec_u8Z(array: o)
				

						// native method call
						let nativeCallResult = CResult_CVec_u8ZPeerHandleErrorZ_ok(oVector.cType!)

						// cleanup
						
						// oVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_CVec_u8ZPeerHandleErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_CVec_u8ZPeerHandleErrorZ in the error state.
					public init(e: PeerHandleError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_u8ZPeerHandleErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CVec_u8ZPeerHandleErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_CVec_u8ZPeerHandleErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_u8ZPeerHandleErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_CVec_u8ZPeerHandleErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CVec_u8ZPeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CVec_u8ZPeerHandleErrorZ>) in
				CResult_CVec_u8ZPeerHandleErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CVec_u8ZPeerHandleErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> PeerHandleError? {
						if self.cType?.result_ok == false {
							return PeerHandleError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return Vec_u8Z(cType: self.cType!.contents.result.pointee).getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_CVec_u8ZPeerHandleErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		