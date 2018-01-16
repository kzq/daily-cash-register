RSpec.shared_examples "request response examples" do |template|
  it { expect(response).to render_template(template) }
  it { expect(response).to have_http_status(:ok) }
end