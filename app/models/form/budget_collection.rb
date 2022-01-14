class Form::BudgetCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :budgets

  # 初期化メソッド
  def initialize(attributes = {})
    super attributes
    #　budgetsが存在しない時　5回繰り返して新規登録フォームを配列する
    self.budgets = DEFAULT_ITEM_COUNT.times.map{ Form::Budget.new } unless budgets.present?
  end

  def budgets_attributes=(attributes)
    self.budgets = attributes.map do |_, budget_attributes|
      Form::Budget.new(budget_attributes)
    end
  end

  def valid?
    valid_budgets = budgets.map(&:valid?).all?
    super && valid_budgets
  end

  def save
    return false unless valid?
    Budget.transaction { budgets.each(&:save!) }
    true
  end



end