#! /usr/bin/env rspec --format doc

ENV["Y2DIR"] = File.expand_path("../../src", __FILE__)

require "yast"

Yast.import "ProductLicense"

describe Yast::ProductLicenseClass do
  before(:each) do
    Yast::ProductLicense.main #resets internal values
  end

  describe "#AcceptanceNeeded" do
    it "Returns if given license id need to be accepted" do
      Yast::ProductLicense.instance_variable_set(:@license_acceptance_needed,
        { "licenseA" => true, "licenseB" => false }
      )
      expect(Yast::ProductLicense.AcceptanceNeeded("licenseA")).to be_true
      expect(Yast::ProductLicense.AcceptanceNeeded("licenseB")).to be_false
    end

    it "Returns true if license with given if do not have set value" do
      expect(Yast::ProductLicense.AcceptanceNeeded("licenseA")).to be_true
    end
  end
end
