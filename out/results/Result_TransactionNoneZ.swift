
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_TransactionNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::Transaction on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_TransactionNoneZ = Bindings.Result_TransactionNoneZ

			extension Bindings {

				/// A CResult_TransactionNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::Transaction on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_TransactionNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_TransactionNoneZ?

					public init(cType: LDKCResult_TransactionNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_TransactionNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_TransactionNoneZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_TransactionNoneZ {
						// native call variable prep
						
						let oPrimitiveWrapper = Transaction(value: o).dangle()
				
						oPrimitiveWrapper.cType!.data_is_owned = false
					

						// native method call
						let nativeCallResult = CResult_TransactionNoneZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TransactionNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_TransactionNoneZ in the error state.
					public class func initWithErr() -> Result_TransactionNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TransactionNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TransactionNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_TransactionNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TransactionNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_TransactionNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_TransactionNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_TransactionNoneZ>) in
				CResult_TransactionNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TransactionNoneZ(cType: nativeCallResult)
						

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
							return Transaction(cType: self.cType!.contents.result.pointee).dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_TransactionNoneZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		