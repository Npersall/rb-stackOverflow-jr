
num_users = 20
users = User.all

num_users.times do |n|
  user1 = User.create(username: Faker::Name.first_name, password: 'password')
  user2 = User.create(username: Faker::Name.first_name, password: 'password')

  users << user1
  users << user2

  pokemon = Faker::Pokemon.name

  # first user asks question
  question = user1.questions.create(title: "Where is #{pokemon} located?", body: "I would like to know where #{pokemon} is located. Does anyone know?")

  # second user answers that question
  answer = user2.answers.create(body: "Probably #{Faker::Pokemon.location}.", question: Question.last, best_answer: false )

  # 3 comments from random users for question and answer
  3.times do |n|
    question.comments.create(commenter: users.sample, body: "I prefer to know about #{Faker::Pokemon.name}'s location.")
    answer.comments.create(commenter: users.sample, body: "No I think it's at #{Faker::Pokemon.location}")
  end

  # 50 random votes from random users for question and answer
  50.times do |n|
    question.votes.create(voter: users.sample, vote_direction: [-1,1].sample)
    answer.votes.create(voter: users.sample, vote_direction: [-1,1].sample)
  end
end
