require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see the name of all snacks from that machine with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: 'Oreo', price: 2)
    snack2 = Snack.create(name: 'Mars', price: 1)
    machine_snacks = MachineSnack.create(snack_id: snack1, machine_id: dons)
    machine_snacks = MachineSnack.create(snack_id: snack2, machine_id: dons)

    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end
=begin
  As a user
When I visit a specific vending machine page
I see the name of all of the snacks associated with that vending machine along with their price
=end
end
