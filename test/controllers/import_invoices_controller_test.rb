require 'test_helper'

class ImportInvoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get import_invoices_new_url
    assert_response :success
  end

  test "should get create" do
    get import_invoices_create_url
    assert_response :success
  end

end
