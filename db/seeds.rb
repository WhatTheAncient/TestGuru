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
  { name: 'Math Teacher' },
  { name: 'Programming Teacher' },
  { name: 'John' },
  { name: 'Vladimir' },
  { name: 'Anna' }
]

categories_id = []
users_id = []
tests_id = []
questions_id = []

Category.create!(categories)
categories_id = Category.ids.sort
User.create!(users).each
users_id = User.ids.sort

tests = [
  { title: 'HTML', category_id: categories_id[1], author_id: users_id[1] },
  { title: 'CSS', category_id: categories_id[1], author_id: users_id[1] },
  { title: 'Algorithms', level: 3, category_id:  categories_id[2], author_id: users_id[0] },
  { title: 'Data Structures', level: 2, category_id:  categories_id[0], author_id: users_id[1] },
  { title: 'Ruby', level: 2, category_id:  categories_id[0], author_id: users_id[1] },
  { title: 'Rails', level: 3, category_id:  categories_id[0], author_id: users_id[1] },
  { title: 'Linear Algebra', level: 4, category_id:  categories_id[2], author_id: users_id[0] },
  { title: 'Discrete Math', level: 3, category_id:  categories_id[2], author_id: users_id[0] },
]

Test.create!(tests)
tests_id = Test.ids.sort

questions = [
  { title: 'What <b> block does?', test_id: tests_id[0] },
  { title: 'How to center button in window?', test_id: tests_id[1] },
  { title: 'Name 3 sorting algorithms:', test_id: tests_id[2] },
  { title: 'In which data structure each element has 2 links?', test_id: tests_id[3] },
  { title: 'Which class is superclass for Class?', test_id: tests_id[4] },
  { title: 'Which module is responsible for working with database?', test_id: tests_id[5] },
  { title: 'What is Gram matrix?', test_id: tests_id[6] },
  { title: 'Select existing graph types:', test_id: tests_id[7] },
]

Question.create!(questions)
questions_id = Question.ids.sort

answers = [
  { title: 'Make text cursive', question_id: questions_id[0] },
  { title: 'Set text in upper-case', question_id: questions_id[0] },
  { title: 'Make text bold', correct: true, question_id: questions_id[0] },
  { title: 'Button { margin: 0 auto; display: block; }', correct: true, question_id: questions_id[1] },
  { title: 'Button { margin: center; }', question_id: questions_id[1] },
  { title: 'Bubble sort', correct: true, question_id: questions_id[2] },
  { title: 'Quick sort', correct: true, question_id: questions_id[2] },
  { title: 'Selection sort', correct: true, question_id: questions_id[2] },
  { title: 'Injection sort', question_id: questions_id[2] },
  { title: 'Array', question_id: questions_id[3] },
  { title: 'Linked list', question_id: questions_id[3] },
  { title: 'Stack', question_id: questions_id[3] },
  { title: 'Double-linked list', correct: true, question_id: questions_id[3] },
  { title: 'Object', question_id: questions_id[4] },
  { title: 'BasicObject', question_id: questions_id[4] },
  { title: 'Module', correct: true, question_id: questions_id[4] },
  { title: 'ActiveRecord', correct: true, question_id: questions_id[5] },
  { title: 'ActiveSupport', question_id: questions_id[5] },
  { title: 'Matrix with ones in main diagonal', question_id: questions_id[6] },
  { title: 'Matrix of scalar multiplication in linear space', correct: true, question_id: questions_id[6] },
  { title: 'Linked', correct: true, question_id: questions_id[7] },
  { title: 'Not linked', correct: true, question_id: questions_id[7] },
  { title: 'Double-linked', question_id: questions_id[7] },
]

Answer.create!(answers)

results = [
  { user_id: users_id[2], test_id: tests_id[0] },
  { user_id: users_id[2], test_id: tests_id[1] },
  { user_id: users_id[2], test_id: tests_id[2] },
  { user_id: users_id[3], test_id: tests_id[1] },
  { user_id: users_id[3], test_id: tests_id[3] },
  { user_id: users_id[3], test_id: tests_id[5] },
  { user_id: users_id[3], test_id: tests_id[7] },
  { user_id: users_id[4], test_id: tests_id[0] },
  { user_id: users_id[4], test_id: tests_id[4] },
  { user_id: users_id[4], test_id: tests_id[6] }
]

Result.create(results)