# frozen_string_literal: true

RSpec.describe PhotoRenamer do
  it "has a version number" do
    expect(PhotoRenamer::VERSION).not_to be nil
  end

  it "renames the photos correctly" do
    result = PhotoRenamer.rename(
      "photo.jpg, Krakow, 2013-09-05 14:08:15\nMike.png, London, 2015-06-20 15:13:22\n"\
      "myFriends.png, Krakow, 2013-09-05 14:07:13\nEiffel.jpg, Florianopolis, 2015-07-23 08:03:02\n"\
      "pisatower.jpg, Florianopolis, 2015-07-22 23:59:59\nBOB.jpg, London, 2015-08-05 00:02:03\n"\
      "notredame.png, Florianopolis, 2015-09-01 12:00:00\nme.jpg, Krakow, 2013-09-06 15:40:22\n"\
      "a.png, Krakow, 2016-02-13 13:33:50\nb.jpg, Krakow, 2016-01-02 15:12:22\nc.jpg, Krakow, 2016-01-02 14:34:30\n"\
      "d.jpg, Krakow, 2016-01-02 15:15:01\ne.png, Krakow, 2016-01-02 09:49:09\nf.png, Krakow, 2016-01-02 10:55:32\n"\
      "g.jpg, Krakow, 2016-02-29 22:13:11\n"
    )

    expect(result).to eql(
      "Krakow02.jpg\nLondon1.png\nKrakow01.png\nFlorianopolis2.jpg\nFlorianopolis1.jpg\nLondon2.jpg\n"\
      "Florianopolis3.png\nKrakow03.jpg\nKrakow09.png\nKrakow07.jpg\nKrakow06.jpg\nKrakow08.jpg\nKrakow04.png\n"\
      "Krakow05.png\nKrakow10.jpg"
    )
  end


  it "renames the photos with duplicated names and locations correctly" do
    result = PhotoRenamer.rename(
      "Mike.png, London, 2015-06-20 15:13:22\na.png, Krakow, 2016-02-13 13:33:50\nb.png, Krakow, 2016-02-12 13:33:50\n"\
      "a.png, Krakow, 2016-02-11 13:33:50\nEiffel.jpg, Florianopolis, 2015-07-23 08:03:02"
    )

    expect(result).to eql(
      "London1.png\nKrakow3.png\nKrakow2.png\nKrakow1.png\nFlorianopolis1.jpg"
    )
  end

  it "renames only the photos with valid extensions and ignores the rest" do
    result = PhotoRenamer.rename(
      "Mike.pdf, London, 2015-06-20 15:13:22\na.png, Krakow, 2016-02-13 13:33:50\nb.png, Krakow, 2016-02-12 13:33:50\n"\
      "a.png, Krakow, 2016-02-11 13:33:50\nEiffel.jpg, Florianopolis, 2015-07-23 08:03:02\n"\
      "John.png, London, 2015-06-20 15:13:22"
    )

    expect(result).to eql(
      "Krakow3.png\nKrakow2.png\nKrakow1.png\nFlorianopolis1.jpg\nLondon1.png"
    )
  end
end
