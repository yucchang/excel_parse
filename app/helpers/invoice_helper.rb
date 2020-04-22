module InvoiceHelper
  def is_controlled?(invoice)
    (invoice.controlled == true)? "Y" : "N"
  end

  def is_temp_sensitive?(invoice)
    (invoice.temp_sensitive == true)? "Y" : "N"
  end
end
