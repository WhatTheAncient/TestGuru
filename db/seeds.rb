# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
  { title: 'Backend' },
  { title: 'Frontend' },
  { title: 'Math' }
]

users = [
  { name: 'Math Teacher', email: 'math_teacher@rambler.com' },
  { name: 'Programming Teacher', email: 'programming_teacher@google.com' },
  { name: 'John', email: 'john_2000@google.com' },
  { name: 'Vladimir', email: 'vladimir_an@yandex.ru' },
  { name: 'Anna', email: 'ann_1999@yandex.ru' }
]

categories = Category.create!(categories)
users = User.create!(users)

tests = [
  { title: 'HTML', category: categories[0], author: users[1] },
  { title: 'CSS', category: categories[1], author: users[1] },
  { title: 'Algorithms', level: 3, category: categories[2], author: users[0] },
  { title: 'Data Structures', level: 2, category: categories[0], author: users[1] },
  { title: 'Ruby', level: 2, category:  categories[0], author: users[1] },
  { title: 'Rails', level: 3, category: categories[0], author: users[1] },
  { title: 'Linear Algebra', level: 4, category: categories[2], author: users[0] },
  { title: 'Discrete Math', level: 3, category: categories[2], author: users[0] }
]

tests = Test.create!(tests)

questions = [
  { title: 'What <b> block does?', test: tests[0] },
  { title: 'How to center button in window?', test: tests[1] },
  { title: 'Name 3 sorting algorithms:', test: tests[2] },
  { title: 'In which data structure each element has 2 links?', test: tests[3] },
  { title: 'Which class is superclass for Class?', test: tests[4] },
  { title: 'Which module is responsible for working with database?', test: tests[5] },
  { title: 'What is Gram matrix?', test: tests[6] },
  { title: 'Select existing graph types:', test: tests[7] }
]

questions = Question.create!(questions)

answers = [
  { title: 'Make text cursive', question: questions[0] },
  { title: 'Set text in upper-case', question: questions[0] },
  { title: 'Make text bold', correct: true, question: questions[0] },
  { title: 'Button { margin: 0 auto; display: block; }', correct: true, question: questions[1] },
  { title: 'Button { margin: center; }', question: questions[1] },
  { title: 'Bubble sort', correct: true, question: questions[2] },
  { title: 'Quick sort', correct: true, question: questions[2] },
  { title: 'Selection sort', correct: true, question: questions[2] },
  { title: 'Injection sort', question: questions[2] },
  { title: 'Array', question: questions[3] },
  { title: 'Linked list', question: questions[3] },
  { title: 'Stack', question: questions[3] },
  { title: 'Double-linked list', correct: true, question: questions[3] },
  { title: 'Object', question: questions[4] },
  { title: 'BasicObject', question: questions[4] },
  { title: 'Module', correct: true, question: questions[4] },
  { title: 'ActiveRecord', correct: true, question: questions[5] },
  { title: 'ActiveSupport', question: questions[5] },
  { title: 'Matrix with ones in main diagonal', question: questions[6] },
  { title: 'Matrix of scalar multiplication in linear space', correct: true, question: questions[6] },
  { title: 'Linked', correct: true, question: questions[7] },
  { title: 'Not linked', correct: true, question: questions[7] },
  { title: 'Double-linked', question: questions[7] }
]

Answer.create!(answers)

results = [
  { user: users[2], test: tests[0] },
  { user: users[2], test: tests[1] },
  { user: users[2], test: tests[2] },
  { user: users[3], test: tests[1] },
  { user: users[3], test: tests[3] },
  { user: users[3], test: tests[5] },
  { user: users[3], test: tests[7] },
  { user: users[4], test: tests[0] },
  { user: users[4], test: tests[4] },
  { user: users[4], test: tests[6] }
]

Result.create!(results)
