class Invoice < ApplicationRecord
  enum states: {
    open: "open",
    pending: "pending",
    closed: "closed"
  }
end
