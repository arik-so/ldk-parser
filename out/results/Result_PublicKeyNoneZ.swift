
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_PublicKeyNoneZ = Bindings.Result_PublicKeyNoneZ

			extension Bindings {

				/// A CResult_PublicKeyNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::PublicKey on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PublicKeyNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PublicKeyNoneZ?

					public init(cType: LDKCResult_PublicKeyNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_PublicKeyNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PublicKeyNoneZ in the success state.
					public init(o: [UInt8]) {
						// native call variable prep
						
						let oPrimitiveWrapper = PublicKey(value: o)
				

						// native method call
						let nativeCallResult = CResult_PublicKeyNoneZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PublicKeyNoneZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_PublicKeyNoneZ in the error state.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PublicKeyNoneZ_err()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PublicKeyNoneZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_PublicKeyNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PublicKeyNoneZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_PublicKeyNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PublicKeyNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PublicKeyNoneZ>) in
				CResult_PublicKeyNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PublicKeyNoneZ(cType: nativeCallResult)

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
							return PublicKey(cType: self.cType!.contents.result.pointee).getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_PublicKeyNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		