require 'spec_helper'
require 'action_view'
require 'sorted/actionview/helper'

ActionView::Base.send(:include, Sorted::ActionView::Helper)

describe Sorted::ActionView do
  it 'should integrate with ActiveRecord::Base' do
    expect(ActionView::Base.new.respond_to?(:link_to_sorted)).to eq(true)
  end

  it 'should return the default sort order and preserve the existing params' do
    order  = :email
    params = { page: 10 }
    result = { page: 10, sort: 'email_asc' }

    sorter = Sorted::ActionView::Builder.new order, params
    expect(sorter.params).to eq(result)
  end

  it 'should only return the sorted css class if email has not yet been sorted' do
    order  = :email
    params = {}
    result = 'sorted'

    sorter = Sorted::ActionView::Builder.new order, params
    expect(sorter.css).to eq(result)
  end

  it 'should only return the sorted css class if email has not yet been sorted' do
    order  = :email
    params = { sort: 'email_asc' }
    result = 'sorted asc'

    sorter = Sorted::ActionView::Builder.new order, params
    expect(sorter.css).to eq(result)
  end

  it 'should return the default order when params are empty' do
    order  = :email
    result = { sort: 'email_asc' }

    sorter = Sorted::ActionView::Builder.new order, {}
    expect(sorter.params).to eq(result)
  end

  it 'should correctly toggle multiple params' do
    order  = 'email DESC, name DESC'
    params = { sort: 'email_asc!name_asc' }
    result = { sort: 'email_desc!name_desc' }

    sorter = Sorted::ActionView::Builder.new order, params
    expect(sorter.params).to eq(result)
  end

  it 'should have sort order over existing params' do
    order  = :email
    params = { sort: 'name_asc' }
    result = { sort: 'email_asc!name_asc' }

    sorter = Sorted::ActionView::Builder.new order, params
    expect(sorter.params).to eq(result)
  end
end
