require 'rails_helper'

RSpec.feature 'Deleting Articles' do
  before do
    @john = User.create(
      email: "john@example.com",
      password: "password"
    )
    login_as(@john)
    @article = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetyr.',
      user: @john
    )
  end

  scenario  'A user deletes an article' do
    visit '/'

    click_link @article.title

    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(page.current_path).to eq(articles_path)
  end
end
