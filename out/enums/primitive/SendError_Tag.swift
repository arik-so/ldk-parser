
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Errors that may occur when [sending an onion message].
			/// 
			/// [sending an onion message]: OnionMessenger::send_custom_onion_message
			public typealias SendError_Tag = Bindings.SendError_Tag

			extension Bindings {

				/// Errors that may occur when [sending an onion message].
				/// 
				/// [sending an onion message]: OnionMessenger::send_custom_onion_message
				public enum SendError_Tag {

					
					/// Errored computing onion message packet keys.
					case LDKSendError_Secp256k1
			
					/// Because implementations such as Eclair will drop onion messages where the message packet
					/// exceeds 32834 bytes, we refuse to send messages where the packet exceeds this size.
					case LDKSendError_TooBigPacket
			
					/// The provided [`Destination`] was an invalid [`BlindedRoute`], due to having fewer than two
					/// blinded hops.
					case LDKSendError_TooFewBlindedHops
			
					/// Our next-hop peer was offline or does not support onion message forwarding.
					case LDKSendError_InvalidFirstHop
			
					/// Onion message contents must have a TLV type >= 64.
					case LDKSendError_InvalidMessage
			
					/// Our next-hop peer's buffer was full or our total outbound buffer was full.
					case LDKSendError_BufferFull
			

					internal init (value: LDKSendError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKSendError_BufferFull

						
						// LDKSendError_Secp256k1
						if value.rawValue == 0 {
							self = .LDKSendError_Secp256k1
						}
			
						// LDKSendError_TooBigPacket
						if value.rawValue == 1 {
							self = .LDKSendError_TooBigPacket
						}
			
						// LDKSendError_TooFewBlindedHops
						if value.rawValue == 2 {
							self = .LDKSendError_TooFewBlindedHops
						}
			
						// LDKSendError_InvalidFirstHop
						if value.rawValue == 3 {
							self = .LDKSendError_InvalidFirstHop
						}
			
						// LDKSendError_InvalidMessage
						if value.rawValue == 4 {
							self = .LDKSendError_InvalidMessage
						}
			
						// LDKSendError_BufferFull
						if value.rawValue == 5 {
							self = .LDKSendError_BufferFull
						}
			
					}

					internal func getCValue() -> LDKSendError_Tag {
						switch self {
							
							case .LDKSendError_Secp256k1:
								// return LDKSendError_Secp256k1
								return LDKSendError_Tag(0)
			
							case .LDKSendError_TooBigPacket:
								// return LDKSendError_TooBigPacket
								return LDKSendError_Tag(1)
			
							case .LDKSendError_TooFewBlindedHops:
								// return LDKSendError_TooFewBlindedHops
								return LDKSendError_Tag(2)
			
							case .LDKSendError_InvalidFirstHop:
								// return LDKSendError_InvalidFirstHop
								return LDKSendError_Tag(3)
			
							case .LDKSendError_InvalidMessage:
								// return LDKSendError_InvalidMessage
								return LDKSendError_Tag(4)
			
							case .LDKSendError_BufferFull:
								// return LDKSendError_BufferFull
								return LDKSendError_Tag(5)
			
						}
					}

				}

			}
		