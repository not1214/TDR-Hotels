Rails.application.routes.draw do
  # 会員用deviseのルーティング（/members/sign_in）
  devise_for :members, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # 管理者用deviseのルーティング（/admin/sign_in）
  devise_for :admin, skip: %i[passwords registrations], controllers: {
    sessions: 'admin/sessions'
  }

  # 管理者用ルーティング
  namespace :admin do
    get '/top' => 'homes#top'
    get 'about' => 'homes#about'

    resources :hotels do
      resources :reviews, except: %i[new create] do # ホテル：レビュー = １：Nだからネスト
        resources :review_comments, only: %i[update destroy] # レビュー：コメント = １：Nだからネスト
      end
    end

    resources :categories, only: %i[index create edit update destroy show]
    resources :areas, only: %i[index create edit update destroy show]
    resources :pictures, only: %i[index new create destroy]

    # 検索機能
    get '/hotel_search' => 'searches#hotel_search'

    # 会員のusernameがURLに表示される
    get '/members' => 'members#index'
    get '/:username' => 'members#show'
    get '/:username/edit' => 'members#edit'
    patch '/:username' => 'members#update'
    patch '/:username/withdraw' => 'members#withdraw', as: 'withdraw_member'
  end

  # 会員側ルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/privacy' => 'homes#privacy'

    resources :hotels, only: %i[index show] do
      collection do
        get 'ranking'
      end

      resources :reviews do # ホテル：レビュー = １：Nだからネスト
        resources :review_comments, only: %i[create update destroy] # レビュー：コメント = １：Nだからネスト
      end

      resource :favorites, only: %i[create destroy] # ホテル：お気に入り = １：Nだからネスト
    end

    # 検索機能
    get '/hotel_search' => 'searches#hotel_search'

    resources :pictures, only: [:index]

    # お問い合わせ機能
    resources :contacts, only: %i[new create] do
      collection do
        post 'confirm'
        post 'back'
        get 'complete'
      end
    end

    resources :areas, only: [:show]
    resources :categories, only: [:show]

    # URLがusernameになるようにルーティング設定
    get '/mypage' => 'members#mypage', as: "mypage"
    get '/:username' => 'members#show'
    get '/mypage/edit' => 'members#edit', as: "edit_mypage"
    get '/mypage/favorites' => 'members#favorites', as: "favorite_mypage"
    patch '/mypage' => 'members#update', as: "update_mypage"
    get '/mypage/unsubscribe' => 'members#unsubscribe', as: "unsubscribe_member"
    patch '/mypge/withdraw' => 'members#withdraw', as: 'withdraw_member'
  end
end
