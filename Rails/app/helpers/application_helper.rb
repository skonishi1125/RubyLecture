module ApplicationHelper
  # リンクの表示名とパスを受け取る
  def header_link_item(name, path)
    class_name = 'nav-item'
    # もし表示するページのパスと、引数のパスが同じだったらclass_にactiveを追加
    class_name << 'active' if current_page?(path)

    # 任意のhtmliタグを作るヘルパ <li><a></a></li>という形でできる
    content_tag :li, class: class_name do
      link_to name, path, class: 'nav-link'
    end

  end
end
