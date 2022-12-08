
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias WriteableScore = Bindings.WriteableScore

			extension Bindings {

				/// Refers to a scorer that is accessible under lock and also writeable to disk
				/// 
				/// We need this trait to be able to pass in a scorer to `lightning-background-processor` that will enable us to
				/// use the Persister to persist it.
				open class WriteableScore: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKWriteableScore?

					public init(cType: LDKWriteableScore) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKWriteableScore, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(LockableScore: LockableScore) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
							let instance: WriteableScore = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "WriteableScore::writeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.write()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_u8Z(array: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: WriteableScore = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "WriteableScore::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKWriteableScore(							
							this_arg: thisArg,
							LockableScore: LockableScore.activate().cType!,
							write: writeLambda,
							free: freeLambda
						)
					}

					
					/// Serialize the object into a byte array
					open func write() -> [UInt8] {
						Bindings.print("Error: WriteableScore::write MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: WriteableScore::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					
					/// Implementation of LockableScore for this object.
					public func getLockableScore() -> LockableScore {
						// return value (do some wrapping)
						let returnValue = NativelyImplementedLockableScore(cType: self.cType!.LockableScore, anchor: self)

						return returnValue;
					}
		

					internal func dangle() -> WriteableScore {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing WriteableScore \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing WriteableScore \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedWriteableScore: WriteableScore {
					
					/// Serialize the object into a byte array
					public override func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.write(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		