require 'rails_helper'


feature "Handle Articles", js: true do

  scenario "With article listed in the main page" do
    article = create_article
    visit root_path
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.description)
  end

  scenario "With several articles listed in the main page" do
    article = create_article
    article1 = create_article({title: "The Title1", description: "The Description1", body: "The Body1"})
    visit root_path
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.description)
    expect(page).to have_content(article1.title)
    expect(page).to have_content(article1.description)
  end

  scenario "With article showing the body data" do
    article = create_article
    visit root_path
    click_link "Read More"
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.body)
  end

  private

  def create_article(args={title: "The Title", description: "The Description", body: "The Body"})
    Article.create(args)
  end

end