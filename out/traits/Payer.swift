
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Payer = Bindings.Payer

			extension Bindings {

				/// A trait defining behavior of an [`Invoice`] payer.
				open class Payer: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPayer?

					public init(pointer: LDKPayer) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKPayer, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func nodeIdLambda(this_arg: UnsafeRawPointer?) -> LDKPublicKey {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::nodeIdLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.nodeId()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func firstHopsLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_ChannelDetailsZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::firstHopsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.firstHops()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func sendPaymentLambda(this_arg: UnsafeRawPointer?, route: UnsafePointer<LDKRoute>, payment_hash: LDKThirtyTwoBytes, payment_secret: LDKThirtyTwoBytes) -> LDKCResult_PaymentIdPaymentSendFailureZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::sendPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.sendPayment(route: Route(pointer: route.pointee), paymentHash: ThirtyTwoBytes(pointer: payment_hash).getValue(), paymentSecret: ThirtyTwoBytes(pointer: payment_secret).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func sendSpontaneousPaymentLambda(this_arg: UnsafeRawPointer?, route: UnsafePointer<LDKRoute>, payment_preimage: LDKThirtyTwoBytes) -> LDKCResult_PaymentIdPaymentSendFailureZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::sendSpontaneousPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.sendSpontaneousPayment(route: Route(pointer: route.pointee), paymentPreimage: ThirtyTwoBytes(pointer: payment_preimage).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func retryPaymentLambda(this_arg: UnsafeRawPointer?, route: UnsafePointer<LDKRoute>, payment_id: LDKThirtyTwoBytes) -> LDKCResult_NonePaymentSendFailureZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::retryPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.retryPayment(route: Route(pointer: route.pointee), paymentId: ThirtyTwoBytes(pointer: payment_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func abandonPaymentLambda(this_arg: UnsafeRawPointer?, payment_id: LDKThirtyTwoBytes) -> Void {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::abandonPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.abandonPayment(paymentId: ThirtyTwoBytes(pointer: payment_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKPayer(							
							this_arg: thisArg,
							node_id: nodeIdLambda,
							first_hops: firstHopsLambda,
							send_payment: sendPaymentLambda,
							send_spontaneous_payment: sendSpontaneousPaymentLambda,
							retry_payment: retryPaymentLambda,
							abandon_payment: abandonPaymentLambda,
							free: freeLambda
						)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Returns the payer's node id.
					open func nodeId() -> [UInt8] {
						Bindings.print("Error: Payer::nodeId MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Returns the payer's channels.
					open func firstHops() -> [ChannelDetails] {
						Bindings.print("Error: Payer::firstHops MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Sends a payment over the Lightning Network using the given [`Route`].
					/// 
					/// Note that payment_secret (or a relevant inner pointer) may be NULL or all-0s to represent None
					open func sendPayment(route: Route, paymentHash: [UInt8], paymentSecret: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
						Bindings.print("Error: Payer::sendPayment MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Sends a spontaneous payment over the Lightning Network using the given [`Route`].
					open func sendSpontaneousPayment(route: Route, paymentPreimage: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
						Bindings.print("Error: Payer::sendSpontaneousPayment MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Retries a failed payment path for the [`PaymentId`] using the given [`Route`].
					open func retryPayment(route: Route, paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						Bindings.print("Error: Payer::retryPayment MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Signals that no further retries for the given payment will occur.
					open func abandonPayment(paymentId: [UInt8]) -> Void {
						Bindings.print("Error: Payer::abandonPayment MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: Payer::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Calls the free function if one is set
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Payer_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					

					internal func dangle() -> Payer {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Payer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Payer \(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplementedPayer: Payer {
					
					/// Returns the payer's node id.
					public func nodeId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.node_id(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Returns the payer's channels.
					public func firstHops() -> [ChannelDetails] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.first_hops(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_ChannelDetailsZ(pointer: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Sends a payment over the Lightning Network using the given [`Route`].
					/// 
					/// Note that payment_secret (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func sendPayment(route: Route, paymentHash: [UInt8], paymentSecret: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: route.cType!) { (routePointer: UnsafePointer<LDKRoute>) in
			self.cType!.send_payment(self.cType!.this_arg, routePointer, paymentHash.cType!, paymentSecret.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentSendFailureZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Sends a spontaneous payment over the Lightning Network using the given [`Route`].
					public func sendSpontaneousPayment(route: Route, paymentPreimage: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: route.cType!) { (routePointer: UnsafePointer<LDKRoute>) in
			self.cType!.send_spontaneous_payment(self.cType!.this_arg, routePointer, paymentPreimage.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentSendFailureZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Retries a failed payment path for the [`PaymentId`] using the given [`Route`].
					public func retryPayment(route: Route, paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: route.cType!) { (routePointer: UnsafePointer<LDKRoute>) in
			self.cType!.retry_payment(self.cType!.this_arg, routePointer, paymentId.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NonePaymentSendFailureZ(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Signals that no further retries for the given payment will occur.
					public func abandonPayment(paymentId: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.abandon_payment(self.cType!.this_arg, paymentId.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public func free() {
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
		