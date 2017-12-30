#!/usr/bin/env ruby

# print a latex or ascii table from the duration data in csv format
#
require 'csv'
require 'pp'

if ARGV.size == 0
  puts "usage: #{__FILE__} <inputfile.csv>"
  exit
end


CSV.open(ARGV.first, 'r') do |csv|
  # convert rows to array of hashes
  header = csv.shift.map { |e| e.to_sym }
  data = []

  csv.each do |row|
    dataset = {}
    row.each_with_index do |e, index|
      dataset[header[index]] = e
    end
    data << dataset
  end

  data_by_subject = {}
  data.each do |d|
    next if d[:sid].nil?

    # limit duration
    d[:duration] = 4500 if d[:duration].to_i > 4500
    d[:duration] = '-' if d[:duration] == "0"

    data_by_subject ||= {}
    data_by_subject[d[:sid]] ||= {}
    data_by_subject[d[:sid]][:user] = d[:user]
    data_by_subject[d[:sid]][:groupid] = d[:groupid]
    data_by_subject[d[:sid]][:group] = d[:group]
    data_by_subject[d[:sid]][:task] ||= {}
    data_by_subject[d[:sid]][:task][d[:task]] ||= {}
    data_by_subject[d[:sid]][:task][d[:task]][d[:method]] = d
  end

  #puts data_by_subject.inspect
  #pp data_by_subject
  asciitable = {}
  asciitable[:rowstart] = '|'
  asciitable[:celldelimiter] = '|'
  asciitable[:rowend] = "|\n"

  latextable = {}
  latextable[:rowstart] = "\\hline\n"
  latextable[:celldelimiter] = '&'
  latextable[:rowend] = "\\\\\n"

  latextable[:pre] = %q[
\begin{tabular}{| c || c | c | c | c | c | c | c | c | c | c |}
\hline
\multirow{2}{*}{subject} & \multicolumn{2}{c|}{Task 1} & 
				\multicolumn{3}{c|}{Task 2.1} &
				\multicolumn{3}{c|}{Task 2.2} &
				\multicolumn{2}{c|}{Task 3} \\\
				& ERB & KDB & HOST & AUG & KDB & INI & AUG & KDB & ERB & KDB \\\
\hline
]

  latextable[:post] = %q[
\hline
\multicolumn{11}{l}{\small{Duration values in seconds}}
\end{tabular}
]


  t = asciitable
  t = latextable


  puts t[:pre] if t.include? :pre
  data_by_subject.each do |id, sdata|
    print t[:rowstart]
    print "#{'% 3s' % id} #{t[:celldelimiter]}"
    print "#{'% 5s' % sdata[:task]["task1"]["method_A"][:duration]} #{t[:celldelimiter]}"
    print "#{'% 5s' % sdata[:task]["task1"]["method_B"][:duration]} #{t[:celldelimiter]}"

    print "#{'% 5s' % sdata[:task]["task2.1"]["method_A"][:duration]} #{t[:celldelimiter]}"
    print "#{'% 5s' % sdata[:task]["task2.1"]["method_C"][:duration]} #{t[:celldelimiter]}"
    print "#{'% 5s' % sdata[:task]["task2.1"]["method_D"][:duration]} #{t[:celldelimiter]}"

    print "#{'% 5s' % sdata[:task]["task2.2"]["method_A"][:duration]} #{t[:celldelimiter]}"
    print "#{'% 5s' % sdata[:task]["task2.2"]["method_C"][:duration]} #{t[:celldelimiter]}"
    print "#{'% 5s' % sdata[:task]["task2.2"]["method_D"][:duration]} #{t[:celldelimiter]}"

    print "#{'% 5s' % sdata[:task]["task3.2"]["method_A"][:duration]} #{t[:celldelimiter]}"
    print "#{'% 5s' % sdata[:task]["task3.2"]["method_B"][:duration]} #{t[:rowend]}"
  end
  puts t[:post] if t.include? :post
end
