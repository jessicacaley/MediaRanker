require "test_helper"

describe Homepage do
  let(:homepage) { Homepage.new }

  it "must be valid" do
    value(homepage).must_be :valid?
  end

  describe "self.top_media" do
    it "returns object of media" do
      expect(Homepage.top_media).must_be_kind_of Work
    end

    it "returns object of media with the most votes" do
    end

    it "returns nil if no media" do
      Work.all.each { |work| work.destroy }
      expect(Homepage.top_media).must_be_nil
    end
  end

  describe "self.top_ten" do
    it "returns an array of objects" do
      top_books = Homepage.top_ten("book")
      expect(top_books).must_be_kind_of Array
      expect(top_books.first).must_be_kind_of Work
    end

    it "returns an array of ten objects if more than ten of that media type exist" do
      top_books = Homepage.top_ten("book")
      expect(top_books.length).must_equal 10
    end

    it "returns an array of all objects of type if less than 10 exist" do
      all_movies = Work.where(category: "movie")
      top_movies = Homepage.top_ten("movie")
      assert top_movies.length < 10 # for sake of test, must be true
      expect(top_movies.length).must_equal all_movies.length
    end

    it "returns an empty array if no media of that type" do
      all_albums = Work.where(category: "album")
      all_albums.each { |album| album.destroy }

      expect(Work.where(category: "album").length).must_equal 0

      top_albums = Homepage.top_ten("album")
      expect(top_albums).must_be_kind_of Array
      expect(top_albums.length).must_equal 0
      expect(top_albums).must_equal []
    end

    it "returns the 10 objects of given type with most votes" do
    end
  end
end