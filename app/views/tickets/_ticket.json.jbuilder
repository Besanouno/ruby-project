json.extract! ticket, :id, :name, :address, :price, :email_address, :phone, :seat_id_seq, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
