
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Listen = Bindings.Listen

			extension Bindings {

				/// The `Listen` trait is used to notify when blocks have been connected or disconnected from the
				/// chain.
				/// 
				/// Useful when needing to replay chain data upon startup or as new chain events occur. Clients
				/// sourcing chain data using a block-oriented API should prefer this interface over [`Confirm`].
				/// Such clients fetch the entire header chain whereas clients using [`Confirm`] only fetch headers
				/// when needed.
				/// 
				/// By using [`Listen::filtered_block_connected`] this interface supports clients fetching the
				/// entire header chain and only blocks with matching transaction data using BIP 157 filters or
				/// other similar filtering.
				open class Listen: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKListen?

					public init(cType: LDKListen) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKListen, anchor: NativeTypeWrapper) {
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

						

						
						func filteredBlockConnectedLambda(this_arg: UnsafeRawPointer?, header: UnsafePointer<UInt8Tuple80>?, txdata: LDKCVec_C2Tuple_usizeTransactionZZ, height: UInt32) -> Void {
							let instance: Listen = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Listen::filteredBlockConnectedLambda")

							// Swift callback variable prep
							
							var headerPointee: UInt8Tuple80? = nil
							if let headerUnwrapped = header {
								headerPointee = Bindings.UInt8Tuple80ToArray(tuple: headerUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.filteredBlockConnected(header: headerPointee, txdata: Vec_C2Tuple_usizeTransactionZZ(cType: txdata).getValue(), height: height)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func blockConnectedLambda(this_arg: UnsafeRawPointer?, block: LDKu8slice, height: UInt32) -> Void {
							let instance: Listen = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Listen::blockConnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.blockConnected(block: u8slice(cType: block).getValue(), height: height)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func blockDisconnectedLambda(this_arg: UnsafeRawPointer?, header: UnsafePointer<UInt8Tuple80>?, height: UInt32) -> Void {
							let instance: Listen = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Listen::blockDisconnectedLambda")

							// Swift callback variable prep
							
							var headerPointee: UInt8Tuple80? = nil
							if let headerUnwrapped = header {
								headerPointee = Bindings.UInt8Tuple80ToArray(tuple: headerUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.blockDisconnected(header: headerPointee, height: height)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Listen = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Listen::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKListen(							
							this_arg: thisArg,
							filtered_block_connected: filteredBlockConnectedLambda,
							block_connected: blockConnectedLambda,
							block_disconnected: blockDisconnectedLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Notifies the listener that a block was added at the given height, with the transaction data
					/// possibly filtered.
					open func filteredBlockConnected(header: [UInt8], txdata: [(UInt, [UInt8])], height: UInt32) -> Void {
						Bindings.print("Error: Listen::filteredBlockConnected MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Notifies the listener that a block was added at the given height.
					open func blockConnected(block: [UInt8], height: UInt32) -> Void {
						Bindings.print("Error: Listen::blockConnected MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Notifies the listener that a block was removed at the given height.
					open func blockDisconnected(header: [UInt8], height: UInt32) -> Void {
						Bindings.print("Error: Listen::blockDisconnected MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: Listen::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Listen_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> Listen {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Listen \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Listen \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedListen: Listen {
					
					/// Notifies the listener that a block was added at the given height, with the transaction data
					/// possibly filtered.
					public override func filteredBlockConnected(header: [UInt8]?, txdata: [(UInt, [UInt8])], height: UInt32) {
						// native call variable prep
						
						let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)
					
						let txdataVector = Vec_C2Tuple_usizeTransactionZZ(array: txdata)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
			self.cType!.filtered_block_connected(self.cType!.this_arg, tupledHeaderPointer, txdataVector.cType!, height)
						}
			

						// cleanup
						
						txdataVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Notifies the listener that a block was added at the given height.
					public override func blockConnected(block: [UInt8], height: UInt32) {
						// native call variable prep
						
						let blockPrimitiveWrapper = u8slice(value: block)
				

						// native method call
						let nativeCallResult = self.cType!.block_connected(self.cType!.this_arg, blockPrimitiveWrapper.cType!, height)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Notifies the listener that a block was removed at the given height.
					public override func blockDisconnected(header: [UInt8]?, height: UInt32) {
						// native call variable prep
						
						let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledHeader) { (tupledHeaderPointer: UnsafePointer<UInt8Tuple80>) in
			self.cType!.block_disconnected(self.cType!.this_arg, tupledHeaderPointer, height)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

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
		