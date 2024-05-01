User.create!([
  {name: "Dad", email: "dad@gmail.com", password: "password", birthdate: "1930-11-22"},
  {name: "Grandma", email: "grandma@gmail.com", password: "password", birthdate: "1999-03-09"}
])
Car.create!([
  {user_id: 2, model: "genesis", make: "hyundai", year: 2014, color: "black", rate: 67, seats: "4", transmission: "automatic", image_url: "https://cdn-fastly.autoguide.com/media/2023/06/08/12524149/2014-hyundai-genesis-coupe-priced-from-27-245.jpg?size=1200x628"},
  {user_id: 2, model: "gr86", make: "toyota", year: 2024, color: "grey", rate: 88, seats: "4", transmission: "manual", image_url: "https://www.usnews.com/object/image/0000018b-ab65-d133-a3ff-bbedf7590000/https-cars-dms-usnews-com-static-uploads-images-auto-custom-14704-original-2022-toyota-gr86-premium-29.jpg?update-time=1655945890000&size=responsiveGallery"},
  {user_id: 2, model: "camry", make: "toyota", year: 2004, color: "silver", rate: 55, seats: "5", transmission: "automatic", image_url: "https://www.edmunds.com/assets/m/toyota/camry/2002/oem/2002_toyota_camry_sedan_le-v6_fq_oem_1_500.jpg"},
  {user_id: 2, model: "civic", make: "honda", year: 2019, color: "white", rate: 59, seats: "5", transmission: "manual", image_url: "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/t7J2XQK_oL2.epEwFTgCi.jpeg"}
])
Booking.create!([
  {user_id: 2, car_id: 3, book_start: "2024-05-05", book_end: "2024-06-06", total_price: 1830.65}
])
