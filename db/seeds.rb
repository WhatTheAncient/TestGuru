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

tests = [
  { title: 'HTML', category_id: 2, author_id: 2 },
  { title: 'CSS', category_id: 2, author_id: 2 },
  { title: 'Algorithms', level: 3, category_id: 3, author_id: 1 },
  { title: 'Data Structures', level: 2, category_id: 1, author_id: 2 },
  { title: 'Ruby', level: 2, category_id: 1, author_id: 2 },
  { title: 'Rails', level: 3, category_id: 1, author_id: 2 },
  { title: 'Linear Algebra', level: 4, category_id: 3, author_id: 1 },
  { title: 'Discrete Math', level: 3, category_id: 3, author_id: 1 },
]

questions = [
  { title: 'What <b> block does?', test_id: 1 },
  { title: 'How to center button in window?', test_id: 2 },
  { title: 'Name 3 sorting algorithms:', test_id: 3 },
  { title: 'In which data structure each element has 2 links?', test_id: 4 },
  { title: 'Which class is superclass for Class?', test_id: 5 },
  { title: 'Which module is responsible for working with database?', test_id: 6 },
  { title: 'What is Gram matrix?', test_id: 7 },
  { title: 'Select existing graph types:', test_id: 8 },
]

answers = [
  { title: 'Make text cursive', question_id: 1 },
  { title: 'Set text in upper-case', question_id: 1 },
  { title: 'Make text bold', correct: true, question_id: 1 },
  { title: 'Button { margin: 0 auto; display: block; }', correct: true, question_id: 2 },
  { title: 'Button { margin: center; }', question_id: 2 },
  { title: 'Bubble sort', correct: true, question_id: 3 },
  { title: 'Quick sort', correct: true, question_id: 3 },
  { title: 'Selection sort', correct: true, question_id: 3 },
  { title: 'Injection sort', question_id: 3 },
  { title: 'Array', question_id: 4 },
  { title: 'Linked list', question_id: 4 },
  { title: 'Stack', question_id: 4 },
  { title: 'Double-linked list', correct: true, question_id: 4 },
  { title: 'Object', question_id: 5 },
  { title: 'BasicObject', question_id: 5 },
  { title: 'Module', correct: true, question_id: 5 },
  { title: 'ActiveRecord', correct: true, question_id: 6 },
  { title: 'ActiveSupport', question_id: 6 },
  { title: 'Matrix with ones in main diagonal', question_id: 7 },
  { title: 'Matrix of scalar multiplication in linear space', correct: true, question_id: 7 },
  { title: 'Linked', correct: true, question_id: 8 },
  { title: 'Not linked', correct: true, question_id: 8 },
  { title: 'Double-linked', question_id: 8 },
]

results = [
  { user_id: 3, test_id: 1, start: true },
  { user_id: 3, test_id: 2, start: true, finish: true },
  { user_id: 3, test_id: 3, start: true },
  { user_id: 4, test_id: 2, start: true, finish: true },
  { user_id: 4, test_id: 4, start: true, finish: true },
  { user_id: 4, test_id: 6, start: true },
  { user_id: 4, test_id: 8, start: true, finish: true },
  { user_id: 5, test_id: 1, start: true, finish: true },
  { user_id: 5, test_id: 5, start: true },
  { user_id: 5, test_id: 7, start: true, finish: true }
]

Category.create(categories)
User.create(users)
Test.create(tests)
Question.create(questions)
Answer.create(answers)
Result.create(results)