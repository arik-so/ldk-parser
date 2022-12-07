
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias PaymentError = Bindings.PaymentError

			extension Bindings {

				/// An error that may occur when making a payment.
				public class PaymentError: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPaymentError?

					public init(cType: LDKPaymentError) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKPaymentError, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum PaymentErrorType {
						
						/// An error resulting from the provided [`Invoice`] or payment hash.
						case Invoice
			
						/// An error occurring when finding a route.
						case Routing
			
						/// An error occurring when sending a payment.
						case Sending
			
					}

					public func getValueType() -> PaymentErrorType? {
						switch self.cType!.tag {
							case LDKPaymentError_Invoice:
								return .Invoice
			
							case LDKPaymentError_Routing:
								return .Routing
			
							case LDKPaymentError_Sending:
								return .Sending
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the PaymentError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentError_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the PaymentError
					internal func clone() -> PaymentError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentError>) in
			PaymentError_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PaymentError(cType: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new Invoice-variant PaymentError
					public init(a: String) {
						// native call variable prep
						
						let aPrimitiveWrapper = Str(value: a)
				

						// native method call
						let nativeCallResult = PaymentError_invoice(aPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PaymentError(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new Routing-variant PaymentError
					public init(a: LightningError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentError_routing(a.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PaymentError(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new Sending-variant PaymentError
					public init(a: PaymentSendFailure) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentError_sending(a.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PaymentError(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		

					
					public func getValueAsInvoice() -> String? {
						if self.cType?.tag != LDKPaymentError_Invoice {
							return nil
						}

						return Str(cType: self.cType!.invoice).getValue()
					}
			
					public func getValueAsRouting() -> LightningError? {
						if self.cType?.tag != LDKPaymentError_Routing {
							return nil
						}

						return LightningError(cType: self.cType!.routing)
					}
			
					public func getValueAsSending() -> PaymentSendFailure? {
						if self.cType?.tag != LDKPaymentError_Sending {
							return nil
						}

						return PaymentSendFailure(cType: self.cType!.sending)
					}
			

					internal func dangle() -> PaymentError {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> PaymentError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PaymentError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PaymentError \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		