require 'rspec/pact/matchers'

describe "match_pact" do
  it "allows a successful match" do
    expect(thing: 'foo', other_thing: 'bar').to match_pact(thing: 'foo')
  end

  it "prints an error on failure", pending: "this should fail, testing failure message" do
    expect(thing: 'foo').to match_pact(thing: 'bar')
  end

  it "allows the type option to be passed through" do
    expect(thing: 'foo').to match_pact({thing: 'bar'}, {type: true})
  end

  it "allows Pact matchers to be used" do
    expect(thing: 'foo').to match_pact(Pact.like(thing: 'bar'))
  end

  it "allows the allow_unexpected_keys option to be passed through", pending: "this should fail, testing failure message" do
    expect(thing: 'foo', other_thing: 'bar').to match_pact({thing: 'foo'}, {allow_unexpected_keys: false})
  end

  it "does something useful" do
    expect(thing: 'foo').to_not match_pact(thing: 'bar')
  end

  it "does something useful", pending: "this should fail, testing failure message" do
    expect(thing: 'foo').to_not match_pact(thing: 'foo')
  end

  it "doesn't blow up with a nil expectation" do
    expect(thing: 'foo').to_not match_pact(nil)
  end
end
