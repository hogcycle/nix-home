{ pkgs, ... }: 
{
programs.superfile = {
  enable = true;
  settings = { 
    theme = "nord"; 
  }; 
  themes.nord = {
    code_syntax_highlight = "nord";
    
    file_panel_border = "#4C566A";
    sidebar_border = "#2E3440";
    footer_border = "#4C566A";
    
    file_panel_border_active = "#81A1C1";
    sidebar_border_active = "#88C0D0";
    footer_border_active = "#A3BE8C";
    modal_border_active = "#5E81AC";
    
    full_screen_bg = "#2E3440";
    file_panel_bg = "#2E3440";
    sidebar_bg = "#2E3440";
    footer_bg = "#2E3440";
    modal_bg = "#3B4252";
    
    full_screen_fg = "#D8DEE9";
    file_panel_fg = "#D8DEE9";
    sidebar_fg = "#D8DEE9";
    footer_fg = "#D8DEE9";
    modal_fg = "#D8DEE9";
    
    cursor = "#81A1C1";
    correct = "#A3BE8C";
    error = "#BF616A";
    hint = "#88C0D0";
    cancel = "#D08770";
    
    gradient_color = [
      "#5E81AC"
      "#81A1C1"
    ];
    
    file_panel_top_directory_icon = "#A3BE8C";
    file_panel_top_path = "#88C0D0";
    file_panel_item_selected_fg = "#ECEFF4";
    file_panel_item_selected_bg = "#434C5E";
    
    sidebar_title = "#88C0D0";
    sidebar_item_selected_fg = "#ECEFF4";
    sidebar_item_selected_bg = "#434C5E";
    sidebar_divider = "#4C566A";
    
    modal_cancel_fg = "#2E3440";
    modal_cancel_bg = "#D08770";
    modal_confirm_fg = "#2E3440";
    modal_confirm_bg = "#A3BE8C";
    
    help_menu_hotkey = "#81A1C1";
    help_menu_title = "#88C0D0";
  };
};
}
