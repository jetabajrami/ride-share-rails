require "test_helper"

describe PassengersController do
  describe "index" do
    it "responds with success when there are many passenger saved" do
      get "/passengers"
      must_respond_with :success
    end

    it "responds with success when there are no passenger" do
      get "/passengers" 
      must_respond_with :success
    end
  end

  describe "show" do
    before do
      @passenger = Passenger.create(name: "Cathy Something")
    end

    it "will get show for valid id" do
      valid_passanger_id = @passenger.id
      get "/passengers/#{valid_passanger_id}"
      must_respond_with :success
    end

    it "will respond with not_found for invalid ids" do
      invalid_passanger_id = -1
      get "/passengers/#{invalid_passanger_id}"
      must_respond_with :not_found
    end
  end

  describe "new" do
    it "resonse with succes" do
      get new_passenger_path
      must_respond_with :success
    end
  end
   

  describe "create" do
    it "can create a passanger" do
      passenger_hash = {
        passenger: {
          id: 10,
          name: "Cathy Cathy",
          phone_num: "8783 93093 3983",
        }
      }

      expect {
        post passengers_path, params: passenger_hash
      }.must_differ 'Passenger.count', 1
  
      must_respond_with :redirect
      must_redirect_to passenger_path(Passenger.last.id)

      expect(Passenger.last.name).must_equal passenger_hash[:passenger][:name]
      expect(Passenger.last.phone_num).must_equal passenger_hash[:passenger][:phone_num]
    end

    it "does not create a driver if the form data violates Driver validations, and responds with a redirect" do
      # Note: This will not pass until ActiveRecord Validations lesson
      # Arrange
      # Set up the form data so that it violates Driver validations
  
      # Act-Assert
      # Ensure that there is no change in Driver.count
  
      # Assert
      # Check that the controller redirects
  
    end
  end
  


  describe "edit" do
   it "responds with success when getting the edit page for an existing, valid driver" do
      # Arrange
      # Ensure there is an existing driver saved

      # Act

      # Assert
    end

   it "responds with redirect when getting the edit page for a non-existing driver" do
      # Arrange
      # Ensure there is an invalid id that points to no driver

      # Act

      # Assert
    end
  end

  describe "update" do
    before do
      Passenger.create(name: "We're all wonders", phone_num: "9340983094")
    end
    let (:new_passenger_hash) {
      {
        passenger: {
          name: "Cathy Cathy",
          phone_num: "90482309480924"
        },
      }
    }
    it "can update an existing passanger with valid information accurately, and redirect" do
      id = Passenger.first.id
      expect {
        patch passenger_path(id), params: new_passenger_hash
      }.wont_change "Passenger.count"

      passanger = Passenger.find_by(id: id)
      must_redirect_to passenger_path(passanger.id)
  
      expect(passanger.name).must_equal new_passenger_hash[:passenger][:name]
      expect(passanger.phone_num).must_equal new_passenger_hash[:passenger][:phone_num]
    end

    it "does not update any driver if given an invalid id, and responds with a 404" do
      id = -1
      expect {
        patch passenger_path(id), params: new_passenger_hash
      }.wont_change "Passenger.count"

      must_respond_with :not_found
    end
  
    it "does not create a driver if the form data violates Driver validations, and responds with a redirect" do
      # Note: This will not pass until ActiveRecord Validations lesson
      # Arrange
      # Ensure there is an existing driver saved
      # Assign the existing driver's id to a local variable
      # Set up the form data so that it violates Driver validations
  
      # Act-Assert
      # Ensure that there is no change in Driver.count
  
      # Assert
      # Check that the controller redirects
  
    end
  end
  
  describe "destroy" do
    it "destroys the driver instance in db when driver exists, then redirects" do
      # Arrange
      # Ensure there is an existing driver saved
  
      # Act-Assert
      # Ensure that there is a change of -1 in Driver.count
  
      # Assert
      # Check that the controller redirects
  
    end
  
    it "does not change the db when the driver does not exist, then responds with " do
      # Arrange
      # Ensure there is an invalid id that points to no driver
  
      # Act-Assert
      # Ensure that there is no change in Driver.count
  
      # Assert
      # Check that the controller responds or redirects with whatever your group decides
  
    end
  end
end



