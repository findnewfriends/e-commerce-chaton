json.extract! join_order_item, :id, :order_id, :item_id, :quantity, :created_at, :updated_at
json.url join_order_item_url(join_order_item, format: :json)
