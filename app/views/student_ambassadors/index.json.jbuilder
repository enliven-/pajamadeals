json.array!(@student_ambassadors) do |student_ambassador|
  json.extract! student_ambassador, :id, :name, :mobile, :year, :branch, :college
  json.url student_ambassador_url(student_ambassador, format: :json)
end
