class ReportTable
  attr_reader :report

  def initialize(report)
    @report = report

    build_table
  end

  def table
    @table
  end

  private

  def build_table
    @table = Terminal::Table.new.tap do |t|
      t.title = report.title
      t.headings = report.headings

      report.rows.each do |row|
        t.add_row row.table_row
      end
    end
  end
end
