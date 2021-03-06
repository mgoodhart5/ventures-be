require 'rails_helper'

describe 'Events API' do
  before(:each) do
    @event_1 = Event.create(name: "Desert Rats Trail Running Festival", city: "Fruita", state: "CO", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    @event_2 = Event.create(name: "FIBArk", city: "Salida", state: "CO", event_type: "rafting", price: 0, start_date: "06-13-2019", end_date: "06-16-2019", description: "America's Oldest Whitewater Festival", event_url: "http://www.fibark.com/", image_url: "http://www.fibark.com/wp-content/uploads/2014/01/sup-race.jpg", video_url: "https://www.youtube.com/embed/BNrYhKYf9OE")
  end
  it 'returns all of the events with attributes' do
    get "/api/v1/events"

    expect(response.status).to eq(200)
    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(results[0]).to have_key(:id)
    expect(results[0][:type]).to eq("event")
    expect(results.length).to eq(2)
    expect(results[0][:attributes][:name]).to eq(@event_1.name)
    expect(results[0][:attributes][:city]).to eq(@event_1.city)
    expect(results[0][:attributes][:state]).to eq(@event_1.state)
    expect(results[0][:attributes][:price]).to eq(@event_1.price)
    expect(results[0][:attributes][:event_type]).to eq(@event_1.event_type)
    expect(results[0][:attributes][:start_date]).to eq(@event_1.start_date)
    expect(results[0][:attributes][:end_date]).to eq(@event_1.end_date)
    expect(results[0][:attributes][:description]).to eq(@event_1.description)
    expect(results[0][:attributes][:event_url]).to eq(@event_1.event_url)
    expect(results[0][:attributes][:image_url]).to eq(@event_1.image_url)
    expect(results[0][:attributes][:video_url]).to eq(@event_1.video_url)
    expect(results[1][:attributes][:name]).to eq(@event_2.name)
  end
  it 'returns a single event with attributes' do
    get "/api/v1/events/#{@event_2.id}"
    
    expect(response.status).to eq(200)
    results = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(results[:id]).to eq(@event_2.id.to_s)
    expect(results[:attributes][:name]).to eq(@event_2.name)
    expect(results[:attributes][:city]).to eq(@event_2.city)
    expect(results[:attributes][:state]).to eq(@event_2.state)
    expect(results[:attributes][:price]).to eq(@event_2.price)
    expect(results[:attributes][:event_type]).to eq(@event_2.event_type)
    expect(results[:attributes][:start_date]).to eq(@event_2.start_date)
    expect(results[:attributes][:end_date]).to eq(@event_2.end_date)
    expect(results[:attributes][:description]).to eq(@event_2.description)
    expect(results[:attributes][:event_url]).to eq(@event_2.event_url)
    expect(results[:attributes][:image_url]).to eq(@event_2.image_url)
    expect(results[:attributes][:video_url]).to eq(@event_2.video_url)
  end
  it 'returns events filtered by event_type' do
    event_3 = Event.create(name: "Running 3", city: "Fruita", state: "CO", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    event_type = 'running'
    get "/api/v1/events?event_type=#{event_type}"
    
    expect(response.status).to eq(200)
    events = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(events.count).to eq(2)
    expect(events[0][:id]).to eq(@event_1.id.to_s)
    expect(events[0][:attributes][:name]).to eq(@event_1.name)
    expect(events[1][:id]).to eq(event_3.id.to_s)
    expect(events[1][:attributes][:name]).to eq(event_3.name)
  end
  it 'returns events filtered by abbreviated state' do
    event_3 = Event.create(name: "Running 3", city: "Fruita", state: "CA", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    state = 'CO'
    get "/api/v1/events?state=#{state}"
    
    expect(response.status).to eq(200)
    events = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(events.count).to eq(2)
    expect(events[0][:id]).to eq(@event_1.id.to_s)
    expect(events[0][:attributes][:name]).to eq(@event_1.name)
    expect(events[1][:id]).to eq(@event_2.id.to_s)
    expect(events[1][:attributes][:name]).to eq(@event_2.name)
  end
  it 'returns events filtered by month' do
    event_3 = Event.create(name: "Running 3", city: "Fruita", state: "CA", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    month = 4
    get "/api/v1/events?month=#{month}"
    
    expect(response.status).to eq(200)
    events = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(events.count).to eq(2)
    expect(events[0][:id]).to eq(@event_1.id.to_s)
    expect(events[0][:attributes][:name]).to eq(@event_1.name)
    expect(events[1][:id]).to eq(event_3.id.to_s)
    expect(events[1][:attributes][:name]).to eq(event_3.name)
  end
  it 'returns events filtered by a combination of state, month, and event_type' do
    event_3 = Event.create(name: "Running 3", city: "Fruita", state: "CA", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    event_4 = Event.create(name: "Running 4", city: "Fruita", state: "CO", event_type: "running", price: 120, start_date: "04-13-2019", end_date: "04-14-2019", description: "A weekend of fun and running on the beautiful trails near Fruita, Colorado. The weekend includes a Trail Marathon & 50K races along with an Awards Party on Saturday, and 10K & Half Marathon races on Sunday.", event_url: "https://geminiadventures.com/trail-running-festival/", image_url: "https://geminiadventures.com/trail-running-festival/", video_url: "https://www.youtube.com/embed/UxVKnb8DMYQ")
    month = 4
    event_type = 'running'
    state = 'CO'
    get "/api/v1/events?month=#{month}&event_type=#{event_type}&state=#{state}"
    
    expect(response.status).to eq(200)
    events = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(events.count).to eq(2)
    expect(events[0][:id]).to eq(@event_1.id.to_s)
    expect(events[0][:attributes][:name]).to eq(@event_1.name)
    expect(events[1][:id]).to eq(event_4.id.to_s)
    expect(events[1][:attributes][:name]).to eq(event_4.name)
  end
end
