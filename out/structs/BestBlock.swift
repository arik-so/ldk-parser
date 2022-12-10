
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The best known block as identified by its hash and height.
			public typealias BestBlock = Bindings.BestBlock

			extension Bindings {
		

				/// The best known block as identified by its hash and height.
				public class BestBlock: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBestBlock?

					public init(cType: LDKBestBlock) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKBestBlock, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the BestBlock, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BestBlock_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the BestBlock
					internal func clone() -> BestBlock {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBestBlock>) in
				BestBlock_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BestBlock(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two BestBlocks contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKBestBlock>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKBestBlock>) in
				BestBlock_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a `BestBlock` that represents the genesis block at height 0 of the given
					/// network.
					public class func initWithGenesis(network: Network) -> BestBlock {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BestBlock_from_genesis(network.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BestBlock(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns a `BestBlock` as identified by the given block hash and height.
					public init(blockHash: [UInt8], height: UInt32) {
						// native call variable prep
						
						let blockHashPrimitiveWrapper = ThirtyTwoBytes(value: blockHash)
				

						// native method call
						let nativeCallResult = BestBlock_new(blockHashPrimitiveWrapper.cType!, height)

						// cleanup
						

						/*
						// return value (do some wrapping)
						let returnValue = BestBlock(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Returns the best block hash.
					public func blockHash() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBestBlock>) in
				BestBlock_block_hash(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Returns the best block height.
					public func height() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBestBlock>) in
				BestBlock_height(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle() -> BestBlock {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> BestBlock {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}
						
						if !self.dangling {
							Bindings.print("Freeing BestBlock \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BestBlock \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		