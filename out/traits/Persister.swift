
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Persister = Bindings.Persister

			extension Bindings {

				/// Trait that handles persisting a [`ChannelManager`], [`NetworkGraph`], and [`WriteableScore`] to disk.
				open class Persister: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPersister?

					public init(cType: LDKPersister) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKPersister, anchor: NativeTypeWrapper) {
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

						

						
						func persistManagerLambda(this_arg: UnsafeRawPointer?, channel_manager: UnsafePointer<LDKChannelManager>) -> LDKCResult_NoneErrorZ {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::persistManagerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.persistManager(channelManager: ChannelManager(cType: channel_manager.pointee))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func persistGraphLambda(this_arg: UnsafeRawPointer?, network_graph: UnsafePointer<LDKNetworkGraph>) -> LDKCResult_NoneErrorZ {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::persistGraphLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.persistGraph(networkGraph: NetworkGraph(cType: network_graph.pointee))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func persistScorerLambda(this_arg: UnsafeRawPointer?, scorer: UnsafePointer<LDKWriteableScore>) -> LDKCResult_NoneErrorZ {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::persistScorerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.persistScorer(scorer: NativelyImplementedWriteableScore(cType: scorer.pointee))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKPersister(							
							this_arg: thisArg,
							persist_manager: persistManagerLambda,
							persist_graph: persistGraphLambda,
							persist_scorer: persistScorerLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Persist the given ['ChannelManager'] to disk, returning an error if persistence failed.
					open func persistManager(channelManager: ChannelManager) -> Result_NoneErrorZ {
						Bindings.print("Error: Persister::persistManager MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Persist the given [`NetworkGraph`] to disk, returning an error if persistence failed.
					open func persistGraph(networkGraph: NetworkGraph) -> Result_NoneErrorZ {
						Bindings.print("Error: Persister::persistGraph MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Persist the given [`WriteableScore`] to disk, returning an error if persistence failed.
					open func persistScorer(scorer: WriteableScore) -> Result_NoneErrorZ {
						Bindings.print("Error: Persister::persistScorer MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: Persister::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Persister_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> Persister {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Persister \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Persister \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedPersister: Persister {
					
					/// Persist the given ['ChannelManager'] to disk, returning an error if persistence failed.
					public override func persistManager(channelManager: ChannelManager) -> Result_NoneErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: channelManager.cType!) { (channelManagerPointer: UnsafePointer<LDKChannelManager>) in
			self.cType!.persist_manager(self.cType!.this_arg, channelManagerPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Persist the given [`NetworkGraph`] to disk, returning an error if persistence failed.
					public override func persistGraph(networkGraph: NetworkGraph) -> Result_NoneErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
			self.cType!.persist_graph(self.cType!.this_arg, networkGraphPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Persist the given [`WriteableScore`] to disk, returning an error if persistence failed.
					public override func persistScorer(scorer: WriteableScore) -> Result_NoneErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: scorer.activate().cType!) { (scorerPointer: UnsafePointer<LDKWriteableScore>) in
			self.cType!.persist_scorer(self.cType!.this_arg, scorerPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneErrorZ(cType: nativeCallResult)

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
		