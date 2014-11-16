class HomeController < ApplicationController
  layout 'application'

  def search
    @last_minute =[
      {
        img: 'http://www.donnamoderna.com/var/ezflow_site/storage/images/media/images/succede/alberto-sordi/alberto-sordi-sordi01/762215-1-ita-IT/alberto-sordi-sordi01_s_sonOr.jpg',
        description:'Food Tour',
        price: '20€'
      },
      {
        img: 'http://riccardos.com/images/uploads/SaturdayNightFever.jpg',
        description:'Disco Tour',
        price: '23€'
      },
      {
        img: 'http://www.iconsdb.com/icons/preview/orange/beer-xxl.png',
        description:'Best Pubs',
        price: '14€'
      },
      {
        img: 'http://www.younoodlecamp.com/wp-content/uploads/2013/04/startups_icon.png',
        description: 'Visit Startups',
        price: '2€'
      }
    ]
  end

  def team
  end

  def about
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
      accuracy: rand(5) + 1,
      experience: rand(5) + 1,
      reliability: rand(5) + 1,
      price: rand(20) + 5,
      duration: rand(3) + 1,
      review_1: random_review_1,
      review_1_pic: random_review_pic,
      review_2: random_review_2,
      review_2_pic: random_review_pic,
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

  def random_review_1
    [
      'Had such a great experience!',
      'Super sweet guy, a beautiful tour.'
    ].sample
  end

  def random_review_2
    [
      'Defenetely Recommended. +++',
      'I have nice memories.'
    ].sample
  end

  def random_review_pic
    %w"
    http://ashleybodi.com/wp-content/uploads/2010/06/angry-person-istock.jpg
    http://www.theedgesusu.co.uk/wp-content/uploads/2013/05/350634_0_lucy-porter-people-person_400-250x250.jpg
    http://ris.fashion.telegraph.co.uk/RichImageService.svc/imagecontent/1/TMG9044583/m/Kate-hat_2121801a.jpg
    http://guidetowomen.files.wordpress.com/2011/02/hear-no-evil-person-with-hands-over-ears.jpg
    http://democratici-digitali.com/sites/default/files/images2/alfio-marchini.jpg
    http://media.melty.it/article-2626566-square_300-f1409563835/massimo-ferrero-presidente-sampdoria.jpg
    http://zonanapoli.altervista.org/blog/wp-content/uploads/2014/10/ferrero-bruciato.jpg
    ".sample
  end

  def random_text
    [
      "Food Tour around the best restaurant of the city. I'm a really social guy, it will be a great thing to do!",
      "Driving Tour and Vintage Shops: these are my biggest passions, I'll be really glad to share my favorite places with you.",
      "Wanna go to disco? Wanna have fun with a crazy guy? Book me, I'll be your Cicerone.",
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
      <div class='skills'>
        <div class='score-row'>
          <h5>Accuracy</h5>
          <div class='rating-value-big' data-average='#{obj[:accuracy] * 4}'>
        </div>
        <div class='score-row'>
          <h5>Experience</h5>
          <div class='rating-value-big' data-average='#{obj[:experience] * 4}'>
        </div>
        <div class='score-row'>
          <h5>Reliability</h5>
          <div class='rating-value-big' data-average='#{obj[:reliability] * 4}'>
        </div>
      </div>
      <hr>
      <div class='reviews'>
        <h5>Last Reviews</h5>
        <table>
          <tr align='center'>
            <td>
              <img src='#{obj[:review_1_pic]}'>
            </td>
            <td>
              #{obj[:review_1]}
            </td>
          </tr>
          <tr align='center'>
            <td>
              <div class='separator'></div>
            </td>
          </tr>
          <tr align='center'>
            <td>
              <img src='#{obj[:review_2_pic]}'>
            </td>
            <td>
              #{obj[:review_2]}
            </td>
          </tr>
        </table>
      </div>
      <hr>
      <div class='price'>
        <span>#{obj[:price]}€</span><span class='duration'> - #{obj[:duration]} #{obj[:duration] > 1 ? 'Hours' : 'Hour'}</span>
      </div>
      <div class='buttons'>
        <button class='button btn-button book' href=''>BOOK</button>
      </div>"
  end

  def stars_png
    send_file "#{Rails.root}/app/assets/images/stars.png", type: 'image/png', disposition: 'inline'
  end

  def small_png
    send_file "#{Rails.root}/app/assets/images/small.png", type: 'image/png', disposition: 'inline'
  end

  def hightlight_soft
    send_file "#{Rails.root}/app/assets/images/ui-bg_highlight-soft_100_eeeeee_1x100.png", type: 'image/png', disposition: 'inline'
  end
end