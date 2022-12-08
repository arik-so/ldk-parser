
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NonePeerHandleErrorZ represents the result of a fallible operation,
			/// containing a () on success and a crate::lightning::ln::peer_handler::PeerHandleError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NonePeerHandleErrorZ = Bindings.Result_NonePeerHandleErrorZ

			extension Bindings {

				/// A CResult_NonePeerHandleErrorZ represents the result of a fallible operation,
				/// containing a () on success and a crate::lightning::ln::peer_handler::PeerHandleError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NonePeerHandleErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NonePeerHandleErrorZ?

					public init(cType: LDKCResult_NonePeerHandleErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_NonePeerHandleErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NonePeerHandleErrorZ in the success state.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NonePeerHandleErrorZ_ok()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NonePeerHandleErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_NonePeerHandleErrorZ in the error state.
					public init(e: PeerHandleError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NonePeerHandleErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NonePeerHandleErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_NonePeerHandleErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NonePeerHandleErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_NonePeerHandleErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NonePeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NonePeerHandleErrorZ>) in
				CResult_NonePeerHandleErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NonePeerHandleErrorZ(cType: nativeCallResult)

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
					

					/*
					public func getValue() -> Void? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					*/

					internal func dangle() -> Result_NonePeerHandleErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		