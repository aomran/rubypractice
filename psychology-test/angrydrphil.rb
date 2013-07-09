# I have never watched a Dr. Phil show but this is how I imagine a session would go.

require 'highline/import'

class AngryDrPhil

  QUESTIONS = [:feeling, :sleep, :nutrition, :physical_health, :therapy_history,
    :anxiety, :agitated, :suicidal, :depression_cause, :killing_thoughts]

  private
  def speaker_title
    "<%= color('Dr.Phil', BLUE) %>: "
  end

  def colour_comment(comment)
    %Q{ <%= color("#{comment}", RED) %> }
  end

  def speaker_says(comment, color=true)
    comment = colour_comment(comment) if color
    "#{speaker_title} #{comment} \n"
  end

  def feeling
    ask "#{speaker_title} How are you feeling today?"
    say speaker_says("Your feelings? To he** with your feelings!")
  end

  def sleep
    ask "#{speaker_title} How is your sleeping, too much/not enough?"
  end

  def nutrition
    answer = ask "#{speaker_title} How is your eating, too much/not enough?"
    if /not enough/ =~ answer
       say speaker_says("You need to listen to your body because your "\
        "body is listening to you.")
    end
  end

  def physical_health
    ask "#{speaker_title} Do you have any medical health issues? "\
    "Any allergies or medication?"
  end

  def therapy_history
    ask "#{speaker_title} Have you ever been in therapy before?"
  end

  def anxiety
    answer = ask "#{speaker_title} Do you feel anxious?" do |q|
      q.validate = /^(yes|no)$/
    end
    if answer == "yes"
      say speaker_says("You need to marry yo' baby mama.")
    end
  end

  def agitated
    ask "#{speaker_title} Do you feel agitated?"
  end

  def suicidal
    answer = ask "#{speaker_title} Have you had suicidal thoughts?" do |q|
      q.validate = /^(yes|no)$/
    end
    if answer == "yes"
      say speaker_says("You have the duty and gift of living. "\
        "You don't have the right to sit on the sidelines--use your "\
        "life and get back into the game.")
    end
  end

  def depression_cause
    ask "#{speaker_title} What makes you depressed (anything specific?)"
    say speaker_says("Awareness without action is worthless.")
  end

  def killing_thoughts
    answer = ask "#{speaker_title} Have you thought about killing "\
    "animals or people?" do |q|
      q.validate = /^(yes|no)$/
    end

    if answer == "yes"
      choose do |menu|
        menu.prompt = "So which was it?"
        menu.choice(:animals) do
          say speaker_says("You're a terrible person but it's ok.")
        end
        menu.choice(:people) do
          say speaker_says("When you choose your behavior, you choose "\
            "your consequences.")
        end
      end
    end
  end

  def greet
    say speaker_says("Hello, this is Dr. Phil. If someone out there doesn't "\
      "agree with me, then somewhere a village is missing their idiot.", false)
    say speaker_says("I'll be asking you a few questions now.", false)
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

drphil = AngryDrPhil.new
drphil.start_session

# Source of quotes:
# http://voices.yahoo.com/dr-phil-quotes-top-5-funny-dumb-sayings-7855580.html?cat=7
# http://voices.yahoo.com/dr-phil-quotes-top-10-inspirational-sayings-7855798.html?cat=7