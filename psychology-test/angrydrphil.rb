# I have never watched a Dr. Phil show but this is how I imagine a session would go.

require 'highline/import'

class DoctorSpeak

  def initialize(doctor_name)
    @doctor_name = doctor_name
  end

  def comment_title
    %Q{<%= color("#{@doctor_name}", BLUE) %>: }
  end

  def colour_comment(phrase)
    %Q{ <%= color("#{phrase}", RED) %> }
  end

  def comment(phrase, color)
    phrase = colour_comment(phrase) if color
    "#{comment_title} #{phrase} \n"
  end

end

class AngryDrPhil

  def initialize(doctor_name)
    @doctor_name = doctor_name
    @doctor_speak = DoctorSpeak.new(@doctor_name)
  end

  QUESTIONS = [:feeling, :sleep, :nutrition, :physical_health, :therapy_history,
    :anxiety, :agitated, :suicidal, :depression_cause, :killing_thoughts]

  def doctor_says(phrase, color=true)
    @doctor_speak.comment(phrase, color)
  end

  private
  # Questions
  def feeling
    ask doctor_says("How are you feeling today?", false)
    say doctor_says("Your feelings? To he** with your feelings!")
  end

  def sleep
    ask doctor_says("How is your sleeping, too much/not enough?", false)
  end

  def nutrition
    answer = ask doctor_says("How is your eating, too much/not enough?", false)
    if /not enough/ =~ answer
      say doctor_says("You need to listen to your body because your "\
        "body is listening to you.")
    end
  end

  def physical_health
    ask doctor_says("Do you have any medical health issues? "\
      "Any allergies or medication?", false)
  end

  def therapy_history
    ask doctor_says("Have you ever been in therapy before?", false)
  end

  def anxiety
    answer = ask doctor_says("Do you feel anxious?", false) do |q|
      q.validate = /^(yes|no)$/
    end
    if answer == "yes"
      say doctor_says("You need to marry yo' baby mama.")
    end
  end

  def agitated
    ask doctor_says("Do you feel agitated?", false)
  end

  def suicidal
    answer = ask doctor_says("Have you had suicidal thoughts?", false)   do |q|
      q.validate = /^(yes|no)$/
    end
    if answer == "yes"
      say doctor_says("You have the duty and gift of living. "\
        "You don't have the right to sit on the sidelines--use your "\
        "life and get back into the game.")
    end
  end

  def depression_cause
    ask doctor_says("What makes you depressed (anything specific?)", false)
    say doctor_says("Awareness without action is worthless.")
  end

  def killing_thoughts
    question = doctor_says("Have you thought about killing "\
      "animals or people?", false)
    answer = ask question do |q|
      q.validate = /^(yes|no)$/
    end

    if answer == "yes"
      choose do |menu|
        menu.prompt = "So which was it?"
        menu.choice(:animals) do
          say doctor_says("You're a terrible person but it's ok.")
        end
        menu.choice(:people) do
          say doctor_says("When you choose your behavior, you choose "\
            "your consequences.")
        end
      end
    end
  end

  # Components of a session
  def greet
    say doctor_says("Hello, this is Dr. Phil. If someone out there doesn't "\
      "agree with me, then somewhere a village is missing their idiot.", false)
    say doctor_says("I'll be asking you a few questions now.", false)
    puts
  end

  def ask_questions
    QUESTIONS.shuffle!
    QUESTIONS.each do |question|
      self.send(question)
    end
  end

  public
  def start_session
    greet
    ask_questions
  end

end

drphil = AngryDrPhil.new('Dr Phil')
drphil.start_session

# Source of quotes:
# http://voices.yahoo.com/dr-phil-quotes-top-5-funny-dumb-sayings-7855580.html?cat=7
# http://voices.yahoo.com/dr-phil-quotes-top-10-inspirational-sayings-7855798.html?cat=7