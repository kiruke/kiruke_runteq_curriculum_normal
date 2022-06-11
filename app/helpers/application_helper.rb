module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'RUNTEQ BOARD APP'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def admin_page_title(page_title = '')
    base_title = 'RUNTEQ BOARD APP(管理画面)'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

end
