crumb :root do
  link "FURIMA", root_path
end

crumb :category do
  link "カテゴリー一覧", categories_path
end

crumb :user_show do
  link "マイページ", user_path
end

crumb :user_info do
  link "会員情報編集", info_user_path
  parent :user_show
end

crumb :user_address do
  link "お届け先情報編集", address_user_path
  parent :user_show
end

crumb :user_logout do
  link "ログアウト", address_user_path
  parent :user_show
end

crumb :user_credit do
  link "お支払い情報", credit_user_path
  parent :user_show
end

crumb :searches do
  link "商品検索", searches_path
end