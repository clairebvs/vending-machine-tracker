require 'rails_helper'

describe 'when a user visit a snack show page' do
  scenario 'they see the name of the snack, the price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: 'Oreo', price: 2)
    machine_snacks = MachineSnack.create(snack_id: snack1.id, machine_id: dons.id)

    visit snack_path(snack1)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
end

#   As a user
# When I visit a specific snack page
# I see the name of that snack
# I see the price for that snack
# I see a list of locations with vending machines that carry that snack
# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.
end
