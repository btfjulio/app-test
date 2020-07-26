require 'rails_helper'

RSpec.feature 'Deleting Articles' do
  before do
    @john = User.create(
      email: 'john@example.com',
      password: 'password'
    )
    @fred = User.create(
      email: 'fred@example.com',
      password: 'password'
    )
    @article = Article.create(
      title: 'Title One',
      body: 'Body of article one',
      user: @john
    )
  end

  scenario 'A owner deletes an article' do
    login_as(@john)
    visit '/'

    click_link @article.title

    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(page.current_path).to eq(articles_path)
  end

end
