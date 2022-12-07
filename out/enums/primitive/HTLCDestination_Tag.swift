
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias HTLCDestination_Tag = Bindings.HTLCDestination_Tag

			extension Bindings {

				/// Intended destination of a failed HTLC as indicated in [`Event::HTLCHandlingFailed`].
				public enum HTLCDestination_Tag {

					
					/// We tried forwarding to a channel but failed to do so. An example of such an instance is when
					/// there is insufficient capacity in our outbound channel.
					case LDKHTLCDestination_NextHopChannel
			
					/// Scenario where we are unsure of the next node to forward the HTLC to.
					case LDKHTLCDestination_UnknownNextHop
			
					/// Failure scenario where an HTLC may have been forwarded to be intended for us,
					/// but is invalid for some reason, so we reject it.
					/// 
					/// Some of the reasons may include:
					/// * HTLC Timeouts
					/// * Expected MPP amount to claim does not equal HTLC total
					/// * Claimable amount does not match expected amount
					case LDKHTLCDestination_FailedPayment
			

					internal init (value: LDKHTLCDestination_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKHTLCDestination_FailedPayment

						
						if value == LDKHTLCDestination_NextHopChannel {
							self = .LDKHTLCDestination_NextHopChannel
						}
			
						if value == LDKHTLCDestination_UnknownNextHop {
							self = .LDKHTLCDestination_UnknownNextHop
						}
			
						if value == LDKHTLCDestination_FailedPayment {
							self = .LDKHTLCDestination_FailedPayment
						}
			
					}

					internal func getCValue() -> LDKHTLCDestination_Tag {
						switch self {
							
							case .LDKHTLCDestination_NextHopChannel:
								return LDKHTLCDestination_NextHopChannel
			
							case .LDKHTLCDestination_UnknownNextHop:
								return LDKHTLCDestination_UnknownNextHop
			
							case .LDKHTLCDestination_FailedPayment:
								return LDKHTLCDestination_FailedPayment
			
						}
					}

				}

			}
		