
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias InvoicePayer = Bindings.InvoicePayer

			extension Bindings {
		

				/// A utility for paying [`Invoice`]s and sending spontaneous payments.
				/// 
				/// See [module-level documentation] for details.
				/// 
				/// [module-level documentation]: crate::payment
				public class InvoicePayer: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInvoicePayer?

					public init(cType: LDKInvoicePayer) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKInvoicePayer, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the InvoicePayer, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoicePayer_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates an invoice payer that retries failed payment paths.
					/// 
					/// Will forward any [`Event::PaymentPathFailed`] events to the decorated `event_handler` once
					/// `retry` has been exceeded for a given [`Invoice`].
					public init(payer: Payer, router: Router, logger: Logger, eventHandler: EventHandler, retry: Retry) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoicePayer_new(payer.activate().cType!, router.activate().cType!, logger.activate().cType!, eventHandler.activate().cType!, retry.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = InvoicePayer(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Pays the given [`Invoice`], caching it for later use in case a retry is needed.
					/// 
					/// You should ensure that the `invoice.payment_hash()` is unique and the same payment_hash has
					/// never been paid before. Because [`InvoicePayer`] is stateless no effort is made to do so
					/// for you.
					public func payInvoice(invoice: Invoice) -> Result_PaymentIdPaymentErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoicePayer>) in
			
						withUnsafePointer(to: invoice.cType!) { (invoicePointer: UnsafePointer<LDKInvoice>) in
			InvoicePayer_pay_invoice(thisArgPointer, invoicePointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Pays the given zero-value [`Invoice`] using the given amount, caching it for later use in
					/// case a retry is needed.
					/// 
					/// You should ensure that the `invoice.payment_hash()` is unique and the same payment_hash has
					/// never been paid before. Because [`InvoicePayer`] is stateless no effort is made to do so
					/// for you.
					public func payZeroValueInvoice(invoice: Invoice, amountMsats: UInt64) -> Result_PaymentIdPaymentErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoicePayer>) in
			
						withUnsafePointer(to: invoice.cType!) { (invoicePointer: UnsafePointer<LDKInvoice>) in
			InvoicePayer_pay_zero_value_invoice(thisArgPointer, invoicePointer, amountMsats)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Pays `pubkey` an amount using the hash of the given preimage, caching it for later use in
					/// case a retry is needed.
					/// 
					/// You should ensure that `payment_preimage` is unique and that its `payment_hash` has never
					/// been paid before. Because [`InvoicePayer`] is stateless no effort is made to do so for you.
					public func payPubkey(pubkey: [UInt8], paymentPreimage: [UInt8], amountMsats: UInt64, finalCltvExpiryDelta: UInt32) -> Result_PaymentIdPaymentErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoicePayer>) in
			InvoicePayer_pay_pubkey(thisArgPointer, pubkey.cType!, paymentPreimage.cType!, amountMsats, finalCltvExpiryDelta)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PaymentIdPaymentErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Removes the payment cached by the given payment hash.
					/// 
					/// Should be called once a payment has failed or succeeded if not using [`InvoicePayer`] as an
					/// [`EventHandler`]. Otherwise, calling this method is unnecessary.
					public func removeCachedPayment(paymentHash: [UInt8]) {
						// native call variable prep
						
						let tupledPaymentHash = Bindings.arrayToUInt8Tuple32(array: paymentHash)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoicePayer>) in
			
						withUnsafePointer(to: tupledPaymentHash) { (tupledPaymentHashPointer: UnsafePointer<UInt8Tuple32>) in
			InvoicePayer_remove_cached_payment(thisArgPointer, tupledPaymentHashPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new EventHandler which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned EventHandler must be freed before this_arg is
					public func asEventHandler() -> EventHandler {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoicePayer>) in
			InvoicePayer_as_EventHandler(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NativelyImplementedEventHandler(cType: nativeCallResult, anchor: self)

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
		

					internal func dangle() -> InvoicePayer {
						self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing InvoicePayer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing InvoicePayer \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		