require "test_helper"

class TaxRegimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tax_regime = tax_regimes(:one)
  end

  test "should get index" do
    get tax_regimes_url
    assert_response :success
  end

  test "should get new" do
    get new_tax_regime_url
    assert_response :success
  end

  test "should create tax_regime" do
    assert_difference("TaxRegime.count") do
      post tax_regimes_url, params: { tax_regime: { status: @tax_regime.status, tax_regime_name: @tax_regime.tax_regime_name } }
    end

    assert_redirected_to tax_regime_url(TaxRegime.last)
  end

  test "should show tax_regime" do
    get tax_regime_url(@tax_regime)
    assert_response :success
  end

  test "should get edit" do
    get edit_tax_regime_url(@tax_regime)
    assert_response :success
  end

  test "should update tax_regime" do
    patch tax_regime_url(@tax_regime), params: { tax_regime: { status: @tax_regime.status, tax_regime_name: @tax_regime.tax_regime_name } }
    assert_redirected_to tax_regime_url(@tax_regime)
  end

  test "should destroy tax_regime" do
    assert_difference("TaxRegime.count", -1) do
      delete tax_regime_url(@tax_regime)
    end

    assert_redirected_to tax_regimes_url
  end
end
