require 'rails_helper'

Capybara.server = :puma, { Silent: true } 
 
Capybara.register_driver :chrome_headless do |app| 
    options = ::Selenium::WebDriver::Chrome::Options.new 
   
    options.add_argument('--headless') 
    options.add_argument('--no-sandbox') 
    options.add_argument('--disable-dev-shm-usage') 
    options.add_argument('--window-size=1400,1400') 
   
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options) 
end 
 
Capybara.javascript_driver = :chrome_headless 
 
 
 
# Tests 
 
RSpec.configure do |config| 
    config.before(:each, type: :system) do 
      driven_by :rack_test 
    end 
   
    config.before(:each, type: :system, js: true) do 
      driven_by :chrome_headless 
    end 
end

# Revisamos la Funcionalidad de Agregar Películas

RSpec.describe 'Movies', type: :system do
    # Creamos la película
    before do

        # Limpiamos la base de datos antes y después del testeo para asegurar independencia
        RSpec.configure do |config|

            config.before(:suite) do
              DatabaseCleaner.strategy = :transaction
              DatabaseCleaner.clean_with(:truncation)
            end
          
            config.around(:each) do |example|
              DatabaseCleaner.cleaning do
                    example.run
                end
            
                config.after(:each) do
                    DatabaseCleaner.clean
                end
            end
        end

        visit '/movies/new'
        fill_in 'Title', with: 'John Wick 4'
        fill_in 'Image', with: 'https://i2.wp.com/hipertextual.com/wp-content/uploads/2021/06/john-wick.jpeg?fit=1200%2C675&ssl=1'
        click_button 'Create Movie'
    end

    # Revisamos que esté en todas la películas
    it 'create' do
        visit '/movies'
        within '.structure_of_index_of_movies' do

            expect(page).to have_selector('.movies_in_index_of_movies', count: 10)

            within all('.movies_in_index_of_movies').last do
                expect(page).to have_content('John Wick 4')
            end
        end
    end
end

# Revisamos la Visualización de Películas

RSpec.describe 'Movies', type: :system do
    it 'index' do
        visit '/movies'
        expect(page).to have_css('.structure_of_index_of_movies')
        page.find('.structure_of_index_of_movies', visible: :all)
        within '.structure_of_index_of_movies' do

            # Chequeamos que la cantidad de películas coincida
            expect(page).to have_selector('.movies_in_index_of_movies', count: 9)

            # Chequeamos los datos de la película
            within first('.movies_in_index_of_movies') do
                expect(page).to have_content('Matinee 17:00 - 19:00')
                expect(page).to have_content('Toy Story 4')
            end
        end
    end
end


# Revisamos la Funcionalidad Reserva de Asientos

RSpec.describe 'Reservations', type: :system do
    before do 

        RSpec.configure do |config|

            config.before(:suite) do
              DatabaseCleaner.strategy = :transaction
              DatabaseCleaner.clean_with(:truncation)
            end
          
            config.around(:each) do |example|
              DatabaseCleaner.cleaning do
                    example.run
                end
            
                config.after(:each) do
                    DatabaseCleaner.clean
                end
            end
          
        end

        visit 'reservations/new?hour_id=4'
        check 'reservation_seat_3'
        click_button 'Create Reservation'
        expect(page).to have_content('Reservation was successfully created.')
    end
    
    # Chequeamos la resera está correcta
    it 'index' do
        visit '/reservations'
        expect(page).to have_content('Reservations')
        expect(page).to have_css('.structure_of_index_of_movies')
        within '.structure_of_index_of_movies' do
            
            expect(page).to have_css('.movies_in_index_of_movies')

            within all('.movies_in_index_of_movies').last do
                expect(page).to have_content('Reservation number: ')
                expect(page).to have_content('Room: 2')
                expect(page).to have_content('Movie: Toy Story 4')
                expect(page).to have_content('Schedule: Matinee 17:00 - 19:00')
            end
        end
    end
end

# Revisamos la Visualización de la Reserva

RSpec.describe 'Reservation', type: :system do

    before do 

        RSpec.configure do |config|

            config.before(:suite) do
              DatabaseCleaner.strategy = :transaction
              DatabaseCleaner.clean_with(:truncation)
            end
          
            config.around(:each) do |example|
              DatabaseCleaner.cleaning do
                    example.run
                end
            
                config.after(:each) do
                    DatabaseCleaner.clean
                end
            end
          
        end

        # Creamos la reserva a testear
        visit 'reservations/new?hour_id=4'
        check 'reservation_seat_3'
        click_button 'Create Reservation'
        expect(page).to have_content('Reservation was successfully created.')
    end

    # Verificamos el asiento
    it 'confirmation' do
        visit '/hours/4'

        within '.blocks_of_columns' do
            within '.block_column' do
                within 'table' do
                    within 'tbody' do
                        within all('tr')[0] do

                            # Chequeamos que existe el asiento ocupado
                            expect(page).to have_css('.if_occupied')

                            # Verificamos que efectivamente el asiento ocupado es el 3
                            within all('td')[3] do
                                expect(page).to have_content('3')
                            end
                        end
                    end
                end
            end
        end
    end
end