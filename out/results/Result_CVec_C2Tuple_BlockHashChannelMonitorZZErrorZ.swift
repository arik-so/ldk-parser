
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ = Bindings.Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ

			extension Bindings {

				/// A CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::CVec_C2Tuple_BlockHashChannelMonitorZZ on success and a crate::c_types::IOError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ?

					public init(cType: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ in the success state.
					public init(o: [([UInt8], ChannelMonitor)]) {
						// native call variable prep
						
						let oVector = Vec_C2Tuple_BlockHashChannelMonitorZZ(array: o)
				

						// native method call
						let nativeCallResult = CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_ok(oVector.cType!)

						// cleanup
						
						// oVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ in the error state.
					public init(e: IOError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_err(e.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ>) in
				CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> IOError? {
						if self.cType?.result_ok == false {
							return IOError(value: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> [([UInt8], ChannelMonitor)]? {
						if self.cType?.result_ok == true {
							return Vec_C2Tuple_BlockHashChannelMonitorZZ(cType: self.cType!.contents.result.pointee).getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		