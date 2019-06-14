require 'spec_helper'


describe "Library Object" do

  before :all do
    lib_arr = [
      Book.new("testTitle", "testAuthor", :testcat)
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
        expect(@lib.books.length).to eq(1)
      end
    end
  end
end