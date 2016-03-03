# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

img = File.open(Dir['app/assets/images/*.jpg'].sample)

  20.times do
    User.create(
      email: Faker::Internet.email,
      password: 'password',
      firstname: Faker::Name.name,
      lastname: Faker::Name.name,
      admin: Faker::Boolean.boolean(0.5)
    )
  end

  20.times do
    img = File.open(Dir['app/assets/images/*.jpg'].sample)
    Movie.create(
      title: Faker::Book.title,
      description: Faker::Lorem.sentence(20),
      image: img,
      director: Faker::StarWars.character,
      runtime_in_minutes: Faker::Number.between(50, 96),
      release_date: Faker::Date.backward(14)
    )
  end

  user_count = User.count
  movie_count = Movie.count

  20.times do
    user_offset = rand(user_count)
    movie_offset = rand(movie_count)
    Review.create(
      text: Faker::Lorem.sentence(3),
      user_id: User.offset(user_offset).first,
      movie_id: Movie.offset(movie_offset).first,
      rating_out_of_ten: Faker::Number.between(1, 10)
    )
  end



