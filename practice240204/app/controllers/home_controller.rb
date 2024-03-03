class HomeController < ApplicationController

  # [240303]
  # app/views/layouts/study01.html.erb を使用する指定。指定なしの場合、 index.html.erb をデフォルトで使用する。
  layout 'study01'

  
  def index
    # [240303]
    @header = 'layout header study01 240303'
    @footer = 'copyright M-YAMA 2024'
    @title = 'tab title 240303'
    @msg = 'study01 240303 test hoge piyo'
    
    
    # [240218]
    # views/home/index.html.erb の内容を表示させる

    # # URI にクエリパラメタが付与されていれば使用する。 (例) home/index?msg=Bob
    # if params['msg'] != nil then
    #   msg = 'Hello ' + params['msg'] + '-san.'
    # else
    #   msg = 'Hello world.   hoge piyo huga あいうえお'
    # end

    # my_html = '
    #   <html>
    #   <body>
    #     <h1>trial page 001</h1>
    #     <p>' + msg + '</p>
    #   </body>
    #   </html>
    #   '
    # render html: my_html.html_safe  # html_safe をつけることで html文がエスケープ処理されない
  end

end
