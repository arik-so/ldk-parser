
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_RecoverableSignatureNoneZ = Bindings.Result_RecoverableSignatureNoneZ

			extension Bindings {

				/// A CResult_RecoverableSignatureNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::RecoverableSignature on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_RecoverableSignatureNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_RecoverableSignatureNoneZ?

					public init(cType: LDKCResult_RecoverableSignatureNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_RecoverableSignatureNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_RecoverableSignatureNoneZ in the success state.
					public init(o: [UInt8]) {
						// native call variable prep
						
						let oPrimitiveWrapper = RecoverableSignature(value: o)
				

						// native method call
						let nativeCallResult = CResult_RecoverableSignatureNoneZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_RecoverableSignatureNoneZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_RecoverableSignatureNoneZ in the error state.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RecoverableSignatureNoneZ_err()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_RecoverableSignatureNoneZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_RecoverableSignatureNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RecoverableSignatureNoneZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_RecoverableSignatureNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_RecoverableSignatureNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_RecoverableSignatureNoneZ>) in
				CResult_RecoverableSignatureNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_RecoverableSignatureNoneZ(cType: nativeCallResult)

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

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return RecoverableSignature(cType: self.cType!.contents.result.pointee).getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_RecoverableSignatureNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		