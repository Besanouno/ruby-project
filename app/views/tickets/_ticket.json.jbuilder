json.extract! ticket, :id, :name, :address, :price, :email_address, :phone, :seat_id_seq, :created_at, :updated_at, :event_id
json.url ticket_url(ticket, format: :json)
