class BaseReport
  def print
    puts table
  end

  private

  def table
    ReportTable.new(self).table
  end
end
