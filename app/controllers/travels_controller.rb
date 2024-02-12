class TravelsController < ApplicationController
    def index
        if params[:search] == nil
            @travels= Travel.all
          elsif params[:search] == ''
            @travels= Travel.all
          else
            #部分検索
            @travels = Travel.where("body LIKE ? ",'%' + params[:search] + '%')
          end
    end

    def link
    end

    def hokkaido
     @hokkaidos = Travel.where(category:"hokkaido") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def tokai
     @tokais = Travel.where(category:"tokai") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def hokuriku
     @hokurikus = Travel.where(category:"hokuriku") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def kanto
     @kantos = Travel.where(category:"kanto") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def kinki
     @kinkis = Travel.where(category:"kinki") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def kyushu
     @kyushus = Travel.where(category:"kyushu") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def chugoku
     @chugokus = Travel.where(category:"chugoku") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def shikoku
     @shikokus = Travel.where(category:"shikoku") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def new
        @travel = Travel.new
    end

    def create
        travel = Travel.new(travel_params)
        travel.user_id = current_user.id
        if travel.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @travel = Travel.find(params[:id])
        @comments = @travel.comments
        @comment = Comment.new
    end

    def edit
        @travel = Travel.find(params[:id])
    end

    def update
        travel = Travel.find(params[:id])
        if travel.update(travel_params)
          redirect_to :action => "show", :id => travel.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        travel = Travel.find(params[:id])
        travel.destroy
        redirect_to action: :index
    end
    
    private
    def travel_params
        params.require(:travel).permit(:body,:image,:category)
    end
end
