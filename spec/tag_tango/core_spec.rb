# frozen_string_literal: true

require "tag_tango/core/version"

RSpec.describe TagTango::Core do
  it "has a version number" do
    expect(TagTango::Core::VERSION).not_to be_nil
  end
end
