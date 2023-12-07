module Aria
  def within_aria(label, &block)
    within("[aria-title='#{label}']", &block)
  end
end
