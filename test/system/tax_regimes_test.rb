require "application_system_test_case"

class TaxRegimesTest < ApplicationSystemTestCase
  setup do
    @tax_regime = tax_regimes(:one)
  end

  test "visiting the index" do
    visit tax_regimes_url
    assert_selector "h1", text: "Tax regimes"
  end

  test "should create tax regime" do
    visit tax_regimes_url
    click_on "New tax regime"

    check "Status" if @tax_regime.status
    fill_in "Tax regime name", with: @tax_regime.tax_regime_name
    click_on "Create Tax regime"

    assert_text "Tax regime was successfully created"
    click_on "Back"
  end

  test "should update Tax regime" do
    visit tax_regime_url(@tax_regime)
    click_on "Edit this tax regime", match: :first

    check "Status" if @tax_regime.status
    fill_in "Tax regime name", with: @tax_regime.tax_regime_name
    click_on "Update Tax regime"

    assert_text "Tax regime was successfully updated"
    click_on "Back"
  end

  test "should destroy Tax regime" do
    visit tax_regime_url(@tax_regime)
    click_on "Destroy this tax regime", match: :first

    assert_text "Tax regime was successfully destroyed"
  end
end
