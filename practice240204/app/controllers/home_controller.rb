class HomeController < ApplicationController

  def index
    # URI にクエリパラメタが付与されていれば使用する。 (例) home/index?msg=Bob
    if params['msg'] != nil then
      msg = 'Hello ' + params['msg'] + '-san.'
    else
      msg = 'Hello world.   hoge piyo huga あいうえお'
    end

    my_html = '
      <html>
      <body>
        <h1>trial page 001</h1>
        <p>' + msg + '</p>
      </body>
      </html>
      '
      render html: my_html.html_safe  # html_safe をつけることで html文がエスケープ処理されない
  end

end
