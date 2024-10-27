json.extract! @user, :id, :email, :username
json.avatar_url @user.avatar.attached? ? @user.avatar.url : ''
