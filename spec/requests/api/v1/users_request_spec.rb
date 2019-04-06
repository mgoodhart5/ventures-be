require 'rails_helper'

describe 'Users API' do
  before(:each) do
    @user = User.create(name: "User_1", email: "user_1@gmail.com", image_url: "user_1_photo.png", bio: "User_1 bio")
    @event_1 = Event.create(name: "Desert Rats Trail Running Festival", city: "Fruita", state: "CO", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    @event_2 = Event.create(name: "FIBArk", city: "Salida", state: "CO", event_type: "rafting", price: 0, start_date: "06-13-2019", end_date: "06-16-2019", description: "America's Oldest Whitewater Festival", event_url: "http://www.fibark.com/", image_url: "http://www.fibark.com/wp-content/uploads/2014/01/sup-race.jpg", video_url: "https://www.youtube.com/embed/BNrYhKYf9OE")
    @event_3 = Event.create(name: "Crested Butte Bike Week", city: "Crested Butte", state: "CO", event_type: "biking", price: 0, start_date: "06-27-2019", end_date: "06-30-2019", description: "Bike week is a multi-day celebration of all things mountain bike in the Gunnison Valley. We still have the big thigh burner of a singletrack race, the Fat Tire 40, but now CB Bike Week is more of a celebration of how mountain biking defines our community in the summer. Join us for clinics, a film festival, the Chainless Downhill World Championships, good beer, and a great party.", event_url: "http://www.cbchamber.com/chamberevents/cb-bike-week/", image_url: "https://travelcrestedbutte.com/wp-content/uploads/bike-week-feature.jpg", video_url: "https://www.youtube.com/embed/0cFSZCDMP_U")

    @user_event_1 = UserEvent.create(user: @user, event: @event_1, status: 0)
    @user_event_2 = UserEvent.create(user: @user, event: @event_2, status: 1)
  end
  it 'returns a single user with attributes' do
    get "/api/v1/users/#{@user.id}"

    expect(response.status).to eq(200)
    returned_user = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(returned_user[:id]).to eq(@user.id.to_s)
    expect(returned_user[:attributes][:name]).to eq(@user.name)
    expect(returned_user[:attributes][:email]).to eq(@user.email)
    expect(returned_user[:attributes][:image_url]).to eq(@user.image_url)
    expect(returned_user[:attributes][:bio]).to eq(@user.bio)
  end
  it 'returns a single users events with attributes' do
    get "/api/v1/users/#{@user.id}/events"

    expect(response.status).to eq(200)
    user_events = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(user_events.length).to eq(2)
    expect(user_events.first[:id]).to eq(@event_1.id.to_s)
    expect(user_events.first[:attributes][:name]).to eq(@event_1.name)
    expect(user_events.first[:attributes][:city]).to eq(@event_1.city)
    expect(user_events.first[:attributes][:state]).to eq(@event_1.state)
    expect(user_events.first[:attributes][:price]).to eq(@event_1.price)
    expect(user_events.first[:attributes][:event_type]).to eq(@event_1.event_type)
    expect(user_events.first[:attributes][:start_date]).to eq(@event_1.start_date)
    expect(user_events.first[:attributes][:end_date]).to eq(@event_1.end_date)
    expect(user_events.first[:attributes][:description]).to eq(@event_1.description)
    expect(user_events.first[:attributes][:image_url]).to eq(@event_1.image_url)
    expect(user_events.first[:attributes][:event_url]).to eq(@event_1.event_url)
    expect(user_events.first[:attributes][:video_url]).to eq(@event_1.video_url)
    expect(user_events.first[:attributes][:status]).to eq(@user_event_1.status)
    expect(user_events.last[:id]).to eq(@event_2.id.to_s)
    expect(user_events.last[:attributes][:name]).to eq(@event_2.name)
    expect(user_events.last[:attributes][:status]).to eq(@user_event_2.status)
  end
  it 'can update a user name' do
    new_name = "New Name"
    put "/api/v1/users/#{@user.id}", params: { name: new_name }

    expect(response.status).to eq(200)
    user = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(user[:id]).to eq(@user.id.to_s)
    expect(user[:attributes][:name]).to eq(new_name)
    expect(user[:attributes][:email]).to eq(@user.email)
    expect(user[:attributes][:image_url]).to eq(@user.image_url)
    expect(user[:attributes][:bio]).to eq(@user.bio)
  end
  it 'create a new user_event with no status specified' do
    post "/api/v1/users/#{@user.id}/events/#{@event_3.id}"

    expect(response.status).to eq(201)
    event = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(event[:id]).to eq(@event_3.id.to_s)
    expect(event[:attributes][:name]).to eq(@event_3.name)
    expect(event[:attributes][:city]).to eq(@event_3.city)
    expect(event[:attributes][:state]).to eq(@event_3.state)
    expect(event[:attributes][:price]).to eq(@event_3.price)
    expect(event[:attributes][:event_type]).to eq(@event_3.event_type)
    expect(event[:attributes][:start_date]).to eq(@event_3.start_date)
    expect(event[:attributes][:end_date]).to eq(@event_3.end_date)
    expect(event[:attributes][:description]).to eq(@event_3.description)
    expect(event[:attributes][:image_url]).to eq(@event_3.image_url)
    expect(event[:attributes][:event_url]).to eq(@event_3.event_url)
    expect(event[:attributes][:video_url]).to eq(@event_3.video_url)
    expect(event[:attributes][:status]).to eq('wishlist')
  end
  it 'create a new user_event with an attending status specified' do
    post "/api/v1/users/#{@user.id}/events/#{@event_3.id}?status=attending"

    expect(response.status).to eq(201)
    event = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(event[:id]).to eq(@event_3.id.to_s)
    expect(event[:attributes][:name]).to eq(@event_3.name)
    expect(event[:attributes][:city]).to eq(@event_3.city)
    expect(event[:attributes][:state]).to eq(@event_3.state)
    expect(event[:attributes][:price]).to eq(@event_3.price)
    expect(event[:attributes][:event_type]).to eq(@event_3.event_type)
    expect(event[:attributes][:start_date]).to eq(@event_3.start_date)
    expect(event[:attributes][:end_date]).to eq(@event_3.end_date)
    expect(event[:attributes][:description]).to eq(@event_3.description)
    expect(event[:attributes][:image_url]).to eq(@event_3.image_url)
    expect(event[:attributes][:event_url]).to eq(@event_3.event_url)
    expect(event[:attributes][:video_url]).to eq(@event_3.video_url)
    expect(event[:attributes][:status]).to eq('attending')
  end
end
