
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias PaymentPurpose_Tag = Bindings.PaymentPurpose_Tag

			extension Bindings {

				/// Some information provided on receipt of payment depends on whether the payment received is a
				/// spontaneous payment or a \"conventional\" lightning payment that's paying an invoice.
				public enum PaymentPurpose_Tag {

					
					/// Information for receiving a payment that we generated an invoice for.
					case LDKPaymentPurpose_InvoicePayment
			
					/// Because this is a spontaneous payment, the payer generated their own preimage rather than us
					/// (the payee) providing a preimage.
					case LDKPaymentPurpose_SpontaneousPayment
			

					internal init (value: LDKPaymentPurpose_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKPaymentPurpose_SpontaneousPayment

						
						if value == LDKPaymentPurpose_InvoicePayment {
							self = .LDKPaymentPurpose_InvoicePayment
						}
			
						if value == LDKPaymentPurpose_SpontaneousPayment {
							self = .LDKPaymentPurpose_SpontaneousPayment
						}
			
					}

					internal func getCValue() -> LDKPaymentPurpose_Tag {
						switch self {
							
							case .LDKPaymentPurpose_InvoicePayment:
								return LDKPaymentPurpose_InvoicePayment
			
							case .LDKPaymentPurpose_SpontaneousPayment:
								return LDKPaymentPurpose_SpontaneousPayment
			
						}
					}

				}

			}
		