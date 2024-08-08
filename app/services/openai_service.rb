class OpenaiService
    require 'http'

    def initialize(user_input)
        @user_input = user_input

    end

    def call
        response = HTTP.auth("Bearer #{ENV['OPENAI_API_KEY']}").post(
            "https://api.openai.com/v1/chat/completions",
            json: {
                model: 'gpt-4o',
                messages: [{
                    role: "user",
                    content: @user_input,
                }],
            }
        )

        content = response.parse["choices"][0]["message"]["content"]
        return content.to_json
    end

end