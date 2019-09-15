class UserParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name,
    											:name_kana,
    											:telephone_number,
    											:email,
    											:postcode,
    											:address,
    											:password)
  end
end