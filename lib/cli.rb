require 'pry'

# ALL HELPER METHODS
    #method to create new appointment, takes arguments :user and stylist
    # used this in Main menu, to make new appointment for user
    def create_new_appointment(user, stylist)
        Appointment.create(
            user_id: user.id,
            stylist_id: stylist.id)
    end

# method to delete all appointment, used in my DELETE MENU
    def delete_all_appointment(user)
        Appointment.where(user_id: user.id).destroy_all
    end
# method to delete a appointment, used in my DELETE MENU
    def delete_an_appointment(user)
        Appointment.where(user_id: user.id).last.destroy
    end

# method to print out all appointment for that specific user
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

# Helper method to print out name of stylist with index
    def print_stylists_with_index(user)
        all_stylists = Stylist.all
        all_stylists.each_with_index do |stylist, index|
            i = index+1
            puts i.to_s + " " + stylist.name
    end
    end

    # helper method to close my app, exit out completely
    def close_app
        abort("See you next time!")
    end

    # method so to print out specific text after someone creates appointment
    def appt_conf
     puts "Thank you, your appointment was created!"
     puts " "
     puts "***************************************************** "
     puts " "
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

#this is the menu that a user sees immediately
#they have to select an option to use the interface
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
#  user has to select an option to use the interface
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
        stylist_name = "Jessica"
        stylist = Stylist.find_by(name: stylist_name)
          create_new_appointment(current_user, stylist)
          appt_conf
       main_menu(current_user)

    when "2"
        stylist_name = "Vanessa"
        stylist = Stylist.find_by(name: stylist_name)
        create_new_appointment(current_user, stylist)
        appt_conf
        main_menu(current_user)

    when "3"
        stylist_name = "Max"
        stylist = Stylist.find_by(name: stylist_name)
        create_new_appointment(current_user, stylist)
        appt_conf
        main_menu(current_user)

    when "4"
         main_menu(current_user)
    else
          puts "Please, choose 1 or 4"
          stylists_menu(current_user)
    end
end

# it was dry code, fixed it by creating shorter method,  but decided to keep them for myself

 # stylist 1
# def jessica_menu(current_user)
#          puts "Please choose yes or no"
#          puts " "
#          puts " 1. yes"
#          puts " 2. no"
#
#          input = gets.chomp
#     case input
#     when "1"
#          stylist_name = "Jessica"
#          stylist = Stylist.find_by(name: stylist_name)
#            create_new_appointment(current_user, stylist)
#         puts "Thank you for choosing Jessica, she is great stylist!"
#         puts " "
#         puts "***************************************************** "
#         puts " "
#         main_menu(current_user)
#     when "2"
#          puts "Do you want to choose other stylists?"
#          puts " "
#          stylists_menu(current_user)
#
#      else
#          puts "Please, choose 1 or 2"
#          jessica_menu(current_user)
#      end
#  end
#
#
#  # stylist 2
#
# def vanessa_menu(current_user)
#          puts "Please choose yes or no"
#          puts " "
#          puts " "
#          puts " 1. yes"
#          puts " 2. no"
#
#          input = gets.chomp
#     case input
#     when "1"
#           stylist_name = "Vanessa"
#           stylist = Stylist.find_by(name: stylist_name)
#           create_new_appointment(current_user, stylist)
#           puts "Thank you for choosing Vanessa, she is great stylist!"
#           puts " "
#           puts "***************************************************** "
#           puts " "
#           main_menu(current_user)
#     when "2"
#          puts "Do you want to choose other stylists?"
#          puts " "
#          stylists_menu(current_user)
#
#      else
#          puts "Please, choose 1 or 2"
#          jessica_menu(current_user)
#      end
# end
#
#  # stylist 3
#
# def max_menu(current_user)
#          puts "Please choose yes or no"
#          puts " "
#          puts " "
#          puts " 1. yes"
#          puts " 2. no"
#
#          input = gets.chomp
#     case input
#     when "1"
#           stylist_name = "Max"
#           stylist = Stylist.find_by(name: stylist_name)
#           create_new_appointment(current_user, stylist)
#           puts "Thank you for choosing Max, he is great stylist!"
#           puts " "
#           puts "**************************************************** "
#           puts " "
#           main_menu(current_user)
#     when "2"
#          puts "Do you want to choose other stylists?"
#          puts " "
#          stylists_menu(current_user)
#
#     else
#          puts "Please, choose 1 or 2"
#          max_menu(current_user)
#     end
# end




# MY APPOINTMENTS MENU
# after choosing Make appointment
# #they have to select an option to use the interface
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

# gathers, maps all current_user's appointment, brings out stylists names
              appointments = current_user.stylists.map {|stylist| stylist.name}
              #looping through and printing appointment stylists names with index
              appointments.each_with_index {|stylist_name, index| puts "#{index+1}. #{stylist_name}" }

          puts "which appointments do you want to change?"
 # choose index of stylist you want to change
               index = gets.chomp
 # set that input to old_stylist_name
               old_stylist_name = appointments[index.to_i-1]
 #find_by name of stylist that belongs to that index input we choosed to change, and setting it to old_stylist var
                old_stylist = Stylist.all.find_by(name: old_stylist_name)
           puts "which stylist do you want to change it to?"

    # helper method comes from top , check code among other helper methods
    # loops through and prints out stylists names with index
           print_stylists_with_index(current_user)
    # choose stylit index you want to change to
             index1 = gets.chomp
     # finds stylist with that index
              updated_stylist = Stylist.all[index1.to_i-1]


     # using Appointment class method to find appointment that matches that id, brings one appointment with that id
               appointment = Appointment.find_by(stylist_id: old_stylist.id)
     # using Appointment class method to update appointment id we got from previous line, and change it to updated_stylist id
              Appointment.update(appointment.id, stylist_id: updated_stylist.id)
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
