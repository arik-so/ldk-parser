
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias GraphSyncError_Tag = Bindings.GraphSyncError_Tag

			extension Bindings {

				/// All-encompassing standard error type that processing can return
				public enum GraphSyncError_Tag {

					
					/// Error trying to read the update data, typically due to an erroneous data length indication
					/// that is greater than the actual amount of data provided
					case LDKGraphSyncError_DecodeError
			
					/// Error applying the patch to the network graph, usually the result of updates that are too
					/// old or missing prerequisite data to the application of updates out of order
					case LDKGraphSyncError_LightningError
			

					internal init (value: LDKGraphSyncError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKGraphSyncError_LightningError

						
						// LDKGraphSyncError_DecodeError
						if value.rawValue == 0 {
							self = .LDKGraphSyncError_DecodeError
						}
			
						// LDKGraphSyncError_LightningError
						if value.rawValue == 1 {
							self = .LDKGraphSyncError_LightningError
						}
			
					}

					internal func getCValue() -> LDKGraphSyncError_Tag {
						switch self {
							
							case .LDKGraphSyncError_DecodeError:
								// return LDKGraphSyncError_DecodeError
								return LDKGraphSyncError_Tag(0)
			
							case .LDKGraphSyncError_LightningError:
								// return LDKGraphSyncError_LightningError
								return LDKGraphSyncError_Tag(1)
			
						}
					}

				}

			}
		