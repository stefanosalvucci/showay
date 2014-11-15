class HomeController < ApplicationController
  layout 'application'

  def search
  end

  def offer
  end

  def pins
    fixed_geometries = [
      [51.507351, -0.127758],
      [48.856614, 2.352222],
      [41.872389, 12.480180]
    ]

    render json: generate_geometries_from(fixed_geometries)
  end

  def generate_geometries_from fixed_geometries
    count = 1
    geometries = {}
    fixed_geometries.each do |fg|
      30.times do
        geometries[count] = random_element(fg)
        count +=1
      end
    end
    geometries
  end

  def random_element geometry
    obj = {
      lat: geometry[0] + random_distance,
      lon: geometry[1] + random_distance,
      name: random_name,
      surname: random_surname,
      text: random_text,
      rating: random_rating,
      rating_count: random_rating_count,
      user_picture: "http://www.ligurianotizie.it/wp-content/uploads/2014/06/massimo-ferrero.gif"
    }
    obj['infowindow'] = render_infowindow(obj)
    puts obj
    obj
  end

  def random_distance
    (rand / 10) * ([1,-1].sample)
  end

  def random_name
    %w"Mario Luca Paolo Andrea Carlo Daniele Stefano Simone Patrizio Giuseppe Giacomo Francesco Giorgio".sample
  end

  def random_surname
    %w"Olivieri Salvucci Rocchetta Franchi Marino Alemanno Aurelia Saniti Renati Marapoti Secolare Taddei Totti".sample
  end

  def random_rating
    [1,2,3,4,5].sample
  end

  def random_rating_count
    rand 150
  end

  def random_text
    [
      "Food Tour around the best restaurant of the city. I'm a really social guy, it will be a great thing to do!",
      "Driving Tour and Vintage Shops: these are my biggest passions, I'll be really glad to share my favourite places with you.",
      "Wanna go to disco? Wanna have fun with a crazy guy?. Book me, I'll be your Cicerone.",
      "Gardens Private Small-Group Walking Tour: want to relax with a zen enviromnent and escape from the chaos of this city? Join me and my zen culture.",
      "5-Hour Private Cooking Class: I'm from Italy, you'll not be dissappointed of my recipes :)",
      "2-Hour Ghost Walk and Paranormal Tour. Truly unbelievable. Everytime I do time I'm scared like the first time. If you like mistery you cannot miss it!",
      "Bike Tour: Monuments and Hidden Gems. You'll be amazed by the beauty of this city. You cannot even imagine what kind of things are hidden here."
    ].sample
  end

  def render_infowindow(obj)
    puts obj
    "
      <div class='guide-top'>
        <div class='user_picture'>
          <img src='#{obj[:user_picture]}' id='user_picture'>
        </div>
        <div class='user_desc'>
          <span id='user_name'>#{obj[:name]}</span>
          <span id='user_surname'>#{obj[:surname]}</span><br>
          <div class='rating-value' data-average='#{obj[:rating] * 4}'></div><a><small>(#{obj[:rating_count]})</small></a>
        </div>
      </div>
      <div class='clearfix'></div>
      <div class='description'>
        <p id='description'>#{obj[:text]}</p>
      </div>
      <hr>
      <div class='buttons'>
        <a href=''>Profilo</a>
        <a href=''>Paga</a>
      </div>"
  end

  def stars_png
    send_file "#{Rails.root}/app/assets/images/stars.png", type: 'image/png', disposition: 'inline'
  end

  def small_png
    send_file "#{Rails.root}/app/assets/images/small.png", type: 'image/png', disposition: 'inline'
  end
end