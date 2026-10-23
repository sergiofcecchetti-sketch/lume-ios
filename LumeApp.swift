import ActivityKit
import SwiftUI

@main
struct LumeApp: App {
    var body: some Scene { WindowGroup { ContentView() } }
}

struct ContentView: View {
    @State private var activity: Activity<LumeAttributes>?
    @State private var message = "Teste técnico de Live Activity. Sem reprodução ou conexão Spotify neste app."
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "music.note").font(.system(size: 54)).foregroundStyle(.green)
            Text("Lume").font(.largeTitle.bold())
            Text("Teste de app nativo").font(.headline)
            Text(message).multilineTextAlignment(.center).foregroundStyle(.secondary)
            Button("Iniciar Live Activity de teste") { start() }
                .buttonStyle(.borderedProminent).disabled(activity != nil)
            Button("Encerrar teste") { Task { await stop() } }
                .buttonStyle(.bordered).disabled(activity == nil)
            Link("Abrir Lume no Safari", destination: URL(string: "https://dancing-moonbeam-3e1fd4.netlify.app/")!)
            Text("A atividade exibe dados de demonstração. Instalação, funcionamento em CarPlay e exibição de letras ainda não foram validados.")
                .font(.footnote).foregroundStyle(.secondary).multilineTextAlignment(.center)
        }
        .padding(28)
        .onAppear { activity = Activity<LumeAttributes>.activities.first }
    }
    @MainActor private func start() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            message = "Live Activities não estão habilitadas neste dispositivo."
            return
        }
        let now = Date()
        let state = LumeAttributes.ContentState(status: "Demonstração · sem Spotify", interval: now...now.addingTimeInterval(300))
        do {
            activity = try Activity.request(attributes: LumeAttributes(title: "Lume · teste"), content: ActivityContent(state: state, staleDate: now.addingTimeInterval(300)), pushType: nil)
            message = "Teste iniciado. Confira a Tela Bloqueada ou a Dynamic Island. Encerre ao terminar."
        } catch { message = "Não foi possível iniciar: \(error.localizedDescription)" }
    }
    @MainActor private func stop() async {
        for running in Activity<LumeAttributes>.activities {
            await running.end(nil, dismissalPolicy: .immediate)
        }
        activity = nil
        message = "Teste encerrado."
    }
}
