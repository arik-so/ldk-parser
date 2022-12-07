
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Router = Bindings.Router

			extension Bindings {

				/// A trait defining behavior for routing an [`Invoice`] payment.
				open class Router: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRouter?

					public init(cType: LDKRouter) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKRouter, anchor: NativeTypeWrapper) {
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

						

						
						func findRouteLambda(this_arg: UnsafeRawPointer?, payer: LDKPublicKey, route_params: UnsafePointer<LDKRouteParameters>, payment_hash: UnsafePointer<UInt8Tuple32>?, first_hops: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>?, inflight_htlcs: LDKInFlightHtlcs) -> LDKCResult_RouteLightningErrorZ {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::findRouteLambda")

							// Swift callback variable prep
							
							var payment_hashPointee: UInt8Tuple32? = nil
							if let payment_hashUnwrapped = payment_hash {
								payment_hashPointee = Bindings.UInt8Tuple32ToArray(tuple: payment_hashUnwrapped.pointee)
							}
						
							var first_hopsPointee: LDKCVec_ChannelDetailsZ? = nil
							if let first_hopsUnwrapped = first_hops {
								first_hopsPointee = Vec_ChannelDetailsZ(cType: first_hopsUnwrapped.pointee).getValue()
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.findRoute(payer: PublicKey(cType: payer).getValue(), routeParams: RouteParameters(cType: route_params.pointee), paymentHash: payment_hashPointee, firstHops: first_hopsPointee, inflightHtlcs: InFlightHtlcs(cType: inflight_htlcs))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func notifyPaymentPathFailedLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentPathFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentPathFailed(path: Vec_RouteHopZ(cType: path).getValue(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func notifyPaymentPathSuccessfulLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentPathSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentPathSuccessful(path: Vec_RouteHopZ(cType: path).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func notifyPaymentProbeSuccessfulLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentProbeSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentProbeSuccessful(path: Vec_RouteHopZ(cType: path).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func notifyPaymentProbeFailedLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentProbeFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentProbeFailed(path: Vec_RouteHopZ(cType: path).getValue(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKRouter(							
							this_arg: thisArg,
							find_route: findRouteLambda,
							notify_payment_path_failed: notifyPaymentPathFailedLambda,
							notify_payment_path_successful: notifyPaymentPathSuccessfulLambda,
							notify_payment_probe_successful: notifyPaymentProbeSuccessfulLambda,
							notify_payment_probe_failed: notifyPaymentProbeFailedLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Finds a [`Route`] between `payer` and `payee` for a payment with the given values.
					/// 
					/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
					open func findRoute(payer: [UInt8], routeParams: RouteParameters, paymentHash: [UInt8], firstHops: [ChannelDetails], inflightHtlcs: InFlightHtlcs) -> Result_RouteLightningErrorZ {
						Bindings.print("Error: Router::findRoute MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that payment through a specific path has failed.
					open func notifyPaymentPathFailed(path: [RouteHop], shortChannelId: UInt64) -> Void {
						Bindings.print("Error: Router::notifyPaymentPathFailed MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that payment through a specific path was successful.
					open func notifyPaymentPathSuccessful(path: [RouteHop]) -> Void {
						Bindings.print("Error: Router::notifyPaymentPathSuccessful MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that a payment probe was successful.
					open func notifyPaymentProbeSuccessful(path: [RouteHop]) -> Void {
						Bindings.print("Error: Router::notifyPaymentProbeSuccessful MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that a payment probe failed.
					open func notifyPaymentProbeFailed(path: [RouteHop], shortChannelId: UInt64) -> Void {
						Bindings.print("Error: Router::notifyPaymentProbeFailed MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: Router::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Router_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> Router {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Router \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Router \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedRouter: Router {
					
					/// Finds a [`Route`] between `payer` and `payee` for a payment with the given values.
					/// 
					/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
					public override func findRoute(payer: [UInt8], routeParams: RouteParameters, paymentHash: [UInt8]?, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs) -> Result_RouteLightningErrorZ {
						// native call variable prep
						
						let payerPrimitiveWrapper = PublicKey(value: payer)
				
						let tupledPaymentHash = Bindings.arrayToUInt8Tuple32(array: paymentHash)
					
						let firstHopsVector = Vec_ChannelDetailsZ(array: firstHops)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: routeParams.cType!) { (routeParamsPointer: UnsafePointer<LDKRouteParameters>) in
			
						withUnsafePointer(to: tupledPaymentHash) { (tupledPaymentHashPointer: UnsafePointer<UInt8Tuple32>) in
			
						withUnsafeMutablePointer(to: &firstHopsVector.cType!) { (firstHopsVectorPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>) in
			self.cType!.find_route(self.cType!.this_arg, payerPrimitiveWrapper.cType!, routeParamsPointer, tupledPaymentHashPointer, firstHopsVectorPointer, inflightHtlcs.cType!)
						}
			
						}
			
						}
			

						// cleanup
						
						firstHopsVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_RouteLightningErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Lets the router know that payment through a specific path has failed.
					public override func notifyPaymentPathFailed(path: [RouteHop], shortChannelId: UInt64) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path)
				

						// native method call
						let nativeCallResult = self.cType!.notify_payment_path_failed(self.cType!.this_arg, pathVector.cType!, shortChannelId)

						// cleanup
						
						pathVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Lets the router know that payment through a specific path was successful.
					public override func notifyPaymentPathSuccessful(path: [RouteHop]) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path)
				

						// native method call
						let nativeCallResult = self.cType!.notify_payment_path_successful(self.cType!.this_arg, pathVector.cType!)

						// cleanup
						
						pathVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Lets the router know that a payment probe was successful.
					public override func notifyPaymentProbeSuccessful(path: [RouteHop]) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path)
				

						// native method call
						let nativeCallResult = self.cType!.notify_payment_probe_successful(self.cType!.this_arg, pathVector.cType!)

						// cleanup
						
						pathVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Lets the router know that a payment probe failed.
					public override func notifyPaymentProbeFailed(path: [RouteHop], shortChannelId: UInt64) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path)
				

						// native method call
						let nativeCallResult = self.cType!.notify_payment_probe_failed(self.cType!.this_arg, pathVector.cType!, shortChannelId)

						// cleanup
						
						pathVector.noOpRetain()
				

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
		