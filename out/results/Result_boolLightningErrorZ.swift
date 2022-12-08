
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_boolLightningErrorZ = Bindings.Result_boolLightningErrorZ

			extension Bindings {

				/// A CResult_boolLightningErrorZ represents the result of a fallible operation,
				/// containing a bool on success and a crate::lightning::ln::msgs::LightningError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_boolLightningErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_boolLightningErrorZ?

					public init(cType: LDKCResult_boolLightningErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_boolLightningErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_boolLightningErrorZ in the success state.
					public init(o: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_boolLightningErrorZ_ok(o)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_boolLightningErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_boolLightningErrorZ in the error state.
					public init(e: LightningError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_boolLightningErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_boolLightningErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_boolLightningErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_boolLightningErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_boolLightningErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_boolLightningErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_boolLightningErrorZ>) in
				CResult_boolLightningErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_boolLightningErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> LightningError? {
						if self.cType?.result_ok == false {
							return LightningError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> Bool? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					

					internal func dangle() -> Result_boolLightningErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		