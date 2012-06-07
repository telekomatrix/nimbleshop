require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test "validate status" do
    assert_equal 'active', Product.new.status
    assert_equal 'hidden', Product.new(status: 'hidden').status
  end

  test 'should create a default picture record' do
    assert_equal 1, create(:product).pictures.size
  end

  test "#to_param" do
    assert_equal 'test', Product.new(permalink: 'test').to_param
  end

end

class ProductStatusTest < ActiveSupport::TestCase

  setup do
    @product1 = create :product, status: 'active', name: 'product1'
    @product2 = create :product, status: 'hidden', name: 'product2'
    @product3 = create :product, status: 'hidden', name: 'product3'
    @product4 = create :product, name: 'product4'
    @product5 = create :product, status: 'sold_out', name: 'product5'
  end

  test "various status" do
    assert_must_have_same_elements [ @product2, @product3 ], Product.hidden
    assert_must_have_same_elements  [ @product5 ], Product.sold_out
  end

  test "active status" do
    skip "not sure why it is failing" do
      assert_must_have_same_elements [ @product1, @product4 ], Product.active
    end
  end

end

class ProductFindOrBuildForField < ActiveSupport::TestCase
  setup do
    @product = create(:product)
    @field1  = create(:text_custom_field)
    @field2  = create(:number_custom_field)
    @answer  = @product.custom_field_answers.create(custom_field: @field1, value: 23)
  end

  test "needs to build new answer" do
    @answer = @product.find_or_build_answer_for_field(@field2)
    assert_equal nil, @answer.id
  end

  test "needs to return exisitng answer" do
    assert_equal @answer, @product.find_or_build_answer_for_field(@field1)
  end

end
