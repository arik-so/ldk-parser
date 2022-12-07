
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias MonitorEvent_Tag = Bindings.MonitorEvent_Tag

			extension Bindings {

				/// An event to be processed by the ChannelManager.
				public enum MonitorEvent_Tag {

					
					/// A monitor event containing an HTLCUpdate.
					case LDKMonitorEvent_HTLCEvent
			
					/// A monitor event that the Channel's commitment transaction was confirmed.
					case LDKMonitorEvent_CommitmentTxConfirmed
			
					/// Indicates a [`ChannelMonitor`] update has completed. See
					/// [`ChannelMonitorUpdateStatus::InProgress`] for more information on how this is used.
					/// 
					/// [`ChannelMonitorUpdateStatus::InProgress`]: super::ChannelMonitorUpdateStatus::InProgress
					case LDKMonitorEvent_Completed
			
					/// Indicates a [`ChannelMonitor`] update has failed. See
					/// [`ChannelMonitorUpdateStatus::PermanentFailure`] for more information on how this is used.
					/// 
					/// [`ChannelMonitorUpdateStatus::PermanentFailure`]: super::ChannelMonitorUpdateStatus::PermanentFailure
					case LDKMonitorEvent_UpdateFailed
			

					internal init (value: LDKMonitorEvent_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKMonitorEvent_UpdateFailed

						
						if value == LDKMonitorEvent_HTLCEvent {
							self = .LDKMonitorEvent_HTLCEvent
						}
			
						if value == LDKMonitorEvent_CommitmentTxConfirmed {
							self = .LDKMonitorEvent_CommitmentTxConfirmed
						}
			
						if value == LDKMonitorEvent_Completed {
							self = .LDKMonitorEvent_Completed
						}
			
						if value == LDKMonitorEvent_UpdateFailed {
							self = .LDKMonitorEvent_UpdateFailed
						}
			
					}

					internal func getCValue() -> LDKMonitorEvent_Tag {
						switch self {
							
							case .LDKMonitorEvent_HTLCEvent:
								return LDKMonitorEvent_HTLCEvent
			
							case .LDKMonitorEvent_CommitmentTxConfirmed:
								return LDKMonitorEvent_CommitmentTxConfirmed
			
							case .LDKMonitorEvent_Completed:
								return LDKMonitorEvent_Completed
			
							case .LDKMonitorEvent_UpdateFailed:
								return LDKMonitorEvent_UpdateFailed
			
						}
					}

				}

			}
		