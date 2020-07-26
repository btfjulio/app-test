require 'rails_helper'

RSpec.feature "Show article" do
  before do
    @john = User.create(
      email: "john@example.com",
      password: "password"
    )
    @fred = User.create(
      email: "fred@example.com",
      password: "password"
    )
    @article = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetyr.',
      user: @john
    )
  end
  
  scenario "to non-signed in user" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
    
  end

  scenario "to non-owner user" do
    visit "/"
    login_as(@fred)
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
    
  end

  scenario "to non-owner user" do
    visit "/"
    login_as(@john)
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
    
  end

end