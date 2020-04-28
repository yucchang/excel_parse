class Invoice < ApplicationRecord
  enum state: {
    open: "open",
    pending: "pending",
    closed: "closed"
  }, _prefix: :state
end
