
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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

						
						if value == LDKSendError_Secp256k1 {
							self = .LDKSendError_Secp256k1
						}
			
						if value == LDKSendError_TooBigPacket {
							self = .LDKSendError_TooBigPacket
						}
			
						if value == LDKSendError_TooFewBlindedHops {
							self = .LDKSendError_TooFewBlindedHops
						}
			
						if value == LDKSendError_InvalidFirstHop {
							self = .LDKSendError_InvalidFirstHop
						}
			
						if value == LDKSendError_InvalidMessage {
							self = .LDKSendError_InvalidMessage
						}
			
						if value == LDKSendError_BufferFull {
							self = .LDKSendError_BufferFull
						}
			
					}

					internal func getCValue() -> LDKSendError_Tag {
						switch self {
							
							case .LDKSendError_Secp256k1:
								return LDKSendError_Secp256k1
			
							case .LDKSendError_TooBigPacket:
								return LDKSendError_TooBigPacket
			
							case .LDKSendError_TooFewBlindedHops:
								return LDKSendError_TooFewBlindedHops
			
							case .LDKSendError_InvalidFirstHop:
								return LDKSendError_InvalidFirstHop
			
							case .LDKSendError_InvalidMessage:
								return LDKSendError_InvalidMessage
			
							case .LDKSendError_BufferFull:
								return LDKSendError_BufferFull
			
						}
					}

				}

			}
		