
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Specifies the recipient of an invoice, to indicate to [`KeysInterface::sign_invoice`] what node
			/// secret key should be used to sign the invoice.
			public typealias Recipient = Bindings.Recipient

			extension Bindings {

				/// Specifies the recipient of an invoice, to indicate to [`KeysInterface::sign_invoice`] what node
				/// secret key should be used to sign the invoice.
				public enum Recipient {

					
					/// The invoice should be signed with the local node secret key.
					case Node
			
					/// The invoice should be signed with the phantom node secret key. This secret key must be the
					/// same for all nodes participating in the [phantom node payment].
					/// 
					/// [phantom node payment]: PhantomKeysManager
					case PhantomNode
			

					internal init (value: LDKRecipient) {

						// TODO: remove this initial assumption somehow
						// self = .PhantomNode

						switch value {
							
							// LDKRecipient_Node
							// if value.rawValue == 0 {
							case LDKRecipient_Node: // {
								self = .Node
							// }
			
							// LDKRecipient_PhantomNode
							// if value.rawValue == 1 {
							default: // {
								self = .PhantomNode
							// }
			
						}
					}

					internal func getCValue() -> LDKRecipient {
						switch self {
							
							case .Node:
								return LDKRecipient_Node
								// return LDKRecipient(0)
			
							case .PhantomNode:
								return LDKRecipient_PhantomNode
								// return LDKRecipient(1)
			
						}
					}

				}

			}
		