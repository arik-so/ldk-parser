
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Chain-related parameters used to construct a new `ChannelManager`.
			/// 
			/// Typically, the block-specific parameters are derived from the best block hash for the network,
			/// as a newly constructed `ChannelManager` will not have created any channels yet. These parameters
			/// are not needed when deserializing a previously constructed `ChannelManager`.
			public typealias ChainParameters = Bindings.ChainParameters

			extension Bindings {
		

				/// Chain-related parameters used to construct a new `ChannelManager`.
				/// 
				/// Typically, the block-specific parameters are derived from the best block hash for the network,
				/// as a newly constructed `ChannelManager` will not have created any channels yet. These parameters
				/// are not needed when deserializing a previously constructed `ChannelManager`.
				public class ChainParameters: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChainParameters?

					public init(cType: LDKChainParameters) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKChainParameters, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChainParameters, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChainParameters_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The network for determining the `chain_hash` in Lightning messages.
					public func getNetwork() -> Network {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChainParameters>) in
				ChainParameters_get_network(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Network(value: nativeCallResult)
						

						return returnValue
					}
		
					/// The network for determining the `chain_hash` in Lightning messages.
					public func setNetwork(val: Network) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChainParameters>) in
				ChainParameters_set_network(thisPtrPointer, val.getCValue())
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The hash and height of the latest block successfully connected.
					/// 
					/// Used to track on-chain channel funding outputs and send payments with reliable timelocks.
					public func getBestBlock() -> BestBlock {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChainParameters>) in
				ChainParameters_get_best_block(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BestBlock(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// The hash and height of the latest block successfully connected.
					/// 
					/// Used to track on-chain channel funding outputs and send payments with reliable timelocks.
					public func setBestBlock(val: BestBlock) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChainParameters>) in
				ChainParameters_set_best_block(thisPtrPointer, val.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChainParameters given each field
					public init(networkArg: Network, bestBlockArg: BestBlock) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChainParameters_new(networkArg.getCValue(), bestBlockArg.cType!)

						// cleanup
						

						/*
						// return value (do some wrapping)
						let returnValue = ChainParameters(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the ChainParameters
					internal func clone() -> ChainParameters {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChainParameters>) in
				ChainParameters_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChainParameters(cType: nativeCallResult)
						

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
		

					internal func dangle() -> ChainParameters {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ChainParameters {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChainParameters \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChainParameters \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		