# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'auction setup' do
  let(:seller) do
    User.new(email: 'jane@doe.com', password: 'pw1234')
  end

  def create_auction
    described_class.new(
      title: 'Anything',
      description: 'Lorem ipsum',
      start_date: DateTime.now,
      end_date: DateTime.now + 1.week,
      user_id: 1
    )
  end

  subject { create_auction }
end

RSpec.shared_examples 'Validations' do
  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a start_date' do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a end_date' do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end
end

RSpec.describe Auction, type: :model do
  include_context 'auction setup'

  include_examples 'Validations'

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:bids) }
  end
end
