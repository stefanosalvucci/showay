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
    {
      lat: geometry[0] + random_distance,
      lon: geometry[1] + random_distance,
      name: random_name,
      surname: random_surname,
      text: random_text,
      rating: random_rating,
      infowindow: "<div>ciao</div>",
      rating_count: random_rating_count
    }
  end

  def random_distance
    (rand / 10) * ([1,-1].sample)
  end

  def random_name
    %w"Mario Luca Sabrina Andrea Carlo Carlotta Stefano Ginevra Patrizia Giuseppe Giacomo Francesco Maria Elena M ".sample
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
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
      "testo a caso",
    ].sample
  end
end
