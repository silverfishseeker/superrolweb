class ApplicationController < ActionController::API
    def root
        render json: {
            "spells:": "/spells",
            "classes:": "/clases",
            "magic schools:": "/magicschools"
        }
    end
end
