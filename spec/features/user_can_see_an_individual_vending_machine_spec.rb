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
    machine_snacks = MachineSnack.create(snack_id: snack1.id, machine_id: dons.id)
    machine_snacks1 = MachineSnack.create(snack_id: snack2.id, machine_id: dons.id)
    visit machine_path(dons)


    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end

  scenario 'they see average price for all snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: 'Oreo', price: 2)
    snack2 = Snack.create(name: 'Mars', price: 1)
    machine_snacks = MachineSnack.create(snack_id: snack1.id, machine_id: dons.id)
    machine_snacks1 = MachineSnack.create(snack_id: snack2.id, machine_id: dons.id)
    
    visit machine_path(dons)


    expect(page).to have_content("average price : 1.5")

  end

  # As a user
  # When I visit a specific vending machine page
  # I also see an average price for all of the snacks in that machine
end
