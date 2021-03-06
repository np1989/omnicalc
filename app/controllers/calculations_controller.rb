class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text].chomp
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    # Start of Character count with spaces section

    ch_count_w_spaces = @text.length
    @character_count_with_spaces = ch_count_w_spaces.to_s

    # End of Character count with spaces section


    # Start of character count without spaces section

    inputed_text = @text.delete' '
    ch_count_wo_spaces = inputed_text.length
    @character_count_without_spaces = ch_count_wo_spaces.to_s

    # End of character count without spaces section


    # Word Count Section

    w_count_text = @text.split.join(" ")
    space_count_plus1 = w_count_text.scan(/ /).count + 1

    @word_count = space_count_plus1.to_s

    # End of word count Section


    # Beginning of Special Word Count section

    spec_word_clean = @special_word.downcase.to_s
    spec_word_count = @text.downcase.scan(spec_word_clean).count
    @occurrences =spec_word_count

    # End of special word count section

end



def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    monthly_ir = (@apr/12)/100
    months_to_maturity = (@years * 12)
    total_principal = @principal

    numerator =monthly_ir * total_principal
    denomentator = (1 - ((1+monthly_ir)**(0-months_to_maturity)))

    payment_per_month = numerator/denomentator
    @monthly_payment = payment_per_month

end



def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    start_time = @starting
    end_time = @ending
    difference_in_time = end_time - start_time
    difference_in_minutes = difference_in_time/60
    difference_in_hours = difference_in_minutes/60
    difference_in_days = difference_in_hours/24
    difference_in_weeks = difference_in_days/7
    difference_in_years = difference_in_weeks/52


    @seconds = difference_in_time
    @minutes = difference_in_minutes
    @hours = difference_in_hours
    @days = difference_in_days
    @weeks = difference_in_weeks
    @years = difference_in_years
end




def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',','').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    #sorted_numbers_array = []
    #sorted_numbers_array =

    @sorted_numbers = @numbers.sort { |x,y| x <=> y }

    list_length = @numbers.length

    @count = list_length

    @minimum = @numbers.sort { |x,y| x <=> y }[0]

    @maximum = @numbers.sort { |x,y| x <=> y }[list_length-1]

    @range = @numbers.sort { |x,y| x <=> y }[list_length-1] - @numbers.sort { |x,y| x <=> y }[0]



    if list_length%2 == 0
        median_of_list = @numbers.sort { |x,y| x <=> y }[(list_length/2)-1] + @numbers.sort { |x,y| x <=> y }[list_length/2]
    else
        median_of_list = @numbers.sort { |x,y| x <=> y }[(list_length/2.0)-0.5]
    end

    @median = median_of_list

    sum_of_numbers = 0
    @numbers.each{|a| sum_of_numbers+=a}

    @sum = sum_of_numbers

    mean_of_list = sum_of_numbers/list_length
    @mean = mean_of_list

    variance_sum_of_list=0
    @numbers.each{|a| variance_sum_of_list+=((a-mean_of_list)**2)}
    variance_of_list = variance_sum_of_list/(@numbers.length-1)

    @variance = variance_of_list

    @standard_deviation = variance_of_list**(0.5)

   # @mode = mode

  #  def mode
   #     @numbers{|i| i}.max{|x,y| x[1].length <=> y[1].length}[0]
    #end

end
end
