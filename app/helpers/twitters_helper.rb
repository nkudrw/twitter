module TwittersHelper
    def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'index'
      confirm_twitters_path
    elsif action_name == 'edit'
      twitter_path
    end
  end
  
    def back_timeline
      if action_name != 'index'
        link_to "タイムラインにもどる", twitters_path 
      end
    end
    
    def tweet_placeholder
      if action_name == 'index' || action_name == 'new'
        "いまどうしてる？"
      else
        ""
      end
    end
end
