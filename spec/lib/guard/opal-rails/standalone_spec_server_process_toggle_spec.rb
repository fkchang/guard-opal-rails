require 'guard/opal-rails/standalone_spec_server_process_toggle'
describe Guard::OpalRails::StandaloneSpecServerProcessToggle do
  it 'should call the right rake task to start the server' do
    # subject.should_receive(:run_task).with 'opal:spec:start_server'
    subject.should_receive(:system).with 'bundle exec rake opal:spec:start_server'
    subject.start
  end
  it 'should call the right rake task to stop the server' do
    # subject.should_receive(:run_task).with 'opal:spec:kill_server'
    subject.should_receive(:system).with 'bundle exec rake opal:spec:kill_server'
    subject.stop
  end
end
