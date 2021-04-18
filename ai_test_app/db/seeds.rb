first_name = [
  "albert",
  "marie",
  "issac",
  "galileo"
]

last_name = [
  "einstein",
  "curie",
  "newton",
  "galilei"
]

email = [
  "ae@relativity.com",
  "mc@radiation.com",
  "in@gravity.com",
  "gg@astronomy.com"
]

email.each_with_index do |email, index|
  User.create first_name: first_name[index], last_name: last_name[index], email: email
end