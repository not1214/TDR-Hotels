Rails.application.routes.draw do

  #会員用deviseのルーティング（/members/sign_in）
  devise_for :members, skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #管理者用deviseのルーティング（/admin/sign_in）
  devise_for :admin, skip: [:passwords, :registrations,], controllers: {
    sessions: "admin/sessions"
  }

  #管理者用ルーティング
  namespace :admin do

    get "/top" => "homes#top"
    get "about" => "homes#about"

    resources :hotels do
      resources :reviews, except: [:new, :create] do  #ホテル：レビュー = １：Nだからネスト
        resources :review_comments, only: [:update, :destroy]  #レビュー：コメント = １：Nだからネスト
      end
    end

    resources :categories, only: [:index, :create, :edit, :update, :destroy, :show]
    resources :areas, only: [:index, :create, :edit, :update, :destroy, :show]
    resources :pictures, only: [:index, :new, :create, :destroy]

    #検索機能
    get "/hotel_search" => "searches#hotel_search"

    #会員のusernameがURLに表示される
    get "/members" => "members#index"
    get "/:username" => "members#show"
    get "/:username/edit" => "members#edit"
    patch "/:username" => "members#update"
    patch "/:username/withdraw" => "members#withdraw", as: "withdraw_member"

  end

  #会員側ルーティング
  scope module: :public do

    root to: "homes#top"
    get "/about" => "homes#about"

    resources :hotels, only: [:index, :show] do
      collection do
        get "ranking"
      end

      resources :reviews do  #ホテル：レビュー = １：Nだからネスト
        resources :review_comments, only: [:create, :update, :destroy]  #レビュー：コメント = １：Nだからネスト
      end

      resource :favorites, only: [:create, :destroy]  #ホテル：お気に入り = １：Nだからネスト
    end

    #検索機能
    get "/hotel_search" => "searches#hotel_search"

    resources :pictures, only: [:index]

    #お問い合わせ機能
    resources :contacts, only: [:new, :create] do
      collection do
        post "confirm"
        post "back"
        get "complete"
      end
    end

    resources :areas, only: [:show]
    resources :categories, only: [:show]

    #URLがusernameになるようにルーティング設定
    get "/mypage" => "members#mypage"
    get "/:username" => "members#show"
    get "/:username/edit" => "members#edit"
    get "/:username/favorites" => "members#favorites"
    patch "/:username" => "members#update"
    get "/:username/unsubscribe" => "members#unsubscribe"
    patch "/:username/withdraw" => "members#withdraw", as: "withdraw_member"

  end

end
