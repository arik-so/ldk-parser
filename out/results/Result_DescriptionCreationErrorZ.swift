
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_DescriptionCreationErrorZ = Bindings.Result_DescriptionCreationErrorZ

			extension Bindings {

				/// A CResult_DescriptionCreationErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::Description on success and a crate::lightning_invoice::CreationError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_DescriptionCreationErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_DescriptionCreationErrorZ?

					public init(cType: LDKCResult_DescriptionCreationErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_DescriptionCreationErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_DescriptionCreationErrorZ in the success state.
					public init(o: Description) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_DescriptionCreationErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_DescriptionCreationErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_DescriptionCreationErrorZ in the error state.
					public init(e: CreationError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_DescriptionCreationErrorZ_err(e.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_DescriptionCreationErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_DescriptionCreationErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_DescriptionCreationErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_DescriptionCreationErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_DescriptionCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_DescriptionCreationErrorZ>) in
				CResult_DescriptionCreationErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_DescriptionCreationErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> CreationError? {
						if self.cType?.result_ok == false {
							return CreationError(value: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> Description? {
						if self.cType?.result_ok == true {
							return Description(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_DescriptionCreationErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		