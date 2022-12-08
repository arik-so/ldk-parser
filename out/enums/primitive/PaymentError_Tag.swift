
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An error that may occur when making a payment.
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

						
						// LDKPaymentError_Invoice
						if value.rawValue == 0 {
							self = .LDKPaymentError_Invoice
						}
			
						// LDKPaymentError_Routing
						if value.rawValue == 1 {
							self = .LDKPaymentError_Routing
						}
			
						// LDKPaymentError_Sending
						if value.rawValue == 2 {
							self = .LDKPaymentError_Sending
						}
			
					}

					internal func getCValue() -> LDKPaymentError_Tag {
						switch self {
							
							case .LDKPaymentError_Invoice:
								// return LDKPaymentError_Invoice
								return LDKPaymentError_Tag(0)
			
							case .LDKPaymentError_Routing:
								// return LDKPaymentError_Routing
								return LDKPaymentError_Tag(1)
			
							case .LDKPaymentError_Sending:
								// return LDKPaymentError_Sending
								return LDKPaymentError_Tag(2)
			
						}
					}

				}

			}
		