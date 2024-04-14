import ComposableArchitecture

struct CounterReducer: Reducer {
    // Jboy: 機能がそのジョブを実行するために必要な状態を保持する状態タイプ (通常は構造体)
    struct State {
        var count = 0
    }
    
    // Jboy: ユーザーが機能内で実行できるすべてのアクションを保持するアクション タイプ (通常は列挙型)
         // ヒント: アクション ケースには、incrementButtonTapped など、文字通りユーザーが UI で行うことにちなんで名前を付けるのが最善です。
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            }
        }
    }
}

// Jboy: ビュー ストアでは State が同等であることが必要です
extension CounterReducer.State: Equatable {}
