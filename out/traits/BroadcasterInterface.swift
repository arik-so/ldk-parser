
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias BroadcasterInterface = Bindings.BroadcasterInterface

			extension Bindings {

				/// An interface to send a transaction to the Bitcoin network.
				open class BroadcasterInterface: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBroadcasterInterface?

					public init(cType: LDKBroadcasterInterface) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKBroadcasterInterface, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func broadcastTransactionLambda(this_arg: UnsafeRawPointer?, tx: LDKTransaction) -> Void {
							let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BroadcasterInterface::broadcastTransactionLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.broadcastTransaction(tx: Transaction(cType: tx).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BroadcasterInterface::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKBroadcasterInterface(							
							this_arg: thisArg,
							broadcast_transaction: broadcastTransactionLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Sends a transaction out to (hopefully) be mined.
					open func broadcastTransaction(tx: [UInt8]) -> Void {
						Bindings.print("Error: BroadcasterInterface::broadcastTransaction MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: BroadcasterInterface::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BroadcasterInterface_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> BroadcasterInterface {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing BroadcasterInterface \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BroadcasterInterface \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedBroadcasterInterface: BroadcasterInterface {
					
					/// Sends a transaction out to (hopefully) be mined.
					override func broadcastTransaction(tx: [UInt8]) {
						// native call variable prep
						
						let txPrimitiveWrapper = Transaction(value: tx)
				

						// native method call
						let nativeCallResult = self.cType!.broadcast_transaction(self.cType!.this_arg, txPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					override func free() {
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
		