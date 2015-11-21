# Penn transit API is broken. Will comment out these tests for now. 

# require "minitest/autorun"
# require "penn_sdk"

# describe PennSDK::Transit do
#   before do
#     @transit = PennSDK::Transit.new(ENV["TRANSIT_API_USERNAME"],
#                                     ENV["TRANSIT_API_PASSWORD"])
#   end

#   describe "stops" do
#     it "should have multiple stops" do
#       result = @transit.stops
#       assert result.size > 20
#     end
#   end

#   describe "configuration" do
#     it "should display many stops in the configuration" do
#       result = @transit.config
#       assert result["ConfigurationData"]["numStops"] > 100
#     end
#   end

#   describe "prediction" do
#     it "should have stop predictions" do
#       result = @transit.predict
#       assert_kind_of Array, result["PredictionData"]["StopPredictions"]
#     end
#   end

#   describe "arrivals" do
#     it "should have recents" do
#       result = @transit.arrived
#       assert_kind_of Array, result["ArrivalStatusData"]
#     end
#   end
# end
