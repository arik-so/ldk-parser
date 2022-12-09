
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NoneLightningErrorZ represents the result of a fallible operation,
			/// containing a () on success and a crate::lightning::ln::msgs::LightningError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NoneLightningErrorZ = Bindings.Result_NoneLightningErrorZ

			extension Bindings {

				/// A CResult_NoneLightningErrorZ represents the result of a fallible operation,
				/// containing a () on success and a crate::lightning::ln::msgs::LightningError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NoneLightningErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NoneLightningErrorZ?

					public init(cType: LDKCResult_NoneLightningErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_NoneLightningErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NoneLightningErrorZ in the success state.
					public class func initWithOk() -> Result_NoneLightningErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneLightningErrorZ_ok()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneLightningErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Creates a new CResult_NoneLightningErrorZ in the error state.
					public class func initWithErr(e: LightningError) -> Result_NoneLightningErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneLightningErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneLightningErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Frees any resources used by the CResult_NoneLightningErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NoneLightningErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_NoneLightningErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NoneLightningErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NoneLightningErrorZ>) in
				CResult_NoneLightningErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneLightningErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> LightningError? {
						if self.cType?.result_ok == false {
							return LightningError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
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

					internal func dangle() -> Result_NoneLightningErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		