class HomeController < ApplicationController

  def index
    msg = '
      <html>
      <body>
        <h1>trial page 001</h1>
        <p>Hello world.   hoge piyo huga あいうえお</p>
      </body>
      </html>
      '
      render html: msg.html_safe  # html_safe をつけることで html文がエスケープ処理されない
  end

end
