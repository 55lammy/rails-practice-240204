class BulletinBoardController < ApplicationController
  layout 'bb'

  # -------------------------------------------------------------------
  TABLE_FILE_PATH = "tmp/bb_table.txt"
  ONCE_DAY = 24 * 60 * 60

  # -------------------------------------------------------------------
  def initialize
    super

    # テーブルをファイルからインポート (無ければテーブル新規作成)
    begin
      @bb_table = JSON.parse(File.read(TABLE_FILE_PATH))
    rescue
      @bb_table = Hash.new
    end

    # 古い投稿を自動削除
    @bb_table.each do |key,obj|
      if Time.now.to_i - key.to_i > ONCE_DAY then
        @bb_table.delete(key)
      end
    end
    # 自動削除後に一旦再エクスポート
    File.write(TABLE_FILE_PATH, @bb_table.to_json)

  end

  # -------------------------------------------------------------------
  def index
    # TODO 要修正 画面上のSUBMITボタンで投稿したのち、F5リロードすると、前回投稿履歴が再投稿されてしまう
    if request.post? then
      # 投稿の追加
      obj = MyData.new(msg:params['msg'], name:params['name'])
      @bb_table[Time.now.to_i] = obj

      # エクスポート
      bb_data_json = @bb_table.to_json
      File.write(TABLE_FILE_PATH, bb_data_json)

      # to_json により @bb_table が一旦ハッシュデータ化してしまっているので、再度インポートしてテーブル形式で持ち直す
      @bb_table = JSON.parse(bb_data_json)
    end
  end

end


# =====================================================================
class MyData
  attr_accessor :name
  attr_accessor :msg

  def initialize(msg: nil, name: nil)
    self.name = name
    self.msg = msg
  end
end

# EOF
