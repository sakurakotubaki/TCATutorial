import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    
    // Jboy: ストアは機能のランタイムを表します。 つまり、状態を更新するためにアクションを処理できるオブジェクトであり、エフェクトを実行し、それらのエフェクトからのデータをシステムにフィードすることができます。
    let store: StoreOf<CounterReducer>
    
    var body: some View {
        // Jboy: ビュー ストアを構築するための軽量構文を提供する WithViewStore。
                 // ストア内の状態を観察するために使用されます
                 // 警告: 現在、observe: { $0 } を使用してストア内のすべての状態を監視していますが、通常、機能はビューで必要な状態よりもはるかに多くの状態を保持しています。 パフォーマンスの確認(https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/performance)
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("Redux with SwiftUI")
                Text("\(viewStore.count)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                HStack {
                    Button("-") {
                        viewStore.send(.decrementButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    
                    Button("+") {
                        viewStore.send(.incrementButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                }
            }
        }
    }
}
