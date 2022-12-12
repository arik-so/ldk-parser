
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::C2Tuple_BlockHashChannelMonitorZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ = Bindings.Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ

			extension Bindings {

				/// A CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_BlockHashChannelMonitorZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ?

					public init(cType: LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ in the success state.
					public class func initWithOk(o: ([UInt8], ChannelMonitor)) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
						// native call variable prep
						
						let oTuple = Tuple_BlockHashChannelMonitorZ(tuple: o).danglingClone()
				

						// native method call
						let nativeCallResult = CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ_ok(oTuple.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ>) in
				CResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					
					public func getValue() -> ([UInt8], ChannelMonitor)? {
						if self.cType?.result_ok == true {
							return Tuple_BlockHashChannelMonitorZ(cType: self.cType!.contents.result.pointee).dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		