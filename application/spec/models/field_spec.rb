require 'spec_helper'

RSpec.describe Field, type: :model do
  describe '#validations' do
    it { should belong_to(:company) }
  end
end
