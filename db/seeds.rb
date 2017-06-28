seed_users = []

sam_admin = User.create(
  email: 'sfd1987@gmail.com',
  name: 'Sam David',
  password: "test123"
)

sam_admin.add_role :admin
sam_admin.skip_confirmation!
sam_admin.save
seed_users.push(sam_admin)

sam_normal = User.create(
  email: 'sfd87@aol.com',
  name: 'Sam David',
  password: "test123"
)
sam_normal.skip_confirmation!
sam_normal.save
seed_users.push(sam_normal)

another_normal = User.create(
  email: 'test@test.com',
  name: 'Test User',
  password: "test123"
)
another_normal.skip_confirmation!
another_normal.save
seed_users.push(another_normal)

seed_users.each do |user|
  50.times do
    current_expense = Expense.create(
      amount: Faker::Number.decimal(2),
      description: Faker::Lorem.sentences(1)[0],
      transaction_date: Faker::Date.between(5.months.ago, Date.today),
      user_id: user.id
    )
  end
end
