
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias PaymentError_Tag = Bindings.PaymentError_Tag

			extension Bindings {

				/// An error that may occur when making a payment.
				public enum PaymentError_Tag {

					
					/// An error resulting from the provided [`Invoice`] or payment hash.
					case LDKPaymentError_Invoice
			
					/// An error occurring when finding a route.
					case LDKPaymentError_Routing
			
					/// An error occurring when sending a payment.
					case LDKPaymentError_Sending
			

					internal init (value: LDKPaymentError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKPaymentError_Sending

						
						if value == LDKPaymentError_Invoice {
							self = .LDKPaymentError_Invoice
						}
			
						if value == LDKPaymentError_Routing {
							self = .LDKPaymentError_Routing
						}
			
						if value == LDKPaymentError_Sending {
							self = .LDKPaymentError_Sending
						}
			
					}

					internal func getCValue() -> LDKPaymentError_Tag {
						switch self {
							
							case .LDKPaymentError_Invoice:
								return LDKPaymentError_Invoice
			
							case .LDKPaymentError_Routing:
								return LDKPaymentError_Routing
			
							case .LDKPaymentError_Sending:
								return LDKPaymentError_Sending
			
						}
					}

				}

			}
		