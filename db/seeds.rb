
num_users = 5

num_users.times do |n|
  user1 = User.create(username: Faker::Name.name, password: 'password')
  user2 = User.create(username: Faker::Name.name, password: 'password')

  # first user asks question
  user1.questions.create(title: "#{user1.username} Question Title", body: "#{user1.username} Question Body")

  # second user answers that question
  user2.answers.create(body: "#{user2.username} Answer Body", question: Question.last, best_answer: false )
end

users = User.all
questions = Question.all
answers = Answer.all

# create comments for Q & As
questions.each do |question|
  # 3 comments from random users
  question.comments.create(commenter: users.sample, body: Faker::Pokemon.name)
  question.comments.create(commenter: users.sample, body: Faker::Pokemon.name)
  question.comments.create(commenter: users.sample, body: Faker::Pokemon.name)

  # 3 votes from random users
  question.votes.create(voter: users.sample, vote_direction: 1)
  question.votes.create(voter: users.sample, vote_direction: 1)
  question.votes.create(voter: users.sample, vote_direction: -1)
end

answers.each do |answer|
  # 3 comments from random users
  answer.comments.create(commenter: users.sample, body: Faker::Pokemon.name)
  answer.comments.create(commenter: users.sample, body: Faker::Pokemon.name)
  answer.comments.create(commenter: users.sample, body: Faker::Pokemon.name)

  # 3 votes from random users
  answer.votes.create(voter: users.sample, vote_direction: 1)
  answer.votes.create(voter: users.sample, vote_direction: 1)
  answer.votes.create(voter: users.sample, vote_direction: -1)
end
