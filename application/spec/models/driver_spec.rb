require 'spec_helper'

RSpec.describe Driver, type: :model do
  describe '#validations' do
    it { should belong_to(:company) }
  end
end
