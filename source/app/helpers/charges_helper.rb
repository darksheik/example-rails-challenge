module ChargesHelper
  def user_map(relation)
    relation.map { |user| [['User - ',user.first_name,' ',user.last_name].join,['User-',user.id].join] }
  end

  def companies_map(relation)
    relation.map { |company| [['Company - ',company.name].join,['Company-',company.id].join] }
  end
end
