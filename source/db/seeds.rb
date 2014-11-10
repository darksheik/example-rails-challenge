# 1 company with 5 successful
company1 = Company.create(name: 'Awesome Company')
company1.charges.create([
  [amount:50,paid:true,refunded:false],
  [amount:60,paid:true,refunded:false],
  [amount:70,paid:true,refunded:false],
  [amount:80,paid:true,refunded:false],
  [amount:90,paid:true,refunded:false]
]
)

# 1 company with 3 successful, one disputed, one failed
company2 = Company.create(name: 'So-so company')
company2.charges.create([
  [amount:50,paid:true,refunded:false],
  [amount:60,paid:true,refunded:false],
  [amount:70,paid:true,refunded:false],
  [amount:80,paid:true,refunded:true],
  [amount:90,paid:false]
]
)

# 5 users with 1 successful charge
5.times { |t|
  User.create(
    first_name:'User',last_name:['Person',t+1].join,charges:[
      Charge.create(amount:20,paid:true,refunded:false)
    ]
  )
}

# 1 user with 2 disputed, 1 failed
questionable_user = User.create(first_name: 'Questionable', last_name:'User')
questionable_user.charges.create([
  [amount:70,paid:true,refunded:true],
  [amount:80,paid:true,refunded:true],
  [amount:90,paid:false]
]
)

# 3 failed
nasty_user = User.create(first_name: 'Nasty',last_name:'User')
nasty_user.charges.create([
  [amount:90,paid:false],
  [amount:90,paid:false],
  [amount:90,paid:false]
]
)

