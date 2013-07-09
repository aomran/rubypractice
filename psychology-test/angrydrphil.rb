# I have never watched a Dr. Phil show but this is how I imagine a session would go.

require 'highline/import'

class AngryDrPhil

  QUESTIONS = [:feeling, :sleep, :nutrition, :physical_health, :therapy_history, :anxiety, :agitated, :suicidal, :depression_cause, :killing_thoughts]

  private
  def speaker_title
  	"<%= color('Dr.Phil', BLUE) %>: "
  end

	def feeling
		ask "#{speaker_title} How are you feeling today?"
		say %{#{speaker_title} <%= color("Your feelings? To he** with your feelings!",RED) %>}
	end

	def sleep
		ask "#{speaker_title} How is your sleeping, too much/not enough?"
	end

	def nutrition
		answer = ask "#{speaker_title} How is your eating, too much/not enough?"
		if /not enough/ =~ answer
			 say %{#{speaker_title} <%= color("You need to listen to your body because your body is listening to you.",RED) %>}
		end
	end

	def physical_health
		ask "#{speaker_title} Do you have any medical health issues? Any alergies or medication?"
	end

	def therapy_history
		ask "#{speaker_title} Have you ever been in therapy before?"
	end

	def anxiety
		answer = ask "#{speaker_title} Do you feel anxious?" do |q|
			q.validate = /^(yes|no)$/
		end
		if answer == "yes"
			say %{#{speaker_title} <%= color("You need to marry yo' baby mama.",RED) %>}
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
			say %{#{speaker_title} <%= color("You have the duty and gift of living. You don't have the right to sit on the sidelines--use your life and get back into the game.",RED) %>}
		end
	end

	def depression_cause
		ask "#{speaker_title} What makes you depressed (anything specific?)"
		say %{#{speaker_title} <%= color("Awareness without action is worthless.",RED) %>}
	end

	def killing_thoughts
		answer = ask "#{speaker_title} Have you thought about killing animals or people?" do |q|
			q.validate = /^(yes|no)$/
		end

		if answer == "yes"
			choose do |menu|
				menu.prompt = "So which was it?"
				menu.choice(:animals) {say %{#{speaker_title} <%= color("You're a terrible person but it's ok.",RED) %>}}
				menu.choice(:people) { say %{#{speaker_title} <%= color("When you choose your behavior, you choose your consequences.",RED) %>}}
			end
		end
	end

	def greet
		say "#{speaker_title} Hello, this is Dr. Phil. If someone out there doesn't agree with me, then somewhere a village is missing their idiot."
		say "#{speaker_title} I'll be asking you a few questions now."
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