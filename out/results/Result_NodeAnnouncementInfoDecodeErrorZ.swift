
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NodeAnnouncementInfoDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::routing::gossip::NodeAnnouncementInfo on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NodeAnnouncementInfoDecodeErrorZ = Bindings.Result_NodeAnnouncementInfoDecodeErrorZ

			extension Bindings {

				/// A CResult_NodeAnnouncementInfoDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::routing::gossip::NodeAnnouncementInfo on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NodeAnnouncementInfoDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NodeAnnouncementInfoDecodeErrorZ?

					public init(cType: LDKCResult_NodeAnnouncementInfoDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_NodeAnnouncementInfoDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NodeAnnouncementInfoDecodeErrorZ in the success state.
					public class func initWithOk(o: NodeAnnouncementInfo) -> Result_NodeAnnouncementInfoDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NodeAnnouncementInfoDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NodeAnnouncementInfoDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_NodeAnnouncementInfoDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_NodeAnnouncementInfoDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NodeAnnouncementInfoDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NodeAnnouncementInfoDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_NodeAnnouncementInfoDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NodeAnnouncementInfoDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_NodeAnnouncementInfoDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NodeAnnouncementInfoDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NodeAnnouncementInfoDecodeErrorZ>) in
				CResult_NodeAnnouncementInfoDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NodeAnnouncementInfoDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> NodeAnnouncementInfo? {
						if self.cType?.result_ok == true {
							return NodeAnnouncementInfo(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle() -> Result_NodeAnnouncementInfoDecodeErrorZ {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Result_NodeAnnouncementInfoDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_NodeAnnouncementInfoDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_NodeAnnouncementInfoDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		