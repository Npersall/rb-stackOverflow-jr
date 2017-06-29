
num_users = 5

num_users.times do |n|
  user1 = User.create(username: Faker::Name.name, password: 'password')
  user2 = User.create(username: Faker::Name.name, password: 'password')

  # first user asks question
  user1.questions.create(title: "#{user1.username} Question Title", body: "#{user1.username} Question Body")

  # second user answers that question
  user2.answers.create(body: "#{user2.username} Answer Body", question: Question.last, best_answer: false )
end

