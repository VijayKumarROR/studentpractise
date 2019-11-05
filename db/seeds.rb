# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Exam.destroy_all

Exam.create([
	{id: 1, name: 'Half Early Exam'},
	{id: 2, name: 'Annual Exam'}])

Subject.destroy_all

Subject.create([
	{id: 1,name: 'Maths', exam_id: 1},
	{id: 2,name: 'Science', exam_id: 2}])

Topic.destroy_all

Topic.create(id: 1, name: 'Number', subject_id: 1)
Topic.create(id: 2, name: 'Graph', subject_id: 1)


Chapter.destroy_all

Chapter.create([
	{id: 1, name: 'Real Number Systems', topic_id: 1},
	{id: 2, name: 'Measurements', topic_id: 2},
	{id: 3, name: 'Geometry', topic_id: 2},
	{id: 4, name: 'Graph Chart', topic_id: 2}
	])

Question.destroy_all

Question.create([
	{id: 1, name: 'Choose an Even number?', chapter_id: 1},
	{id: 2, name: 'Choose an odd number?', chapter_id: 1},
	{id: 3, name: '5+5 = ?', chapter_id: 1},
	{id: 4, name: 'Choose your favorite language?', chapter_id: 2},
	{id: 5, name: 'The additive identity of rational numbers is', chapter_id: 1},
	{id: 6, name: 'The multiplicative inverse of -7 is', chapter_id: 1},
	{id: 7, name: '__ has no reciprocal', chapter_id: 1},
	{id: 8, name: 'How many quadrants', chapter_id: 4},
	{id: 9, name: 'X-axis known as', chapter_id: 4},
	{id: 10, name: 'Y-axis known as', chapter_id: 4},
	])

Answer.destroy_all
Answer.create([
	{id: 1, key_answer: '1', question_id: 1},
	{id: 2, key_answer: '2', question_id: 1},
	{id: 3, key_answer: '2', question_id: 2},
	{id: 4, key_answer: '3', question_id: 2},
	{id: 5, key_answer: '5', question_id: 3},
	{id: 6, key_answer: '10', question_id: 3},
	{id: 7, key_answer: 'Ruby on Rails', question_id: 4},
	{id: 8, key_answer: 'NodeJs', question_id: 4},
	{id: 9, key_answer: '0', question_id: 5},
	{id: 10, key_answer: '1', question_id: 5},
	{id: 11, key_answer: '-7', question_id: 6},
	{id: 12, key_answer: '-1/7', question_id: 6},
	{id: 13, key_answer: '1', question_id: 7},
	{id: 14, key_answer: '0', question_id: 7},
	{id: 15, key_answer: '1', question_id: 8},
	{id: 16, key_answer: '4', question_id: 8},
	{id: 17, key_answer: 'Vertical Axis', question_id: 9},
	{id: 18, key_answer: 'Horizontal Axis', question_id: 9},
	{id: 19, key_answer: 'Vertical Axis', question_id: 10},
	{id: 20, key_answer: 'Horizontal Axis', question_id: 10}
	])