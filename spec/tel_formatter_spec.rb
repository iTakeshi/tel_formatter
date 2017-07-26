require "spec_helper"
require "tel_formatter"

describe TelFormatter do
  describe ".format" do
    it "returns hyphenated telephone number" do
      tel = "0300000000"
      expect(TelFormatter.format(tel)).to eq("03-0000-0000")
    end

    it "returns hyphenated telephone number based on split format 3 digit (eg Koganei, Tokyo) geo code" do
      tel = "0429991111"
      expect(TelFormatter.format(tel)).to eq("042-999-1111")
    end

    it "returns hyphenated telephone number based on split format 4 digit (eg Nishitama, Tokyo) geo code" do
      tel = "0428991111"
      expect(TelFormatter.format(tel)).to eq("0428-99-1111")
    end

    it "returns hyphenated telephone number based on split format 4 digit (eg Chofu, Tokyo) geo code" do
      tel = "0422991111"
      expect(TelFormatter.format(tel)).to eq("0422-99-1111")
      # This should NOT be "042-299-1111"
    end
  end

  describe ".split" do
    it "splits telephone number into 2 or 3 blocks" do
      tel = "0300000000"
      expect(TelFormatter.split(tel)).to eq(["03", "0000", "0000"])
      tel = "0110000000"
      expect(TelFormatter.split(tel)).to eq(["011", "000", "0000"])
      tel = "0123000000"
      expect(TelFormatter.split(tel)).to eq(["0123", "00", "0000"])
      tel = "0126700000"
      expect(TelFormatter.split(tel)).to eq(["01267", "0", "0000"])
      tel = "0120000000"
      expect(TelFormatter.split(tel)).to eq(["0120", "000000"])
      tel = "08099999999"
      expect(TelFormatter.split(tel)).to eq(["080", "9999", "9999"])
      tel = "08000000000"
      expect(TelFormatter.split(tel)).to eq(["0800", "0000000"])

      tel = "0429991111"
      expect(TelFormatter.split(tel)).to eq(["042", "999", "1111"])
      tel = "0428991111"
      expect(TelFormatter.split(tel)).to eq(["0428", "99", "1111"])
      tel = "0422991111"
      expect(TelFormatter.split(tel)).to eq(["0422", "99", "1111"])
      tel = "0709999999"
      expect(TelFormatter.split(tel)).to eq(["070", "999", "9999"])
    end

    it "raises ArgumentError when Invalid number is given" do
      tel = "0100000000"
      expect { TelFormatter.split(tel) }.to raise_error(ArgumentError)
      tel = "04000000000"
      expect { TelFormatter.split(tel) }.to raise_error(ArgumentError)
      tel = "050000000"
      expect { TelFormatter.split(tel) }.to raise_error(ArgumentError)
    end

    it "can handle Zenkaku chars and ignore non-numerical chars" do
      tel = "０３−００００−００００"
      expect(TelFormatter.split(tel)).to eq(["03", "0000", "0000"])
    end
  end

  describe ".preprocess" do
    it "converts Zenkaku chars to Hankaku, and excludes any non-numerical chars" do
      tel = "０３−００００−００００"
      expect(TelFormatter.preprocess(tel)).to eq("0300000000")
    end
  end
end
