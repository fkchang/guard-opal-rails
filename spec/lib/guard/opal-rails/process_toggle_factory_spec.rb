require 'guard/opal-rails/process_toggle_factory'
describe Guard::OpalRails::ProcessToggleFactory do
  it 'should create NullProcessToggle for a specified url' do
    process_toggle = Guard::OpalRails::ProcessToggleFactory.process_toggle_for(
      { url: 'foo.dev/opal_spec' })
    expect(process_toggle).to be_a Guard::OpalRails::NullProcessToggle
  end

  it 'should return a StandaloneSpecServerProcessToggle if url not defined' do
    process_toggle = Guard::OpalRails::ProcessToggleFactory.process_toggle_for({})
    expect(process_toggle).to be_a Guard::OpalRails::StandaloneSpecServerProcessToggle
  end
end
