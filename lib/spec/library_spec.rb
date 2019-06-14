require 'spec_helper'


describe "Library Object" do

  before :all do
    lib_arr = [
      Book.new("testTitle100", "testAuthor100", :testcat),
      Book.new("testTitle101", "testAuthor101", :testcat),
      Book.new("testTitle102", "testAuthor102", :testcat101),
      Book.new("testTitle103", "testAuthor103", :testcat101),
      Book.new("testTitle104", "testAuthor104", :testcat101)
    ]

    File.open("books.yml", "w") do |file|
      file.write(YAML::dump(lib_arr))
    end
  end

  before :each do
    @lib = Library.new("books.yml")
  end

  describe "#new" do
    context "with no arguments" do
      it "has no books" do
        lib = Library.new
        expect(lib.books.length).to eq(0)
      end
    end

    context "with a yaml name argument" do
      it "has one book" do
        expect(@lib.books.length).to eq(5)
      end
    end
  end

  it "returns all books in a given category" do
    expect(@lib.get_books_in_category(:testcat101).length).to eq(3)
  end
end