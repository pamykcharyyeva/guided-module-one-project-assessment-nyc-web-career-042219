require 'pry'

# ALL HELPER METHODS

    def create_new_appointment(user, stylist)
        Appointment.create(
            user_id: user.id,
            stylist_id: stylist.id)
    end

    def delete_all_appointment(user)
        Appointment.where(user_id: user.id).destroy_all
    end

    def delete_an_appointment(user)
        Appointment.where(user_id: user.id).last.destroy
    end

    def my_appointments(user)
         Appointment.where(user_id: user.id)
    end

    # def print_appointments_with_index(user)
    #     appointments = my_appointments(user)
    #     appointments.each_with_index do |appointment, index|
    #
    #         i = index+1
    #         puts i.to_s + " " + appointment.stylist.name
    # end
    # end

    def print_stylists_with_index(user)
        all_stylists = Stylist.all
        all_stylists.each_with_index do |stylist, index|
            i = index+1
            puts i.to_s + " " + stylist.name
    end
    end


    def close_app
        abort("See you next time!")
    end



# WELCOME PAGE!

def welcome
            puts "
        ###                  #             ##
         #                   #              #
         #            ###   ####   #   #    #     ###
         #           #       #     #   #    #    #   #
         #            ###    #     #  ##    #    #####
         #               #   #  #   ## #    #    #
        ###          ####     ##       #   ###    ###
                                   #   #
                                    ###
        "

        puts " "
        puts " "
        puts "Welcome to I style!"
        puts "Enter your name"
        username = gets.chomp
        current_user = User.find_or_create_by(name: username)
        main_menu(current_user)
end

# MAIN MENU

def main_menu(current_user)
        puts "*****************************************************"
        puts "What would you like to choose?"
        puts " "
        puts "1. Make appointment"
        puts "2. My appointments"
        puts "3. Change user"
        puts "4. Exit"

        input = gets.chomp
    case input
    when "1"
        stylists_menu(current_user)
    when "2"
        my_appointments_menu(current_user)
    when "3"
        puts "Enter new username"
        username = gets.chomp
        current_user = User.find_or_create_by(name: username)
        main_menu(current_user)
    when "4"
        close_app

    else
        puts "Please choose numbers 1 to 3"
        main_menu(current_user)
    end
end


# MAKE APPOINTMENTS, STYLISTS MENU

def stylists_menu(current_user)
       puts "Please choose stylist"
       puts " "
       puts " 1. Jessica"
       puts " 2. Vanessa"
       puts " 3. Max"
       puts " 4. Exit"

       input = gets.chomp

    case input

    when "1"
        jessica_menu(current_user)

    when "2"
        vanessa_menu(current_user)
    when "3"
           max_menu(current_user)
    when "4"
         main_menu(current_user)
    else
          puts "Please, choose 1 or 4"
          stylists_menu(current_user)
    end
end


 # stylist 1
def jessica_menu(current_user)
         puts "Please choose yes or no"
         puts " "
         puts " 1. yes"
         puts " 2. no"

         input = gets.chomp
    case input
    when "1"
         stylist_name = "Jessica"
         stylist = Stylist.find_by(name: stylist_name)
           create_new_appointment(current_user, stylist)
        puts "Thank you for choosing Jessica, she is great stylist!"
        puts " "
        puts "***************************************************** "
        puts " "
        main_menu(current_user)
    when "2"
         puts "Do you want to choose other stylists?"
         puts " "
         stylists_menu(current_user)

     else
         puts "Please, choose 1 or 2"
         jessica_menu(current_user)
     end
 end


 # stylist 2

def vanessa_menu(current_user)
         puts "Please choose yes or no"
         puts " "
         puts " "
         puts " 1. yes"
         puts " 2. no"

         input = gets.chomp
    case input
    when "1"
          stylist_name = "Vanessa"
          stylist = Stylist.find_by(name: stylist_name)
          create_new_appointment(current_user, stylist)
          puts "Thank you for choosing Vanessa, she is great stylist!"
          puts " "
          puts "***************************************************** "
          puts " "
          main_menu(current_user)
    when "2"
         puts "Do you want to choose other stylists?"
         puts " "
         stylists_menu(current_user)

     else
         puts "Please, choose 1 or 2"
         jessica_menu(current_user)
     end
end

 # stylist 3

def max_menu(current_user)
         puts "Please choose yes or no"
         puts " "
         puts " "
         puts " 1. yes"
         puts " 2. no"

         input = gets.chomp
    case input
    when "1"
          stylist_name = "Max"
          stylist = Stylist.find_by(name: stylist_name)
          create_new_appointment(current_user, stylist)
          puts "Thank you for choosing Max, he is great stylist!"
          puts " "
          puts "**************************************************** "
          puts " "
          main_menu(current_user)
    when "2"
         puts "Do you want to choose other stylists?"
         puts " "
         stylists_menu(current_user)

    else
         puts "Please, choose 1 or 2"
         max_menu(current_user)
    end
end




# MY APPOINTMENTS MENU

def my_appointments_menu(current_user)
        puts "Please choose one"
        puts " "
        puts "1. Check my appointments"
        puts "2. Delete my appointment"
        puts "3. Change my stylist"
        puts "4. Exit"

        input = gets.chomp

    case input
    when "1"
            puts "Here are all your appointments: "
            puts " "
            appt = my_appointments(current_user)
            appt.each { |appointment| puts appointment.stylist.name }
            puts " "
            puts "**************************************************** "
            my_appointments_menu(current_user)

    when "2"
            delete_menu(current_user)
    when "3"
            change_stylist_menu(current_user)

    when "4"
           main_menu(current_user)
    else
          puts "Please, choose 1 to 3"
          my_appointments_menu(current_user)
    end
end



# DELETE MENU

def delete_menu(current_user)
       puts "Please choose one"
       puts " "
       puts " 1. Delete an appointment"
       puts " 2. Delete all appointments"
       puts " 3. exit"

       input = gets.chomp

    case input
    when "1"
        delete_an_appointment(current_user)
        puts "An appointment has been deleted"
        puts " "
        delete_menu(current_user)
    when "2"
        delete_all_appointment(current_user)
        puts "All your appointments has been deleted"
        puts " "
        main_menu(current_user)
    when "3"
        main_menu(current_user)
    else
        puts "Please, choose 1, 2 or 3"
        puts " "
        delete_menu(current_user)
    end
 end


# CHANGE STYLIST MENU


 def change_stylist_menu(current_user)
         puts "Please choose one"
         puts " "
         puts " 1. Change stylist"
         puts " 2. exit"

         input = gets.chomp

      case input
      when "1"
          puts "Here are your appointments"
          puts " "


              appointments = current_user.stylists.map {|stylist| stylist.name}
              appointments.each_with_index {|stylist_name, index| puts "#{index+1}. #{stylist_name}" }

          puts "which appointments do you want to change?"
               index = gets.chomp
               old_stylist_name = appointments[index.to_i-1]

               old_stylist = Stylist.all.find_by(name: old_stylist_name)
           puts "which stylist do you want to change it to?"

           print_stylists_with_index(current_user)
               index1 = gets.chomp

               updated_stylist = Stylist.all[index1.to_i-1]



               change_to = Appointment.find_by(stylist_id: old_stylist.id)
               change_to.id
               Appointment.update(change_to.id, stylist_id: updated_stylist.id)
           puts
           puts "It was successfully changed!!!"
           puts
           puts "*****************************************************************"
           my_appointments_menu(current_user)

      when "2"
          my_appointments_menu(current_user)
      else
          puts "Please, choose 1, 2 or 3"
          puts " "
          my_appointments_menu(current_user)
      end
 end
