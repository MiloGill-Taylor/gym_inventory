require "test_helper"

class GymItemTest < ActiveSupport::TestCase
  def setup
    @gym_item = GymItem.new(name: 'Treadmill', description: 'Running machine', 
                        focus: 'cardio', in_use: false)
  end 

  test 'Should be valid' do 
    assert @gym_item.valid?
  end 

  test 'Name must be present' do 
    @gym_item.name = '   '
    assert_not @gym_item.valid?
  end 

  test 'Name must be less than 255 characters' do 
    @gym_item.name = 'a' * 256
    assert_not @gym_item.valid?
  end 

  test 'Name should be unique' do 
    duplicate_gym_item = @gym_item.dup 
    @gym_item.save 
    assert_not duplicate_gym_item.valid?
  end 

  test 'Description should be present' do 
    @gym_item.description = '    '
    assert_not @gym_item.valid?
  end 

  test 'in_use should be present' do 
    @gym_item.in_use = nil
    assert_not @gym_item.valid?
  end 

  test 'focus should be present' do 
    @gym_item.focus = '    '
    assert_not @gym_item.valid?
  end 

  test 'focus should not be too long' do
    @gym_item.focus = 'a' * 256
    assert_not @gym_item.valid?
  end 

  test 'focus should be allowed focus' do 
    focusses = %w[cardio strength-lower strength-upper auxiliary
                  CARDIO STRENGTH-LOWER STRENGTH-UPPER AUXILIARY]
    focusses.each do |focus|
      @gym_item.focus = focus 
      assert @gym_item.valid?, "#{focus.inspect} should be valid"
    end 
  end 

  test 'focus should not allow invalid focus' do 
    focusses = %w[cardiovascular strengh-lower stength-upper-lower auxilliary
                  garbage nonsense]
    focusses.each do |focus|
      @gym_item.focus = focus 
      assert_not @gym_item.valid?, "#{focus.inspect} should be invalid"
    end 
  end 

  test 'name should be saved in lowercase form' do 
    @gym_item.name = 'TREADMILL'
    @gym_item.save
    assert_equal 'treadmill', @gym_item.reload.name 
  end 

  test 'focus should be saved in lowercase form' do 
    @gym_item.focus = 'CARDIO'
    @gym_item.save
    assert_equal 'cardio', @gym_item.reload.focus
  end 
end
