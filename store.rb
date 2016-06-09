require 'csv'

class Admin

  def self.menu
    system "clear"
    puts ""
    puts "Welcome Admin. What you want to do?"
    puts "------------------------------------------------------------------"
    puts "Select option number:"
    puts "1. Products Index"
    puts "2. Users Index"
    puts "3. Logout"
    $menu = gets.chomp.to_i
    
    until $menu == 1 || $menu == 2 || $menu == 3
      puts ""
      puts "Please choose a valid option from the list."
      $menu = gets.chomp.to_i
    end

      case $menu
        when 1 then Admin.prod_index
        when 2 then Admin.users_index
        when 3 then Menu.menu
      end
  end

  def self.prod_index
    puts ""
    puts "Choose the type of product you want to see"
    puts "------------------------------------------------------------------"
    puts "Select option number:"
    puts "1. Jackets"
    puts "2. Pants"
    puts "3. Shoes"
    puts "4. Logout"
  end

private

  def self.users_index
    puts ""
    puts "Users"
    puts "------------------------------------------------------------------"
    puts "User Name ------- Password"
    @users = CSV.read("users.csv")
    @users.each{ |x| puts "#{x[0]} ------- $ #{x[1]} "}
    puts ""
    puts "What do you want to do?"
    puts "------------------------------------------------------------------"
    puts "1. Add user"
    puts "2. Delete user"
    puts "3. Back to Main Menu"
    $menu = gets.chomp.to_i

    until $menu == 1 || $menu == 2 || $menu == 3
    puts ""
    puts "Please choose a valid option from the list."
    $menu = gets.chomp.to_i
    end

    case $menu
      when 1 then puts "Hell yeah"
      when 2 then puts "Oh yeah"
      when 3 then Admin.menu
    end

  end


  def self.add_product
    puts "2. Add Product"
  end

end

class Store

  def self.store_menu
    puts ""
    puts "Marcianitos Main Menu. Choose the type of product you want to see"
    puts "------------------------------------------------------------------"
    puts "Select option number:"
    puts "1. Jackets"
    puts "2. Pants"
    puts "3. Shoes"
    puts "4. Logout"
    @product = gets.chomp.to_i

    until @product == 1 || @product == 2 || @product == 3 || @product == 4
      puts ""
      puts "Please choose a valid option from the list."
      @product = gets.chomp.to_i
    end

    case @product
      when 1 then Store.jackets
      when 2 then Store.pants
      when 3 then Store.shoes
      when 4 
        then 
          #Menu.new
          Menu.menu
    end

  end

  def self.jackets
    puts ""
    puts "Jackets availabe:"
    puts "------------------------------------------------------------------"
    puts "Model ------- $ Cost (USD)"
    @jackets = CSV.read("jackets.csv")
    @jackets.each{ |x| puts "#{x[0]} ------- $ #{x[1]} "}
    puts ""
    puts "What do you want to do?"
    puts "------------------------------------------------------------------"
    puts "1. Buy a jacket"
    puts "2. Return to Main Menu"
    puts "3. Logout"
    $menu = gets.chomp.to_i

    until $menu == 1 || $menu == 2 || $menu == 3
    puts ""
    puts "Please choose a valid option from the list."
    $menu = gets.chomp.to_i
    end

    case $menu
      when 1 then puts "Hell yeah"
      when 2 then Store.store_menu
      when 3 
        then 
          Menu.new
          Menu.menu
    end


  end

  def self.pants
    puts ""
    puts "Pants availabe:"
    puts "------------------------------------------------------------------"
    puts "Model ------- $ Cost (USD)"
    @pants = CSV.read("pants.csv")
    @pants.each{ |x| puts "#{x[0]} ------- $ #{x[1]} "}
    puts ""
    puts "What do you want to do?"
    puts "------------------------------------------------------------------"
    puts "1. Buy a pair of pants"
    puts "2. Return to Main Menu"
    puts "3. Logout"
    $menu = gets.chomp.to_i

    until $menu == 1 || $menu == 2 || $menu == 3
    puts ""
    puts "Please choose a valid option from the list."
    $menu = gets.chomp.to_i
    end

    case $menu
      when 1 then puts "Hell yeah"
      when 2 then Store.store_menu
      when 3 
        then 
          #Menu.new
          Menu.menu
    end

  end

  def self.shoes
    puts ""
    puts "Shoes availabe:"
    puts "------------------------------------------------------------------"
    puts "Model ------- $ Cost (USD)"
    @shoes = CSV.read("shoes.csv")
    @shoes.each{ |x| puts "#{x[0]} ------- $ #{x[1]} "}
    puts ""
    puts "What do you want to do?"
    puts "------------------------------------------------------------------"
    puts "1. Buy a pair of shoes"
    puts "2. Return to Main Menu"
    puts "3. Logout"
    $menu = gets.chomp.to_i

    until $menu == 1 || $menu == 2 || $menu == 3
    puts ""
    puts "Please choose a valid option from the list."
    $menu = gets.chomp.to_i
    end

    case $menu
      when 1 then puts "Hell yeah"
      when 2 then Store.store_menu
      when 3 
        then 
          #Menu.new
          Menu.menu
    end

  end
end

class Menu < Store

  def self.alert

    puts ""
    puts "Oops! you type something wrong or you are not registered."
    puts "Please enter (L) to try it again or (R) to register or (M) to go back to Main Menu"
    $login = gets.chomp.upcase

    until $login == "L" || $login == "R" || $login == "M"
      puts "Please enter (L) to try it again or (R) to register or (M) to go back to Main Menu"
      $login = gets.chomp.upcase
    end
    
    case $login
      when "L" then Menu.login
      when "R" then Menu.register
      when "M" then Menu.menu
    end
 
  end

  def self.login
    puts ""
    puts "Login"
    puts "------------------------------------------------------------------"
    puts "Plase enter your registered email and password."
    puts "Email:"
    log_email = gets.chomp
    puts "Password:"
    log_pass = gets.chomp
    @user_array = [log_email, log_pass]

    if @user_array == ["123", "123"]
      Admin.new
      Admin.menu
    else
      @admin = 0
      @users = CSV.read("users.csv")
      
      @users.each{ |x| @admin += 1 if x == @user_array }

      if @alert == 0 
        Menu.alert
      else 
        Menu.store_menu
      end

    end

  end

  def self.register
    puts ""
    puts "Register"
    puts "------------------------------------------------------------------"
    puts "Plase enter a valid email adress and a password."
    puts "Email:"
    reg_email = gets.chomp.to_s
    puts "Password:"
    reg_pass = gets.chomp.to_s
    @user_array = [reg_email, reg_pass]

     CSV.open("users.csv", "ab") do |csv|
       csv << @user_array
      end

    Menu.login
  end

def self.menu
  system "clear"
  puts ""
  puts "Welcome to the online store: Marcianitos, (www.marcianitos.com)"
  puts "------------------------------------------------------------------"
  puts "Select option number:"
  puts "1. Login"
  puts "2. Register"
  puts "3. Exit"
  $menu = gets.chomp.to_i
  
  until $menu == 1 || $menu == 2 || $menu == 3
    puts ""
    puts "Please choose a valid option from the list."
    puts ""
    puts "Select option number:"
    puts "1. Login"
    puts "2. Register"
    puts "3. Exit"
    $menu = gets.chomp.to_i
  end

    case $menu 
      when 1 then Menu.login
      when 2 then Menu.register
      when 3 then 
        system "clear"
        exit 
    end
end

end

Menu.new
Menu.menu




