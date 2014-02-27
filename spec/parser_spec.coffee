describe 'The Color.Parser', ->
  beforeEach -> Ember.run =>
    @parser = Color.Parser.create()

  describe "nonsense input", ->
    beforeEach -> Ember.run =>
      @parser.set "input", "xyz"
    it 'does not match', ->
      expect(@parser.get("output")).to.not.be.defined

  describe 'input in the form rgb($r,$g,$b)', ->
    beforeEach -> Ember.run =>
      @parser.set "input", "rgb(210,30,105)"
    it "matches", ->
      expect(@parser.get("output")).to.exist
      expect(@parser.get("output").getProperties('r','g','b')).to.deep.equal
        r: 210, g: 30, b: 105

    describe 'but with some spaces thrown in', ->
      beforeEach -> Ember.run =>
        @parser.set "input", "rgb(210, 30 ,105 )"
      it "matches", ->
        expect(@parser.get("output")).to.exist
        expect(@parser.get("output").getProperties('r','g','b')).to.deep.equal
          r: 210, g: 30, b: 105

  describe 'input in the form hsl($h,$s,$l)', ->
    beforeEach -> Ember.run =>
      @parser.set 'input', "hsl(110, .22, 1)"
    it "matches", ->
      expect(@parser.get("output")).to.exist
      expect((@parser.get("output")).getProperties('h','s', 'l')).to.deep.equal
        h: 110, s: .22, l: 1

