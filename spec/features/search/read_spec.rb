RSpec.describe 'Search GET' do
  let(:string) { 'example' }

  let!(:user)  { create(:user, first_name: string) }
  let!(:event) { create(:event, title: string) }
  let!(:talk)  { create(:talk, title: string) }

  before do
    visit search_index_path(query: string)
  end

  it { expect(page).to have_content 'Search Results' }
  it { expect(page).to have_content '1 User' }
  it { expect(page).to have_content '1 Event' }
  it { expect(page).to have_content '1 Talk' }

  it 'redirects to resources when clicked on' do
    click_link user.email
    expect(page).to have_current_path "/members/#{user.slug}"
  end
end
