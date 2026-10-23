import ActivityKit
import SwiftUI
import WidgetKit

@main
struct LumeWidgetBundle: WidgetBundle {
    var body: some Widget { LumeLiveActivity() }
}

struct LumeLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LumeAttributes.self) { context in
            VStack(alignment: .leading, spacing: 8) {
                Label(context.attributes.title, systemImage: "music.note").font(.headline)
                Text(context.state.status).font(.caption)
                Text(timerInterval: context.state.interval, countsDown: false).monospacedDigit()
            }
            .padding()
            .activityBackgroundTint(.black)
            .activitySystemActionForegroundColor(.green)
            .foregroundStyle(.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) { Image(systemName: "music.note").foregroundStyle(.green) }
                DynamicIslandExpandedRegion(.center) { Text(context.attributes.title).font(.headline) }
                DynamicIslandExpandedRegion(.bottom) { Text(context.state.status).font(.caption) }
            } compactLeading: {
                Image(systemName: "music.note").foregroundStyle(.green)
            } compactTrailing: {
                Text("Teste").font(.caption)
            } minimal: {
                Image(systemName: "music.note").foregroundStyle(.green)
            }
        }
    }
}
