import ComposableArchitecture
import SwiftUI

@main
struct TCATutorialApp: App {
    // Jboy: アプリケーションを動作させるストアは 1 回だけ作成する必要があることに注意することが重要です。 ほとんどのアプリケーションでは、シーンのルートにある WindowGroup に直接作成するだけで十分です。 ただし、静的変数として保持してシーンに提供することもできます。
        
    // チュートリアル - 最初のリデューサー
             // ヒント: `_printChanges` は、リデューサーが処理するすべてのアクションをコンソールに出力し、アクションの処理後に状態がどのように変化したかを出力します。
    static let store = Store(initialState: CounterReducer.State()) {
            CounterReducer()
                ._printChanges()
        }
    
        var body: some Scene {
            WindowGroup {
                ContentView(store: TCATutorialApp.store)
            }
        }
}
