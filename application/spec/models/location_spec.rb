require 'spec_helper'

RSpec.describe Location, type: :model do
  describe '#validations' do
    it { should belong_to(:driver) }
    it { should belong_to(:company) }
  end
end
