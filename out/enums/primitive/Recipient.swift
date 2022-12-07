
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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
						self = .PhantomNode

						
						if value == LDKRecipient_Node {
							self = .Node
						}
			
						if value == LDKRecipient_PhantomNode {
							self = .PhantomNode
						}
			
					}

					internal func getCValue() -> LDKRecipient {
						switch self {
							
							case .Node:
								return LDKRecipient_Node
			
							case .PhantomNode:
								return LDKRecipient_PhantomNode
			
						}
					}

				}

			}
		