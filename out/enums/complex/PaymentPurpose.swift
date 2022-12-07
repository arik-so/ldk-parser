
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias PaymentPurpose = Bindings.PaymentPurpose

			extension Bindings {

				/// Some information provided on receipt of payment depends on whether the payment received is a
				/// spontaneous payment or a \"conventional\" lightning payment that's paying an invoice.
				public class PaymentPurpose: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPaymentPurpose?

					public init(cType: LDKPaymentPurpose) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKPaymentPurpose, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum PaymentPurposeType {
						
						/// Information for receiving a payment that we generated an invoice for.
						case InvoicePayment
			
						/// Because this is a spontaneous payment, the payer generated their own preimage rather than us
						/// (the payee) providing a preimage.
						case SpontaneousPayment
			
					}

					public func getValueType() -> PaymentPurposeType? {
						switch self.cType!.tag {
							case LDKPaymentPurpose_InvoicePayment:
								return .InvoicePayment
			
							case LDKPaymentPurpose_SpontaneousPayment:
								return .SpontaneousPayment
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the PaymentPurpose
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentPurpose_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the PaymentPurpose
					internal func clone() -> PaymentPurpose {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentPurpose>) in
			PaymentPurpose_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PaymentPurpose(cType: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new InvoicePayment-variant PaymentPurpose
					public init(paymentPreimage: [UInt8], paymentSecret: [UInt8]) {
						// native call variable prep
						
						let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(value: paymentPreimage)
				
						let paymentSecretPrimitiveWrapper = ThirtyTwoBytes(value: paymentSecret)
				

						// native method call
						let nativeCallResult = PaymentPurpose_invoice_payment(paymentPreimagePrimitiveWrapper.cType!, paymentSecretPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PaymentPurpose(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new SpontaneousPayment-variant PaymentPurpose
					public init(a: [UInt8]) {
						// native call variable prep
						
						let aPrimitiveWrapper = ThirtyTwoBytes(value: a)
				

						// native method call
						let nativeCallResult = PaymentPurpose_spontaneous_payment(aPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PaymentPurpose(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Serialize the PaymentPurpose object into a byte array which can be read by PaymentPurpose_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPaymentPurpose>) in
			PaymentPurpose_write(objPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Read a PaymentPurpose from a byte array, created by PaymentPurpose_write
					public class func read(ser: [UInt8]) -> Result_PaymentPurposeDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = PaymentPurpose_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentPurposeDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					
					public func getValueAsInvoicePayment() -> InvoicePayment? {
						if self.cType?.tag != LDKPaymentPurpose_InvoicePayment {
							return nil
						}

						return PaymentPurpose_LDKInvoicePayment_Body(cType: self.cType!.invoice_payment)
					}
			
					public func getValueAsSpontaneousPayment() -> [UInt8]? {
						if self.cType?.tag != LDKPaymentPurpose_SpontaneousPayment {
							return nil
						}

						return ThirtyTwoBytes(cType: self.cType!.spontaneous_payment)
					}
			

					internal func dangle() -> PaymentPurpose {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> PaymentPurpose {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PaymentPurpose \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PaymentPurpose \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					internal typealias PaymentPurpose_LDKInvoicePayment_Body = Self.InvoicePayment
			

					/// 
					public class InvoicePayment: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKPaymentPurpose_LDKInvoicePayment_Body?

						fileprivate init(cType: LDKPaymentPurpose_LDKInvoicePayment_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKPaymentPurpose_LDKInvoicePayment_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The preimage to the payment_hash, if the payment hash (and secret) were fetched via
						/// [`ChannelManager::create_inbound_payment`]. If provided, this can be handed directly to
						/// [`ChannelManager::claim_funds`].
						/// 
						/// [`ChannelManager::create_inbound_payment`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment
						/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getPaymentPreimage() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_preimage)

							return returnValue;
						}
		
						/// The \"payment secret\". This authenticates the sender to the recipient, preventing a
						/// number of deanonymization attacks during the routing process.
						/// It is provided here for your reference, however its accuracy is enforced directly by
						/// [`ChannelManager`] using the values you previously provided to
						/// [`ChannelManager::create_inbound_payment`] or
						/// [`ChannelManager::create_inbound_payment_for_hash`].
						/// 
						/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
						/// [`ChannelManager::create_inbound_payment`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment
						/// [`ChannelManager::create_inbound_payment_for_hash`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment_for_hash
						public func getPaymentSecret() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_secret)

							return returnValue;
						}
		

						internal func dangle() -> InvoicePayment {
							self.dangling = true
							return self
						}

											

					}

					
		

				}

			}
		