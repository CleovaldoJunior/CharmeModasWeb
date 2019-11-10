And("O usuario de nome {string} efetuou o pedido de codigo {string} da compra do produto de codigo {int}") do |_nomeUser ,codigoPedido, codigoProduto|
  click_button 'adicionarAoCarrinho'
  expect(page).to have_text('Show pedido')
  click_button 'finalizarPedidoUser'
  expect(page).to have_text(codigoPedido)
  expect(page).to have_text(codigoProduto)
end

And ("Eu estou na pagina dos pedidos") do
  visit '/pedidos'
  expect(page).to have_text('Pedidos')
end

When ("Eu clico na opcao visualizar pedido no pedido de codigo {string}") do |codigoPedido|
  click_link 'ShowPedido'
  expect(page).to have_text(codigoPedido)
end

Then("Eu vejo que o pedido de codigo {string} foi recebido com sucesso") do |_codigoPedido|
  expect(page).to have_text('efetuado')
end

When("Eu entro na pagina dos pedidos") do
  visit '/pedidos'
end

Then ('Eu consigo visualizar todos os pedidos efetuados') do
  expect(page).to have_text('Pedidos')
end

And ("Eu clico na opcao aceitar pedido") do
  click_button 'aceitarPedido'
  expect(page).to have_text('aprovado')
end

Then ("Eu vejo que o pedido de codigo {string} foi aceito com sucesso") do |_codigoPedido|
  click_button 'finalizarPedidoAdm'
  expect(page).to have_text('entregue')
end

And ("Eu clico na opcao recusar pedido") do
  click_button 'cancelarPedido'
end

Then ("Eu vejo que o pedido de codigo {string} foi cancelado com sucesso") do |_codigoPedido|
  expect(page).to have_text('cancelado')
end

And ("Eu clico na opcao reabrir pedido") do
  click_button 'refazerPedido'
end

Then ("Eu vejo que o pedido de codigo {string} foi reaberto com sucesso") do |_codigoPedido|
  expect(page).to have_text('efetuado')
end