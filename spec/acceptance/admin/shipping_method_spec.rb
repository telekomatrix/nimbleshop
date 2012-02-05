require 'spec_helper'

describe "Shipping Method acceptance" do
  def create_shipping_zone(code)
    CountryShippingZone.create_by_carmen_code(code)
  end

  describe "add new shipping method to country" do
    let(:shipping_zone) { create_shipping_zone("US") }

    it "should add state level shipping methods" do
      bef = ShippingZone.count
      visit new_admin_shipping_zone_shipping_method_path(shipping_zone)
      fill_in "Name", with: "Ground Shipping"
      fill_in "Lower price limit", with: "10"
      fill_in "Upper price limit", with: "30"
      fill_in "Base price", with: "10"
      click_button('Submit')

      page.must_have_content('Successfuly created')

      assert_equal 58, ShippingZone.count - bef
    end
  end

  describe "disbale state shipping zone" do
    let(:shipping_zone) { create_shipping_zone("US") }
    let(:state_zone) { shipping_zone.regional_shipping_zones[0] }

    let(:shipping_method) do
      create(:country_shipping_method, :shipping_zone => shipping_zone)
    end

    before(:each) { Capybara.current_driver = :webkit }

    it "should by increment" do
      visit edit_admin_shipping_zone_shipping_method_path(shipping_zone,shipping_method)
     find("a[@rel='disable-#{state_zone.id} nofollow']").click
     page.must_have_content('enable')
    end

    after(:each) { Capybara.current_driver = :rack_test }
  end

  describe "enable state shipping zone" do
    let(:shipping_zone) { create_shipping_zone("US") }
    let(:state_zone) { shipping_zone.regional_shipping_zones[0] }

    let(:shipping_method) do
      create(:country_shipping_method, :shipping_zone => shipping_zone)
    end

    before(:each) { Capybara.current_driver = :webkit }

    it "should by increment" do
      visit edit_admin_shipping_zone_shipping_method_path(shipping_zone,shipping_method)
     find("a[@rel='disable-#{state_zone.id} nofollow']").click
     find("a[@rel='enable-#{state_zone.id} nofollow']").click
    end
    after(:each) { Capybara.current_driver = :rack_test }

  end
end
