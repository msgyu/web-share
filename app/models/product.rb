class Product < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true
end
