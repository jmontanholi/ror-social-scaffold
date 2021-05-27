module FeatureHelpers
  def log_in(user)
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', with: 'ariel@gmail.com'
      fill_in 'user_password', with: '123123'
    end
    click_button 'Log in'
  end

  def create_post
    visit '/posts'
    within("#new_post") do
      fill_in 'post_content', with: 'Please work capybara'
    end
    click_button 'Save'
  end

  def create_comment
    visit '/posts'
    within("#new_comment") do
      fill_in 'comment_content', with: 'This is a comment'
    end
    click_button 'Comment'
  end
end