module CommercialHelper
  
  def get_params
    return "?#{@param_sort[:name]}=" if params[:page]==nil
    return "?#{@param_page[:name]}=#{@param_page[:value]}&#{@param_sort[:name]}=" if params[:page]!=nil
    return ''
  end
  
end