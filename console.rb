require('pry')
require_relative('./models/Property.rb')

property1 = Property.new({
  'address' => '333 New Street',
  'value' => '£90,000',
  'bedrooms' => 1,
  'type' => 'flat'
  })

property1.save()

property2 = Property.new({
  'address' => '444 Old Street',
  'value' => '£150,000',
  'bedrooms' => 2,
  'type' => 'semi-detached'
  })

property2.save()

property3 = Property.new({
  'address' => '555 Sunset Avenue',
  'value' => '£900,000',
  'bedrooms' => 3,
  'type' => 'detached'
  })

property3.save()
# property2.delete()
property1.value = "£140.000"
property1.update()

# found_property = Property.find(property1.id)
found_property = Property.find_by_address(property1.address)

binding.pry
nil
