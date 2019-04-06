require 'rails_helper'

describe 'Users api' do
  before(:each) do
    @user = User.create(name: "User_1", email: "user_1@gmail.com", image_url: "user_1_photo.png")
    @event_1 = @user.events.create(name: "Desert Rats Trail Running Festival", city: "Fruita", state: "CO", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    @event_2 = @user.events.create(name: "FIBArk", city: "Salida", state: "CO", event_type: "rafting", price: 0, start_date: "06-13-2019", end_date: "06-16-2019", description: "America's Oldest Whitewater Festival", event_url: "http://www.fibark.com/", image_url: "http://www.fibark.com/wp-content/uploads/2014/01/sup-race.jpg", video_url: "https://www.youtube.com/embed/BNrYhKYf9OE")
  end
  it 'returns a single user with attributes and that users events' do
    get "/api/v1/users/#{@user.id}"

    expect(response.status).to eq(200)
    returned_user = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(returned_user[:id]).to eq(@user.id.to_s)
    expect(returned_user[:attributes][:name]).to eq(@user.name)
    expect(returned_user[:attributes][:email]).to eq(@user.email)
    expect(returned_user[:attributes][:image_url]).to eq(@user.image_url)
    expect(returned_user[:relationships][:events].length).to eq(2)
    expect(returned_user[:relationships][:events][0][:id]).to eq(@event_1.id.to_s)
    expect(returned_user[:relationships][:events][0][:name]).to eq(@event_1.name)
    expect(returned_user[:relationships][:events][1][:id]).to eq(@event_2.id.to_s)
    expect(returned_user[:relationships][:events][1][:name]).to eq(@event_2.name)
  end
end
