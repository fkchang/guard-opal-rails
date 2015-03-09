require 'guard/opal-rails/process_toggle_factory'
describe Guard::OpalRails::ProcessToggleFactory do
  it 'should create NullProcessToggle for a specified spec_url' do
    process_toggle = Guard::OpalRails::ProcessToggleFactory.process_toggle_for(
      { spec_url: 'foo.dev/opal_spec' })
    expect(process_toggle).to be_a Guard::OpalRails::NullProcessToggle
  end

  it 'should create StandaloneSpecServerProcessToggle for nil spec_url' do
    process_toggle = Guard::OpalRails::ProcessToggleFactory.process_toggle_for(
      { spec_url: nil })
    expect(process_toggle).to be_a Guard::OpalRails::StandaloneSpecServerProcessToggle
  end

  it 'should return a StandaloneSpecServerProcessToggle if spec_url not defined' do
    process_toggle = Guard::OpalRails::ProcessToggleFactory.process_toggle_for({})
    expect(process_toggle).to be_a Guard::OpalRails::StandaloneSpecServerProcessToggle
  end

end
