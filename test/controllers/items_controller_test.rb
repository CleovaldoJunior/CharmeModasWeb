require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include PedidoAtual

  setup do
    @item = items(:item_um)
    @usuario = usuarios(:usuario_dois)
  end

  test "should get edit" do
    sign_in @usuario
    get edit_pedido_item_url(@item.pedido, @item)
    assert_response :success
  end

  test "should update item" do
    sign_in @usuario
    put pedido_item_url(@item.pedido, @item), params: {item: {quantidade: 3}}
    assert_redirected_to @item.pedido
  end

  test "should destroy item" do
    sign_in @usuario
    assert_difference('Item.count', -1) do
      delete pedido_item_url(@item.pedido, @item)
    end

    assert_redirected_to pedido_url(@item.pedido)
  end
end
