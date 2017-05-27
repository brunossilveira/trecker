require 'spec_helper'

RSpec.describe Company, type: :model do
  describe '#validations' do
    it { should have_many(:drivers) }
    it { should have_many(:fields) }
  end
end
