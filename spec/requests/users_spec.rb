require 'rails_helper'

feature "Users SignUp", js: true do
  scenario 'with valid name, email and password' do
    sign_up 'name', 'valid@example.com', 'password', 'password'
    expect(page).to have_content('Logout')      
  end

  scenario 'with valid name, email and invalid password' do
    sign_up 'name', 'valid@example.com', 'pswr', 'pswr'
    expect(page).to have_content('Password is too short (minimum is 8 characters)')
  end

  scenario 'with valid email, password and invalid name' do
    sign_up 'nm', 'valid@example.com', 'password', 'password'
    expect(page).to have_content('Name is too short (minimum is 3 characters)')     
  end

  scenario 'with blank name' do
    sign_up '', 'valid@example.com', 'password', 'password'
    expect(page).to have_content("Name can't be blank") 
  end

  scenario 'with blank email' do
    sign_up 'name', '', 'password', 'password'
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'with blank password' do
    sign_up 'name', 'valid@example.com', '', 'password'
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'with password and confirmation unmatched' do
    sign_up 'name', 'valid@example.com', 'password', 'differentPassword'
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'with existing email' do
    sign_up 'name', 'valid@example.com', 'password', 'password'
    click_link "Logout"
    sign_up 'name', 'valid@example.com', 'password', 'password'
    expect(page).to have_content("Email has already been taken")
  end

  private

  def sign_up(name, email, password, confirmation)
    visit new_user_registration_path
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: confirmation
    click_button "Sign up"
  end
end

feature "Users SignIn", js: true do
  before :each do
    User.create(email: 'valid@example.com', password: 'password', name: 'name')
  end

  scenario 'with valid email and password' do
    sign_in 'valid@example.com', 'password'
    expect(page).to have_content('Logout')      
  end

  scenario 'with email nonexistent' do
    sign_in 'novalid@example.com', 'password'
    expect(page).to have_content('Login')      
  end

  scenario 'with wrong password' do
    sign_in 'novalid@example.com', 'wrongPassword'
    expect(page).to have_content('Login')
  end

  private

  def sign_in(email, password)
    visit new_user_session_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end
end